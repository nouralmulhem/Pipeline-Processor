`include "Buffer.v"
`include "Fetch.v"
`include "FD_Buffer.v"
`include "Decode.v"
`include "DE_Buffer.v"
`include "Execute.v"
`include "EM_Buffer.v"
`include "MemoryStage.v"
`include "MW_Buffer.v"
`include "WriteBack.v"



module Processor(clk1, clk2, fetchReset, inputPort, outputPort);
    input clk1,clk2,fetchReset;
    input [15:0] inputPort;
    output [15:0] outputPort;

/*-------------------------------------------------------------------------------------------------------------------------*/
    // Hazard Detection Unit

    // [Spop-PopPc-PushPc-PushPop-In-Out-Branch-MTR-MEMW-MEMR-reg_write-ALU_src-ALU_OP]
    wire [12:0] controlSignalDEOut;//[Basma] [Output from DE_BufferModule] // Moved Up

    wire [2:0] writeAddressDEOut1, writeAddressDEOut2; 

    wire [15:0] FDBufferInstOut;

    wire branch_output;

    wire flush_signal, stall_signal;

    HDU HDUModule(
        .mem_read(controlSignalDEOut[3]),
        .write_add(writeAddressDEOut1),
        .src(FDBufferInstOut[11:9]),
        .dst(FDBufferInstOut[8:6]),
        .count(2'b0),
        .int(1'b0),
        .branch_out(1'b0), // branch_output
        .ret(1'b0),
        .flush(flush_signal),
        .stall(stall_signal)
        );


/*-------------------------------------------------------------------------------------------------------------------------*/
    //instruction to be executed
    wire [15:0] fetchedInstOut;
    // wire branch_output; // Moved Above
    wire [15:0] readDataDEOut1, readDataDEOut2;

    Fetch FetchModule(.branch(branch_output),.branchAdd(readDataDEOut1),.reset(fetchReset),.clk(clk1),.stall(stall_signal),.instruction(fetchedInstOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    //instruction in fetch/decode buffer
    // wire [15:0] FDBufferInstOut; // Moved Above

    FD_Buffer FD_BufferModule(.instruction_in(fetchedInstOut),.clk(clk2),.stall(stall_signal),.instruction_out(FDBufferInstOut));
 /*-------------------------------------------------------------------------------------------------------------------------*/
    //control signal generated from decode stage
    wire [12:0] controlSignalDecodeOut;//[Basma]

    //output data from register file
    wire [15:0] readDataDecodeOut1, readDataDecodeOut2;

    wire [9:0] decodeBufferOut;

    //Write back stage declarations
    wire regWriteBack;
    wire [15:0] writeDataWriteBackOut;
    wire [2:0] writeAddressWriteBackOut;
    
    // [Spop-PopPc-PushPc-PushPop-In-Out-Branch-MTR-MEMW-MEMR-reg_write-ALU_src-ALU_OP]
    // wire [12:0] controlSignalDEOut;//[Basma] [Output from DE_BufferModule] // Moved Up


    Decode DecodeModule(.clk(clk1),
                        .reset(fetchReset),
                        .instruction(FDBufferInstOut), 
                        .writeAddress(writeAddressWriteBackOut), 
                        .writeEnable(regWriteBack), 
                        .writeData(writeDataWriteBackOut), 
                        .aluSrc(controlSignalDEOut[1]),//alusrc of previous instruction Immediate Case
                        .controlSignal(controlSignalDecodeOut), 
                        .readData1(readDataDecodeOut1), 
                        .readData2(readDataDecodeOut2));
    
    //3 bits write address - 4 bits function
    Buffer #(10) DecodeBufferModule(.clk(clk1),.in({FDBufferInstOut[11:9],FDBufferInstOut[8:6],FDBufferInstOut[3:0]}),.out(decodeBufferOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    // wire [10:0] controlSignalDEOut; Moved Above
    wire [15:0] readDataDEIn2;
    // wire [2:0] writeAddressDEOut1, writeAddressDEOut2; // Moved Above
    wire [3:0] functionDEOut;

    assign readDataDEIn2 = (controlSignalDecodeOut[8] == 1'b1) ? inputPort : readDataDecodeOut2;

    DE_Buffer DE_BufferModule(.clk(clk2),
                            .controlSignals_in(controlSignalDecodeOut), 
                            .readData1_in(readDataDecodeOut1), 
                            .readData2_in(readDataDEIn2), 
                            .writeAdd_in1(decodeBufferOut[6:4]), 
                            .writeAdd_in2(decodeBufferOut[9:7]), 
                            .function_in(decodeBufferOut[3:0]), 
                            .stall(stall_signal), // stall
                            .controlSignals_out(controlSignalDEOut), 
                            .readData1_out(readDataDEOut1), 
                            .readData2_out(readDataDEOut2), 
                            .writeAdd_out1(writeAddressDEOut1), 
                            .writeAdd_out2(writeAddressDEOut2), 
                            .function_out(functionDEOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [15:0] aluResultExecuteOut;
    wire [28:0] executeBufferOut;
    
    //from EM_buffer
    wire [2:0] writeAddressEMOut;
    wire [9:0] controlSignalEMOut;
    wire [15:0] aluResultEMOut;

    //from MW_buffer
    wire [2:0] controlSignalMWOut;
    wire [2:0] writeAddressMWOut;
    wire [15:0] memoryDataMWOut;

    wire [15:0] readDataFU1, readDataFU2; 

    FU_integration FUModule(
    .wr_add(writeAddressDEOut1), 
    .wr_add2(writeAddressDEOut2), 
    .wr_add_alu(writeAddressEMOut), 
    .wb_alu(controlSignalEMOut[0]), 
    .alu_data(aluResultEMOut),
    .wr_add_mem(writeAddressMWOut),
    .wb_mem(controlSignalMWOut[0]), 
    .mem_data(memoryDataMWOut),
    .Read_Data1(readDataDEOut1), 
    .Read_Data2(readDataDEOut2),
    .Read_Data1_FU(readDataFU1),
    .Read_Data2_FU(readDataFU2));

    Execute ExecuteModule(.aluOp(controlSignalDEOut[0]),
                        .branch(controlSignalDEOut[6]),
                        .aluSrc(controlSignalDEOut[1]),
                        .clk(clk1),
                        .readData1(readDataFU1),
                        .readData2(readDataFU2),
                        .func(functionDEOut),
                        .immediateValue(FDBufferInstOut),
                        .aluResult(aluResultExecuteOut),
                        .branch_output(branch_output));


    //10 bits control signals[reg_write-MEMR-MEMW-MTR-Out-In-PushPop-PushPc-PopPc-Spop] [!ALU_OP-ALU_src-Branch]- 16 bits read data 2 - 3 bits write address
    Buffer #(29) ExecuteBufferModule(.clk(clk1),
                                    .in({controlSignalDEOut[12:7],controlSignalDEOut[5:2],readDataFU2,writeAddressDEOut1}),
                                    .out(executeBufferOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [15:0] readDataEMOut2;

    //[controlSignalEMOut] = [Push-StackOp-Out-In-RegWrite-MTR-MemR-MemW]old

    //[controlSignalEMOut] = [Spop-PopPc-PushPc-PushPop-In-Out-MTR-MEMW-MEMR-reg_write]
    EM_Buffer EM_BufferModule(.controlSignals_in(executeBufferOut[28:19]),
                            .ALUData_in(aluResultExecuteOut),
                            .ReadData2_in(executeBufferOut[18:3]),
                            .WriteAdd_in(executeBufferOut[2:0]),
                            .clk(clk2),
                            .controlSignals_out(controlSignalEMOut),
                            .ALUData_out(aluResultEMOut),
                            .ReadData2_out(readDataEMOut2),
                            .WriteAdd_out(writeAddressEMOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [15:0] memoryDataOut;
    MemoryStage MemoryModule (.clk(clk1), 
                            .mem_read(controlSignalEMOut[1]), 
                            .mem_write(controlSignalEMOut[2]),
                            .stackOp(controlSignalEMOut[9]),
                            .pushPop(controlSignalEMOut[6]),
                            .reset(fetchReset),
                            .in(controlSignalEMOut[5]),
                            .out(controlSignalEMOut[4]),
                            .read_add(aluResultEMOut),
                            .write_data(readDataEMOut2),
                            .alu_data(aluResultEMOut),
                            .mem_to_reg(controlSignalEMOut[3]),
                            .data_to_write(memoryDataOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [5:0] memoryBufferOut;

    //[memoryBufferOut[5:3]] = [In-Out-RegWrite]
    Buffer #(6) MemoryBufferModule(.clk(clk1),
                                .in({controlSignalEMOut[5:4],controlSignalEMOut[0],writeAddressEMOut}),
                                .out(memoryBufferOut));    
/*-------------------------------------------------------------------------------------------------------------------------*/
    
    //[controlSignalMWOut] = [In-Out-RegWrite]
    MW_Buffer MW_BufferModule(.clk(clk2),
                            .controlSignals_in(memoryBufferOut[5:3]),
                            .alu_data_in(memoryDataOut),
                            .write_add_in(memoryBufferOut[2:0]),
                            .controlSignals_out(controlSignalMWOut),
                            .alu_data_out(memoryDataMWOut),
                            .write_add_out(writeAddressMWOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    //Write back declarations are in the decode stage
    WriteBack WriteBackModul(.controlSignalsIn(controlSignalMWOut), //[In-Out-RegWrite]
                            .writeDataIn(memoryDataMWOut), 
                            .writeAddressIn(writeAddressMWOut),
                            .regWrite(regWriteBack),
                            .writeDataOut(writeDataWriteBackOut),
                            .writeAddressOut(writeAddressWriteBackOut),
                            .outputPort(outputPort));
    
endmodule
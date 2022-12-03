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



module Processor();

    // clk1 --> PC, Register file, Memory
    // clk2 --> buffers
    reg clk1, clk2;

/*-------------------------------------------------------------------------------------------------------------------------*/
    // reset PC value to zero
    reg fetchReset;

    //instruction to be executed
    wire [15:0] fetchedInstOut;

    Fetch FetchModule(.branch(1'b0),.branchAdd({16{1'b0}}),.reset(fetchReset),.clk(clk1),.instruction(fetchedInstOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    //instruction in fetch/decode buffer
    wire [15:0] FDBufferInstOut; 

    FD_Buffer FD_BufferModule(.instruction_in(fetchedInstOut),.clk(clk2),.instruction_out(FDBufferInstOut));
 /*-------------------------------------------------------------------------------------------------------------------------*/
    //control signal generated from decode stage
    wire [10:0] controlSignalDecodeOut;

    //output data from register file
    wire [15:0] readDataDecodeOut1, readDataDecodeOut2;

    wire [5:0] decodeBufferOut;

    //Write back stage declarations
    wire regWriteBack;
    wire [15:0] writeDataWriteBackOut;
    wire [2:0] writeAddressWriteBackOut;

    Decode DecodeModule(.clk(clk1),
                        .instruction(FDBufferInstOut), 
                        .writeAddress(writeAddressWriteBackOut), 
                        .writeEnable(regWriteBack), 
                        .writeData(writeDataWriteBackOut), 
                        .controlSignal(controlSignalDecodeOut), 
                        .readData1(readDataDecodeOut1), 
                        .readData2(readDataDecodeOut2));
    
    //10 bits 0s - 3 bits write address - 3 bits function
    Buffer #(6) DecodeBufferModule(.clk(clk1),.in({FDBufferInstOut[9:7],FDBufferInstOut[2:0]}),.out(decodeBufferOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [10:0] controlSignalDEOut;
    wire [15:0] readDataDEOut1, readDataDEOut2;
    wire [2:0] writeAddressDEOut, functionDEOut;

    DE_Buffer DE_BufferModule(.clk(clk2),
                            .controlSignals_in(controlSignalDecodeOut), 
                            .readData1_in(readDataDecodeOut1), 
                            .readData2_in(readDataDecodeOut2), 
                            .writeAdd_in(decodeBufferOut[5:3]), 
                            .function_in(decodeBufferOut[2:0]), 
                            .controlSignals_out(controlSignalDEOut), 
                            .readData1_out(readDataDEOut1), 
                            .readData2_out(readDataDEOut2), 
                            .writeAdd_out(writeAddressDEOut), 
                            .function_out(functionDEOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [15:0] aluResultExecuteOut;
    wire [26:0] executeBufferOut;

    Execute ExecuteModule(.aluOp(controlSignalDEOut[0]),
                        .branch(controlSignalDEOut[5]),
                        .aluSrc(controlSignalDEOut[1]),
                        .clk(clk1),
                        .readData1(readDataDEOut1),
                        .readData2(readDataDEOut2),
                        .func(functionDEOut),//010
                        .aluResult(aluResultExecuteOut));

    //8 bits control signals[MEMW-MEMR-MTR-reg write-In-Out-Stack op-Push] - 16 bits read data 2 - 3 bits write address
    Buffer #(27) ExecuteBufferModule(.clk(clk1),
                                    .in({controlSignalDEOut[10:6],controlSignalDEOut[4:2],readDataDEOut2,writeAddressDEOut}),
                                    .out(executeBufferOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [7:0] controlSignalEMOut;
    wire [15:0] aluResultEMOut, readDataEMOut2;
    wire [2:0] writeAddressEMOut;

    //[controlSignalEMOut] = [Push-StackOp-Out-In-RegWrite-MTR-MemR-MemW]
    EM_Buffer EM_BufferModule(.controlSignals_in(executeBufferOut[26:19]),
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
                            .mem_write(controlSignalEMOut[0]),
                            .read_add(aluResultEMOut),
                            .write_data(readDataEMOut2),
                            .alu_data(aluResultEMOut),
                            .mem_to_reg(controlSignalEMOut[2]),
                            .data_to_write(memoryDataOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [5:0] memoryBufferOut;

    //[memoryBufferOut[5:3]] = [Out-In-RegWrite]
    Buffer #(6) MemoryBufferModule(.clk(clk1),
                                .in({controlSignalEMOut[5:3],writeAddressEMOut}),
                                .out(memoryBufferOut));    
/*-------------------------------------------------------------------------------------------------------------------------*/
    wire [2:0] controlSignalMWOut;
    wire [15:0] memoryDataMWOut;
    wire [2:0] writeAddressMWOut; 
    
    //[controlSignalMWOut] = [Out-In-RegWrite]
    MW_Buffer MW_BufferModule(.clk(clk2),
                            .controlSignals_in(memoryBufferOut[5:3]),
                            .alu_data_in(memoryDataOut),
                            .write_add_in(memoryBufferOut[2:0]),
                            .controlSignals_out(controlSignalMWOut),
                            .alu_data_out(memoryDataMWOut),
                            .write_add_out(writeAddressMWOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    //Write back declarations are in the decode stage

    WriteBack WriteBackModul(.controlSignalsIn(controlSignalMWOut), //[Out-In-RegWrite]
                            .writeDataIn(memoryDataMWOut), 
                            .writeAddressIn(writeAddressMWOut),
                            .regWrite(regWriteBack),
                            .writeDataOut(writeDataWriteBackOut),
                            .writeAddressOut(writeAddressWriteBackOut));
/*-------------------------------------------------------------------------------------------------------------------------*/
    initial begin
        clk1 = 1;
        clk2 = 0;
        fetchReset = 1;

        #2
        fetchReset = 1'b0; //begin 
    end

    always #(5) clk2 = ~clk2; //Buffers
    always @(clk2) begin
        #1 clk1 = ~clk1; //Stages
    end
endmodule
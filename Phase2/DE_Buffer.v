//D/E Buffer 
/*
Buffer between Decode and Execute Stages
inputs:
  -controlSignals_in (11 bits): control signals from the Control Unit includes: (ALUOP/Regwr/ALUsrc/Branch/MemtoReg/Push/Out/In)
  -readData1_in (16 bits)
  -readData2_in (16 bits)
  -writeAdd_in (3 bits)
  -function_in (3 bits)
  -clk:clock
  -flush: signal to flush the buffer
  -PC
output:
  -controlSignals_out (8 bits): control signals from the Control Unit
  -readData1_out (16 bits)
  -readData2_out (16 bits)
  -writeAdd_out1 (3 bits)
  -function_out (3 bits)   
  -PC

*/
module DE_Buffer(clk, controlSignals_in, PC_in, interrupt, readData1_in, readData2_in, writeAdd_in1, writeAdd_in2, function_in, flush, controlSignals_out, readData1_out, readData2_out, writeAdd_out1, writeAdd_out2,function_out, PC_out,interrupt_out);
    input [13:0] controlSignals_in;
    input [31:0]PC_in;
    input [15:0] readData1_in, readData2_in;
    input [2:0] writeAdd_in1, writeAdd_in2;
    input [3:0] function_in;
    input clk, flush, interrupt;
    // input stall;

    output reg [13:0] controlSignals_out;
    output reg [15:0] readData1_out, readData2_out;
    output reg [2:0] writeAdd_out1, writeAdd_out2;
    output reg [3:0] function_out;
    output reg [31:0]PC_out;
    output reg interrupt_out;


    always @(posedge clk) begin
    // if(stall !== 1'b1)begin
      PC_out = PC_in;
      if(flush===1'b1) begin
        controlSignals_out=15'b0;
        interrupt_out = 1'b0;
      end else begin
        interrupt_out = interrupt;
        controlSignals_out = controlSignals_in;
        readData1_out = readData1_in;
        readData2_out = readData2_in;
        writeAdd_out1 = writeAdd_in1;
        writeAdd_out2 = writeAdd_in2;
        function_out = function_in;
      end
    // end
    end
endmodule
//D/E Buffer 
/*
Buffer between Decode and Execute Stages
inputs:
  -controlSignals_in (11 bits): control signals from the Control Unit includes: (ALUOP/Regwr/ALUsrc/Branch/MemtoReg/Push/Out/In)
  -ReadData1_in (16 bits)
  -ReadData2_in (16 bits)
  -WriteAdd_in (3 bits)
  -Function_in (3 bits)
  -clk:clock
output:
  -controlSignals_out (8 bits): control signals from the Control Unit
  -ReadData1_out (16 bits)
  -ReadData2_out (16 bits)
  -WriteAdd_out (3 bits)
  -Function_out (3 bits)   
*/
module DE_Buffer(clk, controlSignals_in, ReadData1_in, ReadData2_in, WriteAdd_in, Function_in, controlSignals_out, ReadData1_out, ReadData2_out, WriteAdd_out, Function_out);
    input [10:0] controlSignals_in;
    input [15:0] ReadData1_in, ReadData2_in;
    input [2:0] WriteAdd_in;
    input [2:0] Function_in;
    input clk;

    output reg [10:0] controlSignals_out;
    output reg [15:0] ReadData1_out, ReadData2_out;
    output reg [2:0] WriteAdd_out;
    output reg [2:0] Function_out;

    always @(posedge clk) begin
        controlSignals_out = controlSignals_in;
        ReadData1_out = ReadData1_in;
        ReadData2_out = ReadData2_in;
        WriteAdd_out = WriteAdd_in;
        Function_out = Function_out;
    end
endmodule
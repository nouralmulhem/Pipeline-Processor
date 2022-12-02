//E/M Buffer 
/*
Buffer between Fetch and Decode Stages
inputs:
  -instruction_in(32 bit):input instruction
  -clk:clock
output:
  -instruction_out(32 bit):output instruction   
*/
module EM_Buffer (controlSignals_in,ALUData_in,ReadData2_in,WriteAdd_in,clk,controlSignals_out,ALUData_out,ReadData2_out,WriteAdd_out);
  input[7:0] controlSignals_in;
  input [15:0] ALUData_in,ReadData2_in;
  input [2:0] WriteAdd_in;
  input clk;

  output reg [7:0] controlSignals_out;
  output reg [15:0] ALUData_out,ReadData2_out;
  output reg [2:0] WriteAdd_out;

  always @(posedge clk)begin
    controlSignals_out = controlSignals_in;
    ALUData_out = ALUData_in;
    ReadData2_out = ReadData2_in;
    WriteAdd_out = WriteAdd_in;
    end
endmodule
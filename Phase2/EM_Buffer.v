//E/M Buffer 
/*
Buffer between Fetch and Decode Stages
inputs:
  -instruction_in(32 bit):input instruction
  -clk:clock
  -PC

output:
  -instruction_out(32 bit):output instruction   
  -PC

*/
module EM_Buffer (controlSignals_in,ALUData_in,ReadData2_in,WriteAdd_in,clk,PC_in,controlSignals_out,ALUData_out,ReadData2_out,WriteAdd_out,PC_out);
  input[9:0] controlSignals_in;
  input [15:0] ALUData_in,ReadData2_in;
  input [2:0] WriteAdd_in;
  input clk;
  input [31:0]PC_in;


  output reg [9:0] controlSignals_out;
  output reg [15:0] ALUData_out,ReadData2_out;
  output reg [2:0] WriteAdd_out;
  output reg [31:0]PC_out;


  always @(posedge clk)begin
    PC_out = PC_in;
    controlSignals_out = controlSignals_in;
    ALUData_out = ALUData_in;
    ReadData2_out = ReadData2_in;
    WriteAdd_out = WriteAdd_in;
    end
endmodule
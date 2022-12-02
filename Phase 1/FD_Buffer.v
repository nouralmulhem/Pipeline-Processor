//F/D Buffer 
/*
Buffer between Fetch and Decode Stages
inputs:
  -instruction_in(32 bit):input instruction
  -clk:clock
output:
  -instruction_out(32 bit):output instruction   
*/
module FD_Buffer (instruction_in,clk,instruction_out);
input [31:0]instruction_in;
input clk;
output reg [31:0]instruction_out;

always @(posedge clk)
begin
instruction_out = instruction_in;
end
endmodule
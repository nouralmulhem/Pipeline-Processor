//F/D Buffer 
/*
Buffer between Fetch and Decode Stages
inputs:
  -instruction_in(32 bit):input instruction
  -clk:clock
  -stall: signal to stall the buffer
output:
  -instruction_out(32 bit):output instruction   
*/
module FD_Buffer (instruction_in,clk,stall,instruction_out);
input [15:0]instruction_in;
input clk, stall;
output reg [15:0]instruction_out;

always @(posedge clk)
begin
if(stall!==1'b1) begin
  instruction_out = instruction_in;
end
end
endmodule
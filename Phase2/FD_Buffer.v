//F/D Buffer 
/*
Buffer between Fetch and Decode Stages
inputs:
  -instruction_in(32 bit):input instruction
  -clk:clock
  -flush: signal to flush the buffer
  -PC

output:
  -instruction_out(32 bit):output instruction  
  -PC

*/
module FD_Buffer (instruction_in,PC_in,clk,interrupt,flush,instruction_out,PC_out,interrupt_out);
input [15:0]instruction_in;
input [31:0]PC_in;
input clk, flush, interrupt;
output reg [15:0]instruction_out;
output reg [31:0]PC_out;
output reg interrupt_out;

always @(posedge clk)
begin
PC_out = PC_in;
if(flush===1'b1) begin
  instruction_out = 15'b0;
  interrupt_out = 1'b0;
end else begin
  instruction_out = instruction_in;
  interrupt_out = interrupt;
end
end
endmodule
//Instruction Memory
/*
Instruction memory 2 MB in size width 16 bit( words )
inputs:
  - clk:clock
  - Oldpc
  - reset
output:
  - Next pc
*/
module MemoInst(clk,
pc,
inst
);
input clk;
input[31:0] pc;
integer i;
output reg [15:0]inst;

reg [15:0]memory [0:1048575];
	
always @ (posedge clk) begin
  inst=memory[pc];
end

endmodule
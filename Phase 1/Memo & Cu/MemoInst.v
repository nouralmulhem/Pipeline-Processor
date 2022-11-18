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
reset,
inst
);
input clk,reset;
input[31:0] pc;
integer i;
output reg [15:0] inst;

reg [1048575:0] memory [0:15];
	
wire r =clk||reset;
always @ (posedge r) begin
  if(reset==1'b1)begin
	for(i=0;i<1048576;i=i+1)begin
		memory[i]='b0;	
	end
  end
  else begin
  	inst=memory[pc];
  end
end

endmodule
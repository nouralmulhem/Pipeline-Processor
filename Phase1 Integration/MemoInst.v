//Instruction Memory
/*
Instruction memory 2 MB in size width 16 bit( words ) [Read Only memory]
inputs:
  - pc: Address instrcution to read
output:
  - inst (16 bit):instruction
*/
module MemoInst(pc,
inst
);
input[31:0] pc;
//integer i;
output [15:0]inst;

reg [15:0]memory [0:1048575];

assign inst=memory[pc];

endmodule
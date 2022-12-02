
//Controle Signal
/*
Controle Unit which send controle signals 
inputs:
  - opcode
output:
  - all output signals
  -ALU OP
  -ALU src
  -MEMW
  -MEMR
  -Memory to Reg(MTR)
  -reg write

  -Branch
  -In
  -Out
  -Stack op
  -Push
*/
module CU(
opcode,
ALU_OP,
ALU_src,
MEMW,
MEMR,
MTR,
reg_write,
Branch,
In,
Out,
Stack_op,
Push,
);
input [2:0] opcode;

output reg ALU_OP,ALU_src,MEMW,MEMR,MTR,reg_write,Branch,In,Out,Stack_op,Push;

always @ (*) begin
  if(opcode == 3'b001) begin   
//LDD
    ALU_OP=1'b1;
    ALU_src=1'b0;
    MEMW=1'b0;
    MEMR=1'b1;
    MTR=1'b1;
    reg_write=1'b1;

    Branch=1'b0;
    In=1'b0;
    Out=1'b0;
    Stack_op=1'b0;
    Push=1'b0;

  end
  else if(opcode == 3'b010) begin
//STD
    ALU_OP=1'b0;
    ALU_src=1'b0;
    MEMW=1'b1;
    MEMR=1'b0;
    MTR=1'b0;
    reg_write=1'b0;

    Branch=1'b0;
    In=1'b0;
    Out=1'b0;
    Stack_op=1'b0;
    Push=1'b0;

  end  
  else if(opcode == 3'b011) begin
//ADD
    ALU_OP=1'b1;
    ALU_src=1'b0;
    MEMW=1'b0;
    MEMR=1'b0;
    MTR=1'b0;
    reg_write=1'b1;

    Branch=1'b0;
    In=1'b0;
    Out=1'b0;
    Stack_op=1'b0;
    Push=1'b0;

  end
  else if(opcode == 3'b100) begin
//NOT
    ALU_OP=1'b1;
    ALU_src=1'b0;
    MEMW=1'b0;
    MEMR=1'b0;
    MTR=1'b0;
    reg_write=1'b1;

    Branch=1'b0;
    In=1'b0;
    Out=1'b0;
    Stack_op=1'b0;
    Push=1'b0;

  end
  else if(opcode == 3'b101) begin
//NOP
    ALU_OP=1'b0;
    ALU_src=1'b0;
    MEMW=1'b0;
    MEMR=1'b0;
    MTR=1'b0;
    reg_write=1'b0;

    Branch=1'b0;
    In=1'b0;
    Out=1'b0;
    Stack_op=1'b0;
    Push=1'b0;
  end

end

endmodule
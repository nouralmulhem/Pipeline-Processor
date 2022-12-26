
//Controle Signal
/*
Controle Unit which send controle signals 
inputs:
  - opcode(4 bits):Opcode
output:
  -ALU OP
  -ALU src
  -reg write
  -MEMR
  -MEMW
  -Memory to Reg(MTR)
  -Branch
  -Out
  -In
  -PushPop
  -pushPc
  -popPc
  -spop
  // -flush
*/
module CU(
opcode,
interrupt,
ALU_OP,
ALU_src,
reg_write,
MEMR,
MEMW,
MTR,
Branch,
Out,
In,
PushPop,
PushPc,
PopPc,
Spop
// Flush
);
input [3:0] opcode;
input interrupt;
output ALU_OP,
ALU_src,
reg_write,
MEMR,
MEMW,
MTR,
Branch,
Out,
In,
PushPop,
PushPc,
PopPc,
Spop;
// Flush;

//1=>smame as call
assign ALU_OP=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
              (opcode == 4'b0001) ?1'b1://CLRC-SETC
              (opcode == 4'b0010)?1'b1://NOT
              (opcode == 4'b0011)?1'b1://INC
              (opcode == 4'b0100)?1'b1://DEC
              (opcode == 4'b0101)?1'b1://OUT
              (opcode == 4'b0110)?1'b1://IN
              (opcode == 4'b0111)?1'b1://
              (opcode == 4'b1000)?1'b0://
              (opcode == 4'b1001)?1'b0://
              (opcode == 4'b1010)?1'b0:1'b0;//


assign ALU_src=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
               (opcode == 4'b0001) ?1'b0://CLRC-SETC
               (opcode == 4'b0010)?1'b0://NOT
               (opcode == 4'b0011)?1'b0://INC
               (opcode == 4'b0100)?1'b0://DEC
               (opcode == 4'b0101)?1'b1://OUT
               (opcode == 4'b0110)?1'b0://IN
               (opcode == 4'b0111)?1'b0://
               (opcode == 4'b1000)?1'b0://
               (opcode == 4'b1001)?1'b0://
               (opcode == 4'b1010)?1'b0:1'b0;//


assign reg_write=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b1://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b1://DEC
                 (opcode == 4'b0101)?1'b1://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b1://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b0://
                 (opcode == 4'b1010)?1'b0:1'b0;//


assign MEMR=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b1://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b0://
                 (opcode == 4'b1010)?1'b1:1'b0;//


assign MEMW=(interrupt==1'b1)?1'b1:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b1://IN
                 (opcode == 4'b0111)?1'b0://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b1://
                 (opcode == 4'b1010)?1'b0:1'b0;//

                 
assign MTR=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b1://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b0://
                 (opcode == 4'b1010)?1'b0:1'b0;//


assign Branch=(interrupt==1'b1)?1'b1:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b0://
                 (opcode == 4'b1000)?1'b1://
                 (opcode == 4'b1001)?1'b1://
                 (opcode == 4'b1010)?1'b0:1'b0;//


                 
assign Out=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b1://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b0://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b0://
                 (opcode == 4'b1010)?1'b0:1'b0;//

assign In=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b1://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b0://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b0://
                 (opcode == 4'b1010)?1'b0:1'b0;//


assign PushPop=(interrupt==1'b1)?1'b1:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b1://IN
                 (opcode == 4'b0111)?1'b0://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b1://
                 (opcode == 4'b1010)?1'b0:1'b0;//   


assign PushPc=(interrupt==1'b1)?1'b1:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b0://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b1://
                 (opcode == 4'b1010)?1'b0:1'b0;//       
                 
 assign PopPc=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b0://IN
                 (opcode == 4'b0111)?1'b0://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b0://
                 (opcode == 4'b1010)?1'b1:1'b0;// 

assign Spop=(interrupt==1'b1)?1'b1:(opcode == 4'b0000) ?1'b0://NOP
                 (opcode == 4'b0001) ?1'b0://CLRC-SETC
                 (opcode == 4'b0010)?1'b0://NOT
                 (opcode == 4'b0011)?1'b0://INC
                 (opcode == 4'b0100)?1'b0://DEC
                 (opcode == 4'b0101)?1'b0://OUT
                 (opcode == 4'b0110)?1'b1://IN
                 (opcode == 4'b0111)?1'b1://
                 (opcode == 4'b1000)?1'b0://
                 (opcode == 4'b1001)?1'b1://
                 (opcode == 4'b1010)?1'b1:1'b0;//     

// assign Flush=(interrupt==1'b1)?1'b0:(opcode == 4'b0000) ?1'b0://NOP
//                  (opcode == 4'b0001) ?1'b0://CLRC-SETC
//                  (opcode == 4'b0010)?1'b0://NOT
//                  (opcode == 4'b0011)?1'b0://INC
//                  (opcode == 4'b0100)?1'b0://DEC
//                  (opcode == 4'b0101)?1'b0://OUT
//                  (opcode == 4'b0110)?1'b0://IN
//                  (opcode == 4'b0111)?1'b0://
//                  (opcode == 4'b1000)?1'b0://
//                  (opcode == 4'b1001)?1'b0://
//                  (opcode == 4'b1010)?1'b1:1'b0;//                             

endmodule
`include "MemoInst.v"
//Fetch
/*
Fetch Stage in the 5 Stages of the pipline
inputs:
  -branch (1 bit):Select bit of there is a branch to select Branch Address to be loaded to PC not PC+1
  -branchAdd (16 bit):New address to be Written in PC(After Sign Extend)
  -clk:clock

output:
  -instruction (16 bit):Instruction that has been fetched (Enter next stage Decode)  

Edges:
+ve=>PC
-ve=>Code Memory    
*/
module Fetch (branch,branchAdd,clk,instruction);

//inputs and outputs
input branch;
input [15:0] branchAdd;
input clk;
output [16:0] instruction;

//Instances
//PC 32-bit Reg (Program Counter) 
reg [31:0] PC;

//Code Memory Instance
MemoInst instMemory(.clk(clk),.pc(PC),.inst(instruction));

//wires
wire PC_Mux_Out;//Selection of PC
wire Adder_Out;//Adder Result (PC+1)
wire Branch_Address_32bit;//Extend 16 bit Branch Address to be 32 bit 

//Combinational
//Adder
assign Adder_Out=PC+1;
//Address Sign Extend
assign Branch_Address_32bit={16{branchAdd[15]},branchAdd}
//Multiplixer
assign PC_Mux_Out=(branch==1'b0)?Adder_Out:branchAdd;



//Sequential
//+ve Edge (Upadate PC)
always @(posedge clk)
begin
PC= PC_Mux_Out;
end

//-ve Edge(Read from code Memory)
//pass to it ~clk


endmodule

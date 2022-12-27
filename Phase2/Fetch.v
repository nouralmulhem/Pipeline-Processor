`include "MemoInst.v"
//Fetch
/*
Fetch Stage in the 5 Stages of the pipline
inputs:
  -branch (1 bit):Select bit of there is a branch to select Branch Address to be loaded to PC not PC+1
  -branchAdd (16 bit):New address to be Written in PC(After Sign Extend)
  -reset (1 bit):Load PC with 2^5h (location of first instruction) [Interrupt Signal**********8]
  -clk:clock

output:
  -instruction (16 bit):Instruction that has been fetched (Enter next stage Decode)  

Edges:
-ve=>PC
+ve=>Code Memory    
*/
module Fetch (branch,branchAdd,reset,clk,instruction);

//inputs and outputs
input branch;
input [15:0] branchAdd;
input reset,clk;
output [15:0] instruction;

//Instances
//PC 32-bit Reg (Program Counter) 
reg [31:0] PC;

//Code Memory Instance
MemoInst instMemory(.pc(PC),.inst(instruction));

//wires
wire [31:0]PC_Mux_Out;//Selection of PC (branch)
wire [31:0]Adder_Out;//Adder Result (PC+1)
wire [31:0]Branch_Address_32bit;//Extend 16 bit Branch Address to be 32 bit 

//Combinational
//Adder
assign Adder_Out=PC+1;
//Address Sign Extend
assign Branch_Address_32bit={{16{branchAdd[15]}},branchAdd};
//Branch Multiplixer
assign PC_Mux_Out=(branch==1'b0)?Adder_Out:Branch_Address_32bit;

//Sequential
//-ve Edge clk or reset (Upadate PC)
always @(negedge clk)
begin
if(reset == 1'b1) begin
  //  PC = {32'd50};
   PC = {32{1'b0}};
end
else begin
PC = PC_Mux_Out;
end
end

endmodule
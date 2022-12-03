`include "ALUControl.v"
`include "ALU.v"

//Execute
/*
Execute Stage in the 5 Stages of the pipline
inputs:
  -controlSignals (11 bits):Control Signals from previous Stage
  -readData1 (16 bit):
  -readData2 (16 bit):
  -func (3 bit): ALU Control Function
  -clk:clock

output:
  -aluResult (16 bit):Alu output 

Edges:
Assign Flag Reg (pending)

*/
module Execute (clk,aluOp,branch,aluSrc,readData1,readData2,func,aluResult);

//inputs and outputs
input aluOp, branch, aluSrc; //will bw used in phase 2 
input [15:0] readData1, readData2;
input [2:0] func;
input clk;

output [15:0] aluResult;

//wires
wire [2:0] AluOperation;//Out of Control Unit and Alu Operation in

//Instances
//Flag Ref 3-bit Reg 
reg [2:0] Flag;

//Alu Control Instance
ALUControl ALUControlModule(.ALUOp(aluOp),.Funct(func),.Operation(AluOperation));

//Alu Instance
ALU ALUModule (.in1(readData1),.in2(readData2),.aluControl(AluOperation),.out(aluResult),.flag(Flag));


//Sequential
//Edge Flag Reg Assign
// always @(negedge clk)
// end

endmodule
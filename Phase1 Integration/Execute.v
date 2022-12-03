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
  -immediateValue(16 bit): Immediate Value to be Laoded to Register
  -clk:clock

output:
  -aluResult (16 bit):Alu output 

Edges:
Assign Flag Reg (pending)

*/
module Execute (clk,aluOp,branch,aluSrc,readData1,readData2,func,immediateValue,aluResult);

//inputs and outputs
input aluOp, branch, aluSrc; //will bw used in phase 2 
input [15:0] readData1, readData2;
input [2:0] func;
input clk;
input [15:0] immediateValue;

output [15:0] aluResult;

//wires
wire [2:0] aluOperation;//Out of Control Unit and Alu Operation in

//Instances
//Flag Ref 3-bit Reg 
wire [15:0] aluIn1;
wire [2:0] aluFlagOut;
reg [2:0] flagReg;

//Immediate Value??
assign aluIn1=(aluSrc==0)?readData1:immediateValue;

//Alu Control Instance
ALUControl ALUControlModule(.ALUOp(aluOp),.Funct(func),.Operation(aluOperation));

//Alu Instance
ALU ALUModule (.in1(aluIn1),.in2(readData2),.aluControl(aluOperation),.out(aluResult),.flag(aluFlagOut));


//Sequential
always @(negedge clk)
begin
flagReg=aluFlagOut;
end

endmodule
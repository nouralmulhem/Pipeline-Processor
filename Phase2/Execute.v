// `include "ALUControl.v"
`include "ALU.v"

//Execute
/*
Execute Stage in the 5 Stages of the pipline
inputs:
  -controlSignals (11 bits):Control Signals from previous Stage
  -readData1 (16 bit):
  -readData2 (16 bit):
  -func (4 bit): ALU Control Function
  -immediateValue(16 bit): Immediate Value to be Laoded to Register
  -clk:clock

output:
  -aluResult (16 bit):Alu output 

Edges:
Assign Flag Reg (pending)

*/
module Execute (clk,aluOp,branch,aluSrc,readData1,readData2,func,immediateValue,aluResult,branch_output,ALUImmediateOperation);

//inputs and outputs
input aluOp, branch, aluSrc; //will bw used in phase 2 
input [15:0] readData1, readData2;
input [3:0] func;
input clk;
input [15:0] immediateValue;

output [15:0] aluResult;
output ALUImmediateOperation;

//wires
// wire [2:0] aluOperation;//Out of Control Unit and Alu Operation in


//Instances
//Flag Ref 3-bit Reg 
wire [15:0] aluIn1;
wire [2:0] aluFlagOut;
reg [2:0] flagReg;

//Immediate Value??
assign aluIn1=(aluSrc==0)?readData1:immediateValue;
assign ALUImmediateOperation=(aluSrc==0)?1'b0:1'b1;

//Alu Control Instance
// ALUControl ALUControlModule(.ALUOp(aluOp),.Funct(func),.Operation(aluOperation));

//Alu Instance
ALU ALUModule (.in1(aluIn1),.in2(readData2),.aluControl(func & ~{{3{branch}},branch}),.out(aluResult),.flag(aluFlagOut));

//Branch Logic
output branch_output;
wire [2:0] branch_flag_out;
BranchLogic BranchLogic_inst (.zf(flagReg[0]),.cf(flagReg[1]),.nf(flagReg[2]),.sel(func[1:0]),.branch(branch),.branch_out(branch_output),.flag_reg(branch_flag_out));

//Sequential
always @(negedge clk)
begin
if(branch) begin
  flagReg=branch_flag_out;
end else begin
  flagReg=aluFlagOut;
end
end

endmodule
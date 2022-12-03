`include "Execute.v"
/*
Execute test bench
*/
module Execute_TB();
reg clk;
// reg clk,aluOp,branch,aluSrc;
// reg [15:0]readData1,readData2;
wire [15:0] aluResult;
// wire [2:0] Flag;

Execute ExecuteModule (.clk(clk),.aluOp(1'b1),.branch(1'b0),.aluSrc(1'b0),.readData1({16{1'b0}}),.readData2(16'b0000000000000001),.func(3'b001),.aluResult(aluResult));
initial
begin
clk=0;
end

always begin
#5 clk=~clk;
end

endmodule

//aluResult=00000...1
//Flag z0z
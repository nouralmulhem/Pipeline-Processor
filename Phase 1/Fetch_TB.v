`include "Fetch.v"
/*
Fetch test bench
*/
module Fetch_TB();
reg branch,clk,reset;
reg [15:0] branchAdd;
wire [15:0] instruction;

Fetch FetchModule (branch,branchAdd,reset,clk,instruction);
initial
begin
clk=0;
reset=1;
branch=0;
//branchAdd=16

#1
reset=1'b0;//begin 
end

always begin
#5 clk=~clk;
end

endmodule
// `include "MemoInst.v"
// //Fetch
// /*
// Fetch Stage in the 5 Stages of the pipline
// inputs:
//   -branch (1 bit):Select bit of there is a branch to select Branch Address to be loaded to PC not PC+1
//   -branchAdd (16 bit):New address to be Written in PC(After Sign Extend)
//   -reset (1 bit):Load PC with 2^5h (location of first instruction) [Interrupt Signal**********8]
//   -clk:clock

// output:
//   -instruction (16 bit):Instruction that has been fetched (Enter next stage Decode)  

// Edges:
// -ve=>PC
// +ve=>Code Memory    
// */
module SPALU (SPin,operation,SPold,SPnew);
input [31:0] SPin;
input operation;
output [31:0] SPold,SPnew;

//Assign SPold to the previous SP
assign SPold=SPin;

//if operation push SP-- else SP++


endmodule
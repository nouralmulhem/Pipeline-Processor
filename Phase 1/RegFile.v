`include "RegFile.v"
/*
RegFile test bench
*/
module RegFile_TB();

always 
#5 clk=~clk;

endmodule
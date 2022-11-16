`include "FD_Buffer.v"
/*
FD_Buffer test bench
*/
module FD_Buffer_TB();
reg [31:0] in;
reg clk;
wire [31:0] out;

FD_Buffer FD_BufferModule (.instruction_in(in),.clk(clk),.instruction_out(out));

initial
begin
clk=0;

#1
in={32{1'b0}};

#10
in={32{1'b1}};

//Not read till next postive edge
#5
in={16{2'b10}};

#10
in={8{4'b1011}};
end

always 
#5 clk=~clk;

endmodule

module MemoInst_tb();
reg clk;
reg[31:0] pc;
wire[15:0] inst;

localparam PERIOD = 20;

MemoInst mem(clk, pc, inst);

always #(PERIOD/2) clk=~clk;

initial begin
	clk = 0;

	#PERIOD
	pc=32'h0000_0020;

	#PERIOD
	pc=32'h0000_0021;

	#PERIOD
	pc=32'h0000_0022;

	#PERIOD 
	pc=32'h0000_0020;

	#PERIOD
	pc=32'h0000_0022;

end
endmodule
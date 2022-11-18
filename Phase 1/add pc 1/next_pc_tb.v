module next_pc_tb();
reg clk, rst;
reg[31:0] pc;
wire[31:0] next;

localparam PERIOD = 20;

next_pc add(clk, pc, rst, next);

always #(PERIOD/2) clk=~clk;

initial begin
	clk = 0;
	rst = 1;

	#PERIOD rst = 0;
	pc=32'h0000_0000;

	#PERIOD
	pc=32'h0000_0001;

	#PERIOD
	pc=32'h0000_0002;

	#PERIOD rst = 1;
	
	#PERIOD rst = 0;
	pc=32'h0000_0000;

	#PERIOD
	pc=32'h0000_0002;

end
endmodule
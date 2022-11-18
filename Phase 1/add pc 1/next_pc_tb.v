module next_pc_tb();
reg clk;
reg[31:0] pc;
wire[31:0] next;

localparam PERIOD = 20;

next_pc add(clk, pc, next);

always #(PERIOD/2) clk=~clk;

initial begin
	clk = 0;

	#PERIOD
	pc=32'h0000_0000;

	#PERIOD
	pc=32'h0000_0001;

	#PERIOD
	pc=32'h0000_0002;

	#PERIOD 
	pc=32'h0000_0000;

	#PERIOD
	pc=32'h0000_0002;

end
endmodule

module MemoInst_tb();
reg clk, rst;
reg[31:0] pc;
wire[15:0] inst;

localparam PERIOD = 20;

MemoInst mem(clk, pc, rst, inst);

always #(PERIOD/2) clk=~clk;

initial begin
	clk = 0;
    	rst = 1; 
	#PERIOD rst = 0;
	pc=32'h0000_0001;

end
endmodule
module Cu_tb();
reg clk;
reg [2:0]opcode;
wire ALU_OP,ALU_src,MEMW,MEMR,MTR,reg_write,Branch,In,Out,Stack_op,Push;

localparam PERIOD = 20;

CU c(clk,
opcode,
ALU_OP,
ALU_src,
MEMW,
MEMR,
MTR,
reg_write,
Branch,
In,
Out,
Stack_op,
Push,
);

always #(PERIOD/2) clk=~clk;

initial begin
	clk = 0;
	#PERIOD
	opcode=3'b001;

	#PERIOD
	opcode=3'b010;

	#PERIOD
	opcode=3'b011;

	#PERIOD 
	opcode=3'b100;

	#PERIOD
	opcode=3'b101;

end
endmodule
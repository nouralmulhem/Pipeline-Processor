module next_pc(clk,
pc,
rst,
next_pc
);
input clk, rst;
input[31:0] pc;
output reg[31:0] next_pc;

always @ (posedge clk, posedge rst) begin
	$display("nour1");
	if(rst==1'b1) begin
		$display("nour2");
		next_pc=32'h0000_0020;
	end
	else begin
		next_pc = pc + 1;
	end
end

endmodule
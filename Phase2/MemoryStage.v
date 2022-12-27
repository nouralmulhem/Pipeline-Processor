`include "Memory.v"
`include "PushPopLogic.v"

module MemoryStage (clk, mem_read, mem_write, stackOp, pushPop, reset, in, out, read_add, write_data, alu_data, mem_to_reg, data_to_write);

	input clk;

	//control signals
	input mem_read,mem_write,mem_to_reg;
	input stackOp, pushPop, reset, in, out;

	input [15:0] read_add;
	input [15:0] alu_data,write_data;
	output reg [15:0] data_to_write;


	wire [15:0] read_data;
	wire [31:0] SPOut;
	wire [15:0] memoryReadAddress;

	PushPopLogic PushPopLogicModule (.clk(clk), .stackOp(stackOp), .pushPop(pushPop), .SPOut(SPOut), .reset(reset));

	assign memoryReadAddress = (stackOp == 1'b1) ? SPOut[15:0] : read_add;

	wire [15:0] alu_in_mux_out;

	assign alu_in_mux_out = (in == 1'b1 || out == 1'b1) ? write_data : alu_data;

	DataMemo memory_inst(clk,
	mem_read,
	mem_write,
	memoryReadAddress,
	write_data,
	read_data);

	always @* begin
		if(mem_to_reg) begin
			data_to_write = read_data;
		end else begin
			data_to_write = alu_in_mux_out;
		end

end

endmodule
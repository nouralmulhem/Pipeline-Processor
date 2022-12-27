`include "Memory.v"
`include "PushPopLogic.v"

module MemoryStage (clk, mem_read, mem_write, stackOp, pushPop, reset, read_add, write_data, alu_data, mem_to_reg, data_to_write);

	input clk;
	input mem_read,mem_write,mem_to_reg;
	input stackOp, pushPop, reset;
	input [15:0] read_add;
	input [15:0] alu_data,write_data;
	output reg [15:0] data_to_write;


	wire [15:0] read_data;
	wire [31:0] SPOut;
	wire [15:0] memoryReadAddress;

	PushPopLogic PushPopLogicModule (.clk(clk), .stackOp(stackOp), .pushPop(pushPop), .SPOut(SPOut), .reset(reset));

	assign memoryReadAddress = (stackOp == 1'b1) ? SPOut[15:0] : read_add;

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
			data_to_write = alu_data;
		end

end

endmodule
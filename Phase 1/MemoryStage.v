`include "Memory/Memory.v"

module MemoryStage (clk,mem_read,mem_write,read_add, write_data,
					alu_data,mem_to_reg, data_to_write);

input clk;
input mem_read,mem_write,mem_to_reg;
input [15:0]read_add;
input [15:0]alu_data,write_data;
output reg [15:0] data_to_write;


wire [15:0]read_data;


DataMemo memory_inst(clk,
mem_read,
mem_write,
read_add,
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
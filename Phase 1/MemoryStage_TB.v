`include "MemoryStage.v"

module MemoryStage_TB();
reg clk;
//reg clk2; // pass to buff
reg mem_read,mem_write,mem_to_reg;
reg reg_write;
reg [2:0] write_add;
reg [15:0]read_add;
reg [15:0]alu_data,write_data;
wire [15:0] data_to_write;

wire reg_write_out;
wire [15:0]data_to_write_out;
wire [2:0]write_add_out;

MemoryStage MemoryModule (clk,mem_read,mem_write,read_add, write_data,
					alu_data,mem_to_reg, data_to_write);
MW_Buffer buff(reg_write,data_to_write,write_add,clk,reg_write_out,
				data_to_write_out,write_add_out);

localparam PERIOD = 10;

initial
begin

clk=0;
mem_read=1'b0;
mem_write=1'b0;
mem_to_reg=1'b0;
reg_write=1'b1;
write_add=3'b001;

//#1
//clk2=0;

#PERIOD
mem_read=1'b0;
mem_write=1'b1;
mem_to_reg=1'b0;
read_add=16'h0001;
write_data=16'h0101;
alu_data=16'h1010;

#PERIOD
mem_read=1'b1;
mem_write=1'b0;
mem_to_reg=1'b1;
read_add=16'h0001;
write_data=16'h0101;
alu_data=16'h1010;

#PERIOD
mem_read=1'b1;
mem_write=1'b0;
mem_to_reg=1'b0;
read_add=16'h0001;
write_data=16'h0101;
alu_data=16'h1010;

end

always #(PERIOD/2) clk = ~clk;
//always #(PERIOD/2) clk2 = ~clk2;

endmodule
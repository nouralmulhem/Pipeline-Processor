module Memory_tb();
reg mem_read, mem_write, clk;
reg[15:0] write_data, read_addr;
wire[15:0] read_data;

localparam PERIOD = 20;

DataMemo mem(clk, mem_read, mem_write, read_addr, write_data, read_data);

always #(PERIOD/2) clk=~clk;

initial begin

	clk = 0;
 
	#PERIOD
	read_addr=16'h0001;
	write_data=16'b1010_0000_0101_1111;
	mem_write = 1'b1;
	mem_read = 1'b0;

	#PERIOD
	mem_write = 1'b0;
	mem_read = 1'b1;
	read_addr=16'h0001;
	write_data=16'b0000_0011_0000_0000;

	#PERIOD
	mem_write = 1'b0;
	mem_read = 1'b1;
	read_addr=16'h0002;
	write_data=16'b0000_0011_1111_0000;
	// zero values is to be read from second place

	#PERIOD
	mem_write = 1'b1;
	mem_read = 1'b0;
	read_addr=16'h0002;
	write_data=16'b0000_0011_0000_1111;
	// write in second place in mem

	#PERIOD
	mem_write = 1'b0;
	mem_read = 1'b1;
	read_addr=16'h0002;
	write_data=16'b0000_0011_0000_0011;

	#PERIOD
	mem_write = 1'b0;
	mem_read = 1'b1;
	read_addr=16'h5F01;
	write_data=16'b0000_0011_0000_0011;


end
endmodule


//Data Memory
/*
Data memory 4 KB in size width 16 bit(word)
inputs:
  - clk:clock
  - memoryRead
  - memorywrite
  - Readaddress
  - writedata
  - reset
output:
  - Data
*/
module DataMemo(clk,
memoryRead,
memorywrite,
Readaddress,
writedata,
reset,
Data
);
input clk,reset;
input memoryRead,memorywrite;
input [15:0]Readaddress,writedata;
output reg [15:0] Data;

reg [2047:0] memory [0:15];
integer i;
wire r=reset||clk;
always @ (posedge r) begin
  if(reset==1'b1)begin
	for(i=0;i<2048;i=i+1)begin
		memory[i]='b0;	
	end
  end
  else if(Readaddress >16'b0000_0111_1111_1111)begin
    Data='bz;
  end
  else if(memorywrite == 1'b1) begin
    memory[Readaddress] = writedata;
  end
  else if(memoryRead == 1'b1) begin
    Data= memory[Readaddress];
  end
end

endmodule
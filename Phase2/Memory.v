
//Data Memory
/*
Data memory 4 KB in size width 16 bit(word)
inputs:
  - clk:clock
  - memoryRead
  - memorywrite
  - Readaddress
  - writedata
output:
  - Data
*/
module DataMemo(clk,
memoryRead,
memorywrite,
Readaddress,
writedata,
Data
);
input clk;
input memoryRead,memorywrite;
input [15:0]Readaddress,writedata;
output reg [15:0]Data;

reg [15:0] memory [0:2047];
integer i;
always @ (negedge clk) begin
  if(Readaddress >16'b0000_0111_1111_1111)begin
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
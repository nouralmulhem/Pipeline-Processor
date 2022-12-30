//Register File
/*
Regsiter file of 8 Registers wach 16 bit(word)
Data is Written @ postive edge
Data is Read @ negative edge
inputs:
  - clk:clock
  - Read_Add_1(3bit):Address to read Read Reg at Read_data_1
  - Read_Add_2(3bit):Address to read Read Reg at Read_data_2
  - Write_Add(3bit):Addres of Reg to write in
  - Write_enable:Enable Write into Reg @ Write_Add
  - Write_data(32 bit): Data to be written into Reg @ Write_Add

output:
  - Read_data_1(32bit):[Read_Add_1] data @ Address Read_Add_1
  - Read_data_2(32bit):[Read_Add_2] data @ Address Read_Add_2
*/
module RegFile(clk,reset,Read_Add_1,Read_Add_2,Write_Add,Write_enable,Write_data,Read_data_1,Read_data_2);
input clk;
input reset;
input [2:0] Read_Add_1,Read_Add_2;
input [2:0] Write_Add;
input Write_enable;
input [15:0] Write_data;
integer i;


output reg [15:0] Read_data_1 , Read_data_2;


reg [15:0] memory [0:7];

always @(posedge reset) begin
  for (i = 0; i < 8; i = i + 1) begin
    memory[i] = 'b0; 
  end 
  Read_data_1 = 'bz; 
  Read_data_2 = 'bz; 
end

always @ (negedge clk) begin
  Read_data_1 = memory[Read_Add_1];
  Read_data_2 = memory[Read_Add_2];
end

always @ (posedge clk) begin
  if(Write_enable === 1'b1) begin
    memory[Write_Add] = Write_data;
  end
end

endmodule
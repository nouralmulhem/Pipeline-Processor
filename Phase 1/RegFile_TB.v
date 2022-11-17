`include "RegFile.v"
/*
RegFile test bench
*/
module RegFile_TB();
reg clk;
reg [2:0] Read_Add_1,Read_Add_2;
reg [2:0] Write_Add;
reg Write_enable;
reg [15:0] Write_data;


wire [15:0] Read_data_1 , Read_data_2;

RegFile RegFileModule (clk,Read_Add_1,Read_Add_2,Write_Add,Write_enable,Write_data,Read_data_1,Read_data_2);

initial
begin
clk=1;
//1.Read from RO R1
Read_Add_1=3'b000;
Read_Add_2=3'b001;

//2.Write and read from R3
#10
//Write in R3
Write_enable=1'b1;
Write_Add=3'b010;
Write_data={8{2'b01}};

//Read from R3
Read_Add_1=3'b010;
//O/P R3:010101.... , Read_Data_1=0101010...


//3.write in R5 while not enabled
#10
Write_enable=1'b0;
Write_Add=3'b101;
Write_data={4{4'b0110}};
//O/P=> R5 is still zeros

//4.write in R1
#10
Write_enable=1'b1;
Write_Add=3'b001;
Write_data={8{2'b11}};
//O/P=> R1 0101....

end
always 
#5 clk=~clk;

endmodule
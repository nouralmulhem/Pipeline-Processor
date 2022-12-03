`include "ALU.v"
/*
Branch_Logic test bench
*/
module ALU_TB();
reg [15:0]in1,in2;
reg [2:0]aluControl;
wire [15:0]out;
wire [2:0]flag;

ALU ALUModule (in1,in2,aluControl,out,flag);
initial
begin
in1=16'd255;
in2=16'd1;
aluControl=3'b000;

#10
in1=16'd255;
in2=16'd1;
aluControl=3'b001;

#10
in1=16'd255;
in2=16'd1;
aluControl=3'b010;

#10
in1=16'd255;
in2=16'd1;
aluControl=3'b011;

#10
in1=16'd255;
in2=16'd1;
aluControl=3'b100;
end

endmodule
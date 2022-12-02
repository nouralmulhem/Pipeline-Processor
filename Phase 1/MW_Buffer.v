module MW_Buffer (controlSignals_in,alu_data_in,write_add_in,clk,controlSignals_out,alu_data_out,write_add_out);
input controlSignals_in;
input [15:0]alu_data_in;
input [2:0] write_add_in;

input clk;

output reg controlSignals_out;
output reg [15:0]alu_data_out;
output reg [2:0]write_add_out;

always @(posedge clk)
begin
controlSignals_out=controlSignals_in;
alu_data_out=alu_data_in;
write_add_out=write_add_in;
end
endmodule
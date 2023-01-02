module MW_Buffer (controlSignals_in,flush,alu_data_in,write_add_in,clk,controlSignals_out,alu_data_out,write_add_out);
input [2:0] controlSignals_in;
input [15:0] alu_data_in;
input [2:0] write_add_in;

input clk, flush;

output reg [2:0] controlSignals_out;
output reg [15:0] alu_data_out;
output reg [2:0] write_add_out;

always @(posedge clk)
begin
    if(flush===1'b1) begin
        controlSignals_out=3'b0;
    end else begin
        controlSignals_out=controlSignals_in;
        alu_data_out=alu_data_in;
        write_add_out=write_add_in;
    end

end
endmodule
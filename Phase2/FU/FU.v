//FU
/*

inputs: wr_add: of the current instruction
        wr_add_alu: write address from alu pipe
        wb_alu: write back from alu pipe
        wr_add_mem: write address from mem pipe
        wb_mem: write back from mem pipe

output: forward_src: signal to forward the src
        forward_des: signal to forward the dest
     
*/
module FU (wr_add, wr_add2, wr_add_alu, wb_alu, wr_add_mem, wb_mem, forward_src, forward_des);

input [2:0] wr_add, wr_add2, wr_add_alu, wr_add_mem;
input wb_alu, wb_mem;
output reg [1:0] forward_src, forward_des;

always @* begin
  if(wr_add == wr_add_alu && wb_alu) begin
    forward_des = 2'b00;
  end else if(wr_add == wr_add_mem && wb_mem) begin
    forward_des = 2'b01;
  end else begin
    forward_des = 2'b11;
  end

  if(wr_add2 == wr_add_alu && wb_alu) begin
    forward_src = 2'b00;
  end else if(wr_add2 == wr_add_mem && wb_mem) begin
    forward_src = 2'b01;
  end else begin
    forward_src = 2'b11;
  end
end

endmodule
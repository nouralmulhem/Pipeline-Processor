//FU_integration
/*

inputs: wr_add: of the current instruction          // for FU
        wr_add_alu: write address from alu pipe     // for FU
        wb_alu: write back from alu pipe            // for FU
        wr_add_mem: write address from mem pipe     // for FU
        wb_mem: write back from mem pipe            // for FU

        alu_data: if would be forwarded
        mem_data: if would be forwarded
        Read_Data1: from Decode pipe
        Read_Data2: from Decode pipe

output: Read_Data1_FU: to ALU
        Read_Data2_FU: to ALU
     
*/
module FU_integration (wr_add, wr_add2, wr_add_alu, wb_alu, wr_add_mem, wb_mem, Read_Data1, Read_Data2, Read_Data1_FU, Read_Data2_FU);

input [2:0] wr_add, wr_add2, wr_add_alu, wr_add_mem;
input wb_alu, wb_mem;
input [15:0] alu_data, mem_data;
input [15:0] Read_Data1, Read_Data2;

output [15:0] Read_Data1_FU, Read_Data2_FU;

wire [1:0] forward_src, forward_des;

FU forwarding_inst (wr_add, wr_add2, wr_add_alu, wb_alu, wr_add_mem, wb_mem, forward_src, forward_des);

always @* begin
  if(forward_des === 2'b11) begin
    Read_Data2_FU = Read_Data2;
  end else if(forward_des === 2'b00) begin
    Read_Data2_FU = alu_data;
  end else if(forward_des === 2'b01) begin
    Read_Data2_FU = mem_data;
  end

  if(forward_src === 2'b11) begin
    Read_Data1_FU = Read_Data1;
  end else if(forward_src === 2'b00) begin
    Read_Data1_FU = alu_data;
  end else if(forward_src === 2'b01) begin
    Read_Data1_FU = mem_data;
  end

end

endmodule
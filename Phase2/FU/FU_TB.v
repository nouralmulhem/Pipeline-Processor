
module FU_TB();

reg [2:0] wr_add, wr_add2, wr_add_alu, wr_add_mem;
reg wb_alu, wb_mem;
reg [15:0] alu_data, mem_data;
reg [15:0] Read_Data1, Read_Data2;

wire [15:0] Read_Data1_FU, Read_Data2_FU;

FU_integration FU_integration_inst (wr_add, wr_add2, wr_add_alu, wb_alu, wr_add_mem, wb_mem, Read_Data1, Read_Data2, Read_Data1_FU, Read_Data2_FU);

initial begin


end

endmodule
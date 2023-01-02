//E/M Buffer 
/*
Buffer between Fetch and Decode Stages
inputs:
  -instruction_in(32 bit):input instruction
  -clk:clock
  -PC

output:
  -instruction_out(32 bit):output instruction   
  -PC

*/
module EM_Buffer (controlSignals_in,reset_ret,reset_rti,ALUData_in,ReadData2_in,WriteAdd_in,interrupt,clk,PC_in,flush,controlSignals_out,ALUData_out,ReadData2_out,WriteAdd_out,PC_out,interrupt_out,reset_ret_out, reset_rti_out);
  input[9:0] controlSignals_in;
  input [15:0] ALUData_in,ReadData2_in;
  input [2:0] WriteAdd_in;
  input clk, interrupt, flush, reset_ret, reset_rti;
  input [47:0]PC_in;


  output reg [9:0] controlSignals_out;
  output reg [15:0] ALUData_out,ReadData2_out;
  output reg [2:0] WriteAdd_out;
  output reg [47:0]PC_out;
  output reg interrupt_out;
  output reg reset_ret_out;
  output reg reset_rti_out;


  always @(posedge clk)begin
    PC_out = PC_in;
    if(flush===1'b1) begin
      controlSignals_out=10'b0;
      interrupt_out = 1'b0;
    end else begin
      interrupt_out = interrupt;
      controlSignals_out = controlSignals_in;
      ALUData_out = ALUData_in;
      ReadData2_out = ReadData2_in;
      WriteAdd_out = WriteAdd_in;
      reset_ret_out = reset_ret;
      reset_rti_out = reset_rti;
    end

    end
endmodule
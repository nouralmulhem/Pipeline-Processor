//D/E Buffer 
/*
Buffer between Decode and Execute Stages
inputs:
  -controlSignals_in (11 bits): control signals from the Control Unit includes: (ALUOP/Regwr/ALUsrc/Branch/MemtoReg/Push/Out/In)
  -readData1_in (16 bits)
  -readData2_in (16 bits)
  -writeAdd_in (3 bits)
  -function_in (3 bits)
  -clk:clock
output:
  -controlSignals_out (8 bits): control signals from the Control Unit
  -readData1_out (16 bits)
  -readData2_out (16 bits)
  -writeAdd_out (3 bits)
  -function_out (3 bits)   
*/
module DE_Buffer(clk, controlSignals_in, readData1_in, readData2_in, writeAdd_in, function_in, controlSignals_out, readData1_out, readData2_out, writeAdd_out, function_out);
    input [10:0] controlSignals_in;
    input [15:0] readData1_in, readData2_in;
    input [2:0] writeAdd_in;
    input [2:0] function_in;
    input clk;

    output reg [10:0] controlSignals_out;
    output reg [15:0] readData1_out, readData2_out;
    output reg [2:0] writeAdd_out;
    output reg [2:0] function_out;

    always @(posedge clk) begin
        controlSignals_out = controlSignals_in;
        readData1_out = readData1_in;
        readData2_out = readData2_in;
        writeAdd_out = writeAdd_in;
        function_out = function_in;
    end
endmodule
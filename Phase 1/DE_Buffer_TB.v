`include "Decode.v"
`include "DE_Buffer.v"

module DE_Buffer_TB();

    reg [10:0] controlSignals_in;
    reg [15:0] ReadData1_in, ReadData2_in;
    reg [2:0] WriteAdd_in, Function_in;
    reg clk;
    wire [10:0] controlSignals_out;
    wire [15:0] ReadData1_out, ReadData2_out;
    wire [2:0] WriteAdd_out, Function_out;

    DE_Buffer DE_BufferModule(clk, controlSignals_in, ReadData1_in, ReadData2_in, WriteAdd_in, Function_in, controlSignals_out, ReadData1_out, ReadData2_out, WriteAdd_out, Function_out);
    initial begin
    clk = 0;

    #1
    controlSignals_in = {10{1'b0}};
    ReadData1_in = {16{1'b0}};
    ReadData2_in = {16{1'b0}};
    WriteAdd_in = 3'b111;
    Function_in = 3'b111;

    #10
    controlSignals_in = {10{1'b0}};
    ReadData1_in = {8{2'b01}};
    ReadData2_in = {8{2'b10}};
    WriteAdd_in = 3'b000;
    Function_in = 3'b000;

    #5
    controlSignals_in = {5{2'b01}};
    ReadData1_in = {16{1'b1}};
    ReadData2_in = {16{1'b1}};
    WriteAdd_in = 3'b101;
    Function_in = 3'b101;

    #10
    controlSignals_in = {5{2'b10}};
    ReadData1_in = {8{2'b10}};
    ReadData2_in = {8{1'b01}};
    WriteAdd_in = 3'b001;
    Function_in = 3'b001;

    #5
    controlSignals_in = {10{1'b1}};
    ReadData1_in = {4{4'b0011}};
    ReadData2_in = {4{4'b1100}};
    WriteAdd_in = 3'b111;
    Function_in = 3'b111;

    end

    always 
    #5 clk=~clk;
    
endmodule
`include "Decode.v"

module Decode_TB();

    reg [31:0] instruction;
    reg [2:0] writeAddress;
    reg [15:0] writeData;
    reg writeEnable;
    reg clk;
    wire [10:0] controlSignal;
    wire [15:0] readData1, readData2;

    Decode DecodeModule(clk, instruction, writeAddress, writeEnable, writeData,{1'bx}, controlSignal, readData1, readData2);

    initial begin
    clk = 0;

    #1
    instruction = 16'b0110011001100110;
    writeAddress = 3'b000;
    writeData = {16{1'b0}};
    writeEnable = 0;

    #10
    instruction = 16'b0110000010000011;
    writeAddress = 3'b111;
    writeData = {16{2'b01}};
    writeEnable = 0;
    end
    always 
    #5 clk=~clk;
    
endmodule

// constrol signal 000000000
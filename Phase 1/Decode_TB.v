`include "Decode.v"
`include "DE_Buffer.v"

module Decode_TB();

    reg [31:0] instruction;
    reg [2:0] writeAddress;
    reg [15:0] writeData;
    reg writeEnable;
    reg clk;
    wire [10:0] controlSignal;
    wire [15:0] readData1, readData2;

    Decode DecodeModule(clk, instruction, writeAddress, writeEnable, writeData, controlSignal, readData1, readData2);

    initial begin
    clk = 0;

    #1
    instruction = {32{1'b0}};
    writeAddress = 3'b000;
    writeData = {16{1'b0}};
    writeEnable = 0;

    #10
    instruction = {32{1'b1}};
    writeAddress = 3'b111;
    writeData = {16{2'b01}};
    writeEnable = 0;

    #5
    instruction = {16{2'b10}};
    writeAddress = 3'b101;
    writeData = {16{2'b01}};
    writeEnable = 0;

    #10
    instruction = {8{4'b1011}};
    writeAddress = 3'b100;
    writeData = {16{2'b01}};
    writeEnable = 0;

    #5
    instruction = {16{2'b00}};
    writeAddress = 3'b000;
    writeData = {16{2'b11}};
    writeEnable = 1;
    end

    always 
    #5 clk=~clk;
    
endmodule
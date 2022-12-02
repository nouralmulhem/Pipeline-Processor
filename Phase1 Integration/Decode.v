`include "Controle_Signal.v"
`include "RegFile.v"

module Decode(clk, Instruction, WriteAddress, WriteEnable, WriteData, ControlSignal, ReadData1, ReadData2);
     input [31:0] Instruction;
     input [2:0] WriteAddress;
     input [15:0] WriteData;
     input WriteEnable;
     input clk;
     output [10:0] ControlSignal;
     output [15:0] ReadData1, ReadData2;

                                             //ALUOP           //AluSrc          //MEMW            //MEMR            //MTR             //Branch          //reg_write       //In              //Out             //Stack_op        //Push
     CU controlunit(clk, Instruction[15:13], ControlSignal[0], ControlSignal[1], ControlSignal[2], ControlSignal[3], ControlSignal[4], ControlSignal[5], ControlSignal[6], ControlSignal[7], ControlSignal[8], ControlSignal[9], ControlSignal[10]);
     RegFile register(clk, Instruction[12:10], Instruction[9:7], WriteAddress, WriteEnable, WriteData, ReadData1, ReadData2); 
endmodule
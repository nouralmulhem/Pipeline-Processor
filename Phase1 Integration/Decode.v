`include "Controle_Signal.v"
`include "RegFile.v"

module Decode(clk, instruction, writeAddress, writeEnable, writeData, controlSignal, readData1, readData2);
     input clk;
     input writeEnable;
     input [15:0] instruction;
     input [2:0] writeAddress;
     input [15:0] writeData;
     output [10:0] controlSignal;
     output [15:0] readData1, readData2;

                                             //ALUOP           //AluSrc          //MEMW            //MEMR            //MTR             //Branch          //reg_write       //In              //Out             //Stack_op        //Push
     CU ControlUnitModule(instruction[15:13], controlSignal[0], controlSignal[1], controlSignal[2], controlSignal[3], controlSignal[4], controlSignal[5], controlSignal[6], controlSignal[7], controlSignal[8], controlSignal[9], controlSignal[10]);
     RegFile RegFileModule(clk, instruction[12:10], instruction[9:7], writeAddress, writeEnable, writeData, readData1, readData2); 
endmodule
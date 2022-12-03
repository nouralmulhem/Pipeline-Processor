`include "Controle_Signal.v"
`include "RegFile.v"

module Decode(clk, instruction, writeAddress, writeEnable, writeData,aluSrc, controlSignal, readData1, readData2);
     input clk;
     input writeEnable;
     input [15:0] instruction;
     input [2:0] writeAddress;
     input [15:0] writeData;
     input aluSrc;//AluSrc CS of the previous instrcution NOP to prevent immediate value reading as an instruction
     output [10:0] controlSignal;
     output [15:0] readData1, readData2;


//Opcode selection Muxx(Select Between Op code of inst or NOP [FOR immediate Case])
     wire [2:0] opCode;
     // wire aluSrc
     assign opCode=(aluSrc===1'bx || aluSrc==1'b0)?instruction[15:13]:3'b101;

     


      
     //ALUOP           //AluSrc          //MEMW            //MEMR            //MTR             //Branch          //reg_write       //In              //Out             //Stack_op        //Push
      CU ControlUnitModule(.opcode(opCode),
     .ALU_OP(controlSignal[0]),
     .ALU_src(controlSignal[1]),
     .MEMW(controlSignal[2]),
     .MEMR(controlSignal[3]),
     .MTR(controlSignal[4]),
     .Branch(controlSignal[5]),
     .reg_write(controlSignal[6]),
     .In(controlSignal[7]),
     .Out(controlSignal[8]),
     .Stack_op(controlSignal[9]),
     .Push(controlSignal[10]));
     RegFile RegFileModule(clk, instruction[12:10], instruction[9:7], writeAddress, writeEnable, writeData, readData1, readData2); 
endmodule
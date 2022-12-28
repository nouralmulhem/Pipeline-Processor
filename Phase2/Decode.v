`include "Controle_Signal.v"
`include "RegFile.v"

module Decode(clk, reset, instruction, writeAddress, writeEnable, writeData,aluSrc, controlSignal, readData1, readData2);
     input clk, reset;
     input writeEnable;
     input [15:0] instruction;
     input [2:0] writeAddress;
     input [15:0] writeData;
     input aluSrc;//AluSrc CS of the previous instrcution NOP to prevent immediate value reading as an instruction
     output [12:0] controlSignal; //Basma
     output [15:0] readData1, readData2;


//Opcode selection Muxx(Select Between Op code of inst or NOP [FOR immediate Case])
     wire [3:0] opCode;
     wire interrupt;
     // wire aluSrc
     assign opCode=(aluSrc===1'bx || aluSrc==1'b0)?instruction[15:12]:4'b0000;
     

     //Assign interrupt to 0 [Temp till Adding interrupt signal form o/p]
     assign interrupt=1'b0;

     //ALUOP           //AluSrc          //MEMW            //MEMR            //MTR             //Branch          //reg_write       //In              //Out             //Stack_op        //Push

      CU ControlUnitModule(.opcode(opCode),
     .interrupt(interrupt),
     .ALU_OP(controlSignal[0]),
     .ALU_src(controlSignal[1]),
     .reg_write(controlSignal[2]),
     .MEMR(controlSignal[3]),
     .MEMW(controlSignal[4]),
     .MTR(controlSignal[5]),
     .Branch(controlSignal[6]),
     .Out(controlSignal[7]),
     .In(controlSignal[8]),
     .PushPop(controlSignal[9]),
     .PushPc(controlSignal[10]),
     .PopPc(controlSignal[11]),
     .Spop(controlSignal[12]));

     RegFile RegFileModule(clk, reset, instruction[11:9], instruction[8:6], writeAddress, writeEnable, writeData, readData1, readData2); 
endmodule
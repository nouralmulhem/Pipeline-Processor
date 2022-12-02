`include "ALUControl.v"
/*
ALUControl test bench
*/
module ALUControl_TB();
    reg ALUOp;
    reg [2:0] Funct;

    wire [2:0] Operation;

    ALUControl ALUControlModule(ALUOp,Funct,Operation);

    initial begin
        //1.Load instruction
        ALUOp = 1'b1;
        Funct = 3'b001;

        //2.Store instruction
        #10
        ALUOp = 1'b1;
        Funct = 3'b010;

        //3.Add instruction
        #10
        ALUOp = 1'b1;
        Funct = 3'b011;
        //O/P=> R5 is still zeros

        //4.Not instruction
        #10
        ALUOp = 1'b1;
        Funct = 3'b100;

        //4.NOP instruction
        #10
        ALUOp = 1'b0;
        Funct = 3'b101;
    end

endmodule
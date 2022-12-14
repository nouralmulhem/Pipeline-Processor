`include "../PushPopLogic.v"
/*
Branch_Logic test bench
*/
module PushPopLogic_TB();
    reg clk, stackOp, operation;
    wire [31:0] addressOut;

    PushPopLogic PushPopLogicModule(.clk(clk), .stackOp(stackOp), .operation(operation), .addressOut(addressOut));

    initial begin
        // intruction is not a stack operation
        stackOp = 0; operation = 0;
                
        #5
        // intruction is stack operation 
        // push instruction
        stackOp = 1; operation = 0;

        #5
        // intruction is stack operation 
        // pop instruction
        stackOp = 1; operation = 1;
    end
endmodule
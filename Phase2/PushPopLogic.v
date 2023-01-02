`include "StackPointer.v"
//Push and Pop logic
/*
module to handle the push and pop instructions
inputs:
  -stackOp (1 bit): enables the SP to output the data
  -operation (1 bit): indicates whether push or pop operation
  -clk

output:
  -instruction (32 bit):address to access stack in memory

Edges:
-ve=>PC
+ve=>Code Memory    
*/

// adds or subtracts 1 to/from the SP base on the operation (push or pop)
module SpALU(addressIn, pushPop, newAddressOut, oldAddressOut);
    //input and output ports
    input pushPop;    
    input [31:0] addressIn;
    // the SP before and after operation is done -> chosen according to operation (push or pop)
    output [31:0] newAddressOut, oldAddressOut;
    assign newAddressOut = (pushPop == 1'b1) ? (addressIn - 1'b1) : (addressIn + 1'b1);
    assign oldAddressOut = addressIn;
endmodule

//the SP points to the first empty location in stack
module PushPopLogic (clk, stackOp, pushPop, SPOut, reset, StackOverFlow);
    input clk;
    input reset, stackOp, pushPop;
    output [31:0] SPOut;
    output StackOverFlow;

    wire [31:0] SP;
    wire [31:0] SPOldAddress, SPNewAddress;

    SpALU spAluModule(.addressIn(SP), .pushPop(pushPop), .newAddressOut(SPNewAddress), .oldAddressOut(SPOldAddress));
  
    StackPointer SPModule(.clk(clk), .addressIn(SPNewAddress), .addressOut(SP), .stackOp(stackOp), .reset(reset), .StackOverFlow(StackOverFlow));


    // if operation is push (1) access the memory with the current value in SP 
    // if operation is pop (0) access memory with the incremented SP
    assign SPOut = (pushPop == 1) ? SPOldAddress : SPNewAddress;  
endmodule
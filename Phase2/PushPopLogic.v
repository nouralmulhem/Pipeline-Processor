// `include "../StackPointer.v"
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
module StackPointer (clk, addressIn, addressOut, stackOp);
    input clk;
    input [31:0] addressIn;
    input stackOp;
    output reg [31:0] addressOut;

    always @ (stackOp) begin
        addressOut = addressIn;
    end
endmodule

// adds or subtracts 1 to/from the SP base on the operation (push or pop)
module AdderSubtractor(addressIn, operation, spAddressOut, memAddressOut);
    //input and output ports
    input operation;    
    input [31:0] addressIn;
    // the SP before and after operation is done -> chosen according to operation (push or pop)
    output [31:0] spAddressOut, memAddressOut;
    assign spAddressOut = (operation == 1) ? (addressIn + 1) : (addressIn - 1);
    assign memAddressOut = addressIn;
endmodule

//the SP points to the first empty location in stack
module PushPopLogic (clk, stackOp, operation, addressOut);
    input clk, stackOp, operation;
    output [31:0] addressOut;

    wire [31:0] addressIn;
    wire [31:0] spNextAddress, spCurrentAddress;

    AdderSubtractor addSub(spCurrentAddress, operation, spNextAddress);
  
    StackPointer SP(clk, spNextAddress, spCurrentAddress, stackOp);

    // if operation is pop (1) access memory with the incremented SP
    // if operation is push (0) access the memory with the current value in SP 
    assign addressOut = (operation == 1) ? spNextAddress : spCurrentAddress;  
endmodule
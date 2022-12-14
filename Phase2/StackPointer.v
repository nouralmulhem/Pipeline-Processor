module StackPointer (clk, addressIn, addressOut, stackOp);
    input clk;
    input [31:0] addressIn;
    input stackOp;
    output reg [31:0] addressOut;

    reg address;

    assign addressIn = address

    always @ (stackOp) begin
        addressOut = address;
    end
endmodule
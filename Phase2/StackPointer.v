module StackPointer (clk, addressIn, addressOut, stackOp);
    input clk;
    input [31:0] addressIn;
    input stackOp;
    output reg [31:0] addressOut;

    reg address;
    assign address = addressIn;

    always @ (negedge clk) begin
        if(stackOp==1'b1)
           addressOut = address;
        else
           addressOut=addressOut;
    end
endmodule
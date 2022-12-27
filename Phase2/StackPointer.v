module StackPointer (clk, addressIn, addressOut, stackOp, reset);
    input clk;
    input reset;
    input [31:0] addressIn;
    input stackOp;
    output reg [31:0] addressOut;

    always @ (negedge clk) begin
        if (reset == 1'b1) begin
            addressOut = {32'd2047};
        end 
        else if(stackOp == 1'b1) begin
            addressOut = addressIn;
        end 
        else begin
            addressOut = addressOut;
        end
    end
endmodule
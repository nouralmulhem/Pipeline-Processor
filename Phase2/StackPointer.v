module StackPointer (clk, addressIn, addressOut, stackOp, reset,StackOverFlow);
    input clk;
    input reset;
    input [31:0] addressIn;
    input stackOp;
    output reg [31:0] addressOut;
    output StackOverFlow;

    always @(posedge reset)begin
    //   if (reset == 1'b1) begin
        addressOut = {32'd2047};
        // end 
    end

    always @ (negedge clk) begin
        if(reset === 1'b0) begin
            if(stackOp == 1'b1) begin
                addressOut = addressIn;
            end 
            else begin
                addressOut = addressOut;
            end
        end
       
    end
    assign StackOverFlow=(addressOut>32'd2047 || addressOut<32'd0)?1'b1:1'b0;
endmodule
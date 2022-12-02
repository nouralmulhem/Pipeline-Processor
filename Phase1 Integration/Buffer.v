module Buffer(clk, in, out);

    input clk;
    input [15:0] in;
    output reg [15:0] out;

    always @(negedge clk) begin
        out = in;
    end
    
endmodule
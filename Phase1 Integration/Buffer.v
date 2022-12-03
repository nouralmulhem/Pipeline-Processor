module Buffer #(parameter N = 16) (clk, in, out);

    input clk;
    input [N-1:0] in;
    output reg [N-1:0] out;

    always @(negedge clk) begin
        out = in;
    end
    
endmodule
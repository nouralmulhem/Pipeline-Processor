`include "Fetch.v"

module Processor();

    // clk1 --> PC, Register file, Memory
    // clk2 --> buffers
    reg clk1, clk2;

    // reset PC value to zero
    reg fetchReset;

    //instruction to be executed
    wire [15:0] fetchedInstOut;

    Fetch FetchModule(.branch(1'b0),.branchAdd({16{1'b0}}),.reset(fetchReset),.clk(clk1),.instruction(fetchedInstOut));

    initial begin
        clk1 = 1;
        clk2 = 0;
        fetchReset = 1;

        #2
        fetchReset = 1'b0; //begin 
    end

    always #(5) clk2 = ~clk2; //Buffers
    always @(clk2) begin
        #1 clk1 = ~clk1; //Stages
    end
endmodule
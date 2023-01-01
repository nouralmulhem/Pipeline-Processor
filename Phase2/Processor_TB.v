`include "Processor.v"
/*
Branch_Logic test bench
*/
module Processor_TB();

// clk1 --> PC, Register file, Memory
// clk2 --> buffers
    reg clk1, clk2;
// reset PC value to zero
    reg fetchReset;
    // reg interrupt;
    reg [15:0] inputPort;
    wire [15:0] outputPort;


//Modules
Processor ProcessorModule (
    .clk1(clk1),
    .clk2(clk2),
    .fetchReset(fetchReset),
    // .interrupt(interrupt), 
    .inputPort(inputPort), 
    .outputPort(outputPort));


initial begin

    // $dumpfile("Processor_TB.vcd");
    // $dumpvars;
    // clk1 = 1;
    // clk2 = 0;
    // fetchReset = 1;

    // #2
    // fetchReset = 1'b0; //begin 
end

//Generate Clock
// always #(5) clk2 = ~clk2; //Buffers
// always @(clk2) begin
//         #1 clk1 = ~clk1; //Stages
// end
endmodule
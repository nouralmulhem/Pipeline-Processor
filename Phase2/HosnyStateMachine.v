// case call or ret count will start with 2 push 16 bit from pc
// enter cout -1 here the count will be 1
// push other 16 bit from pc
// enter here count will be 0 take the second instruction
// case rti count start with 3 to push flag
module HonsyCallStateMachine(clk,interrupt,PC,reset,PC_out,continue);
input clk,reset,interrupt;
input [31:0] PC;
output reg continue;
output reg [31:0] PC_out;

// reg [1:0] count_state;

// localparam count = (interrupt === 1'b1) ? 2'b10 : 2'b01;
// localparam count = 2'b01;

always @(negedge clk)begin

    continue=1'b0;
    if(reset===2'b01)begin
        // count_state=count+interrupt;
        PC_out = PC;
        continue=1'b1;
    end else begin
//if(count_state !== 2'b00)
        PC_out = PC_out >> 16;
        // count_state=count_state-1'b1;
        continue=1'b0;
        // continue=1'b1;
    end

end

endmodule
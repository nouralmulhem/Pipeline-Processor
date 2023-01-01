// case call or ret count will start with 2 push 16 bit from pc
// enter cout -1 here the count will be 1
// push other 16 bit from pc
// enter here count will be 0 take the second instruction
// case rti count start with 3 to push flag
module HonsyCallStateMachine(clk,interrupt,PC,reset,PC_out,continue);
input clk,reset,interrupt;
input [47:0] PC;
output reg continue;
output reg [47:0] PC_out;

reg [1:0] count_state;

localparam count = 1'b1;

always @(negedge clk)begin

    // count_state = 2'b0;
    if(reset===1'b1)begin
        if(interrupt === 1'b1)begin
            count_state=2'b10;
            PC_out = PC+32'h0001;
        end else begin
            count_state=2'b01;
            PC_out = PC+32'h0002;
        end
        // count_state = count + interrupt;
        
        continue=1'b1;
    end else if(count_state > 2'b01) begin
        PC_out = PC_out >> 16;
        count_state=count_state-2'b01;
        continue=1'b1;
    end else begin
        PC_out = PC_out >> 16;
        continue=1'b0;
    end

end

endmodule
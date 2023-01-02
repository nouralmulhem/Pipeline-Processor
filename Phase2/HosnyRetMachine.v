// case call or ret count will start with 2 push 16 bit from pc
// enter cout -1 here the count will be 1
// push other 16 bit from pc
// enter here count will be 0 take the second instruction
// case rti count start with 3 to push flag
module HosnyRetStateMachine(clk,interrupt,reset,continue);
input clk,reset,interrupt;
output reg continue;

reg [1:0] count_state;

localparam count = 1'b1;

always @(negedge clk)begin

    // count_state = 2'b0;
    if(reset===1'b1)begin
        if(interrupt === 1'b1)begin
            count_state=2'b10;
        end else begin
            count_state=2'b01;
        end
        continue=1'b1;
    end else if(count_state > 2'b01) begin
        count_state=count_state-2'b01;
        continue=1'b1;
    end else begin
        continue=1'b0;
    end

end

endmodule
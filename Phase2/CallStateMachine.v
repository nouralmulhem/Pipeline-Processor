// case call or ret count will start with 2 push 16 bit from pc
// enter cout -1 here the count will be 1
// push other 16 bit from pc
// enter here count will be 0 take the second instruction
// case rti count start with 3 to push flag
module CallStateMachine(clk,reset,controlSignals_in,PC,controlSignals_out,PC_out);
input clk;
input reset;
input controlSignals_in;
input [31:0] PC;
output reg controlSignals_out;
output reg [31:0] PC_out;

localparam ready = 2'b00;
localparam read1 = 2'b01;

reg [1:0] state_reg;
reg [1:0] next_state;

always @(posedge clk)begin
	if(reset) begin
		state_reg <= ready;
	end else begin
	  	state_reg <= next_state;
		PC_out<= Pc >> 16;
	end
end

always @(state_reg)begin
	case(state_reg)
		ready: 
			next_state <= read1;
			PC_out <= PC;
		read1: 
			next_state <= ready;
		default: next_state <= ready;
	endcase
end

assign controlSignals_out = (state_reg == ready) ? controlSignals_in : controlSignals_out;

endmodule
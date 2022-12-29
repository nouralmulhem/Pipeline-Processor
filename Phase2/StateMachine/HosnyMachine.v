// case call or ret count will start with 2 push 16 bit from pc
// enter cout -1 here the count will be 1
// push other 16 bit from pc
// enter here count will be 0 take the second instruction
// case rti count start with 3 to push flag
module HonsyMachine(clk,count,continue,newCount);
input clk;
input[1:0] count;
output reg continue;
output reg [1:0] newCount;

always @(posedge clk)begin

  if(count===2'b00)begin
	newCount=2'b00;
	continue=1'b0;
  end else begin
	newCount=count-1'b1;
	continue=1'b1;
  end

end

endmodule
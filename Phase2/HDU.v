//Hazerd detection unit
/*

inputs:
  - memo read
  - write add
  - src
  - dst
  -count // count for state machine to make stalling
//////////////all the above for detect load use case (satll)
  - int    // for interupt
  - branch_out // for taken branch 
  - call       // for call return rti instructions
//////for detect flushing buffer when change pc 
output:
  -flush
  -stall
*/
module HDU(
clk,
mem_read,
write_add,
src,
dst,
count,
int,
branch_out,
ret,
flush_FD,
flush_DE,
stall
);
input clk,mem_read,int,branch_out,ret;
input [2:0]write_add,src,dst;
input [1:0] count ;
output reg flush_FD, flush_DE, stall;

always @(posedge clk) begin
  flush_DE = 1'b0;
  flush_FD = 1'b0;
  stall = 1'b0;
  if(mem_read === 1'b1 && stall === 1'b0) begin   
    //load use case
    if(write_add=== src || write_add===dst)begin
    stall=1'b1; // PC 
    flush_FD=1'b1; // FD buffer
    end
  end else if(count > 2'b01 && int)begin 
    stall=1'b1; 
    // in case of ret and rti need to flush all buffers before EX_buff on count
  end else if(branch_out === 1'b1 ||  // jmp
	        ret===1'b1         // ret rti
	        ) begin
      // ret - rti - jmp - interupt
    flush_DE=1'b1;
  end

end

endmodule

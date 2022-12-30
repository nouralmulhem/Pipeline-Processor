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
mem_read,
write_add,
src,
dst,
count,
int,
branch_out,
ret,
flush,
stall
);
input mem_read,int,branch_out,call;
input [2:0]write_add,src,dst;
input [1:0] count ;
output reg flush,stall;

always @ * begin
  if(mem_read == 1'b1) begin   
    //load use case
    if(write_add=== src || write_add===dst)begin
    stall=1'b1; 
    flush=1'b0;
    end
    else begin
    	flush=1'b0;
    	stall=1'b0; 
     end
  end else if(count > 2'b01 && int)begin 
    stall=1'b1; 
    flush=1'b0;
    // in case of ret and rti need to flush all buffers before EX_buff on count
  end else if(branch_out === 1'b1||  // jmp
	        ret===1'b1         // ret rti
	        ) begin
      // ret - rti - jmp - interupt
    flush=1'b1;
    stall=1'b0; 
  end else begin
    flush=1'b0;
    stall=1'b0; 
  end

end

endmodule

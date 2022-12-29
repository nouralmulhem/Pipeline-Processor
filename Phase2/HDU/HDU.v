//Hazerd detection unit
/*

inputs:
  - memo read
  - write add
  - src
  - dst
//////////////all the above for detect load use case (satll)
  - int    // for interupt
  - branch_out
  - call
//////for detect flushing buffer when change pc 
output:
  -flush
  -stall
*/
module HDU(
branch_out,
call,
mem_read,
write_add,
src,
dst,
int,
flush,
stall
);
input mem_read,int,branch_out,call;
input [2:0]write_add,src,dst;

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
  end
  else if(branch_out === 1'b1||  // jmp
	  call===1'b1 ||         // call ret rti
	  int === 1'b1           // interupt 
	) begin
//call - ret - rti - jmp - interupt
    flush=1'b1;
    stall=1'b0; 
  end  
  else begin
    flush=1'b0;
    stall=1'b0; 
  end

end

endmodule

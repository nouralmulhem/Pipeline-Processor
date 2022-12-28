//Hazerd detection unit
/*

inputs:
  - memo read
  - write add
  - src
  - dst
//////////////all the above for detect load use case (satll)
  - int    // for interupt
  - opcode
//////for detect flushing buffer when change pc 
output:
  -flush
  -stall
*/
module HDU(
opcode,
mem_read,
write_add,
src,
dst,
int,
flush,
stall
);
input mem_read,int;
input [3:0] opcode;
input [2:0]write_add,src,dst;

output reg flush,stall;

always @ * begin
  if(mem_read == 1'b1) begin   
//load use case
    if(write_add=== src || write_add===dst)begin
	stall=1'b1; 
	flush=1'b0;
    end
  end
  else if(opcode == 4'b1000||  //jmp
opcode == 4'b1001||            //call
opcode == 4'b1010||            //ret
opcode == 4'b1110||            // rti
int == 1'b1                    // interupt 
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

//Mux 
/*
Branch logic combinational logic
inputs:
  -zf:zero flag
  -cf:carry flag
  -nf:negative flag
  -branch:branch control signal
output:
  -branch_out:bit for either branch or not       
*/
module BranchLogic (zf,cf,nf,sel,branch,branch_out,flag_reg);
input zf,cf,nf,branch;
input [1:0]sel;
output branch_out;
output [2:0] flag_reg;


wire flag;
assign flag = ( sel == 2'b00 )? zf :
( sel == 2'b01) ? cf :
( sel == 2'b10) ? nf :
( sel == 2'b11) ? 1 : 1'bz ;

assign flag_reg = ( sel == 2'b00 )? {nf,cf,1'b0} :
( sel == 2'b01) ? {nf,1'b0,zf} :
( sel == 2'b10) ? {1'b0,cf,zf} :
( sel == 2'b11) ? {nf,cf,zf} : {nf,cf,zf} ;

assign branch_out=branch&flag;
endmodule
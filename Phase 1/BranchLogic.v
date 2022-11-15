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
module BranchLogic (zf,cf,nf,sel,branch,branch_out);
input zf,cf,nf,branch;
input [1:0]sel;
output branch_out;

wire flag;
assign flag = ( sel == 2'b00 )? zf :
( sel == 2'b01) ? cf :
( sel == 2'b10) ? nf :
( sel == 2'b11) ? 1 : 1'bx ;

assign branch_out=branch&flag;
endmodule

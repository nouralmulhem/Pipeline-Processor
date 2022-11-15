`include "BranchLogic.v"
/*
Branch_Logic test bench
*/
module BranchLogic_TB();
reg zf,cf,nf,branch;
reg [1:0]sel;
wire branch_out;

BranchLogic BranchLogicModule (zf,cf,nf,sel,branch,branch_out);

initial
begin

//not a branch Branch =0 zf=1 cf=1 nf=1  =>0
zf=1;
cf=1;
nf=1;
branch=0;
sel=2'b00;

//JZ (zf=0)  =>0
#5
zf=0;
cf=0;
nf=0;
branch=1;
sel=2'b00;

//JZ (zf=1)  =>1
#5
zf=1;
cf=0;
nf=0;
branch=1;
sel=2'b00;


//Jc (cf=0) =>0
#5
zf=0;
cf=0;
nf=0;
branch=1;
sel=2'b01;


//Jc (cf=1) =>1
#5
zf=0;
cf=1;
nf=0;
branch=1;
sel=2'b01;


//JN (nf=0) =>0
#5
zf=0;
cf=0;
nf=0;
branch=1;
sel=2'b10;

//JN (nf=1) =>1
#5
zf=0;
cf=0;
nf=1;
branch=1;
sel=2'b10;

//JMP  =>1
#5
zf=0;
cf=0;
nf=0;
branch=1;
sel=2'b11;

//JZ zf=0 cf=1 =>0
#5
zf=0;
cf=1;
nf=0;
branch=1;
sel=2'b00;

//JC zf=1 cf=1 nf=0  =>1
#5
zf=1;
cf=1;
nf=0;
branch=1;
sel=2'b01;


//JC zf=1 cf=0 nf=1  =>0
#5
zf=1;
cf=0;
nf=1;
branch=1;
sel=2'b01;
end

endmodule
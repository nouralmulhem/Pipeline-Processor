//ALU
/*
Branch logic combinational logic
inputs:

output:
     
*/
module ALU (in1,in2,aluControl,out,flag);

input [15:0] in1,in2;
input [2:0] aluControl;
output [15:0] out;
output [2:0] flag;

// assign out={16{1'b0}};
// assign flag=3'b101;



// wire [15:0]sum;
// wire carry;
// assign {carry_sum,sum}=in1+in2;

// always @ * begin
// if(aluControl == 3'b000)begin
// //nop
// // {flag[1],out}=in1+in2;
// //flag[0]=(out=='b0) ? 1'b1:1'b0;
// //flag[0]=(out<0)?1'b1:1'b0;
// end


// if(aluControl==3'b001)begin
// //add
// {flag[1],out} = in1 + in2;
// flag[0] =  (out == 1'b0) ? 1'b1:1'b0;
// flag[0] = (out<0) ? 1'b1:1'b0;
// end



// if(aluControl==3'b010)begin
// //NOT
// out=~in2;
// //flag[0]=(out=='b0) ? 1'b1:1'b0;
// //flag[0]=(out<0)?1'b1:1'b0;
// end


// if(aluControl==3'b011)begin
// //LDD
// out=in1;
// //flag[0]=(out=='b0) ? 1'b1:1'b0;
// //flag[0]=(out<0)?1'b1:1'b0;
// end


// if(aluControl==3'b000)begin
// //STD
// out=in2;
// //flag[0]=(out=='b0) ? 1'b1:1'b0;
// //flag[0]=(out<0)?1'b1:1'b0;
// end

// end

assign {flag[1], out} = 
        (aluControl == 3'b011) ? in1 + in2:                
        (aluControl == 3'b100) ? {flag[1],~in2}:                     
        (aluControl == 3'b001) ? {flag[1],in1}: 
        (aluControl == 3'b010) ? {flag[1],in1}: {flag[1], out};   // Add : Not : Nop(ALUOp is 0) 

/*
assign out = 
(aluControl == 3'b000 ) ? 'bz : 
(aluControl == 3'b001 ) ? sum : 
(aluControl == 3'b010 ) ? ~in2 : 
(aluControl == 3'b011 ) ? in1 : 
(aluControl == 3'b100 ) ? in2 : 'bx;
*/
endmodule
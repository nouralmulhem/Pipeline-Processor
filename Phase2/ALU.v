//ALU
/*
Branch logic combinational logic
inputs:

output:
     
*/
module ALU (in1,in2,aluControl,out,flag);

input signed [15:0] in1,in2;
input [3:0] aluControl;
output signed [15:0] out;
output [2:0] flag;//Negative Carry Zero

//Carry Flag
assign {flag[1], out} = 
        (aluControl == 4'b0001) ? {flag[1],~in2}:            //NOT   
        (aluControl == 4'b0010) ? in1 + in2:            //ADD   
        (aluControl == 4'b0011) ? {flag[1],in1}:            //LDM LDD STD
        (aluControl == 4'b0100) ? in1 - in2:            //SUB
        (aluControl == 4'b0101) ? {flag[1],in1&in2}:            //AND
        (aluControl == 4'b0110) ? {flag[1],in1|in2}:            //OR
        (aluControl == 4'b0111) ? in2+1:            //inc
        (aluControl == 4'b1000) ? in2-1:            //dec
        (aluControl == 4'b1010) ? {1'b1,out}:            //sec
        (aluControl == 4'b1001) ? {1'b0,out}:            //clc1
        (aluControl == 4'b1011) ? in2<<in1:            //shl
        (aluControl == 4'b1100) ? in2>>in1:            //shr
        (aluControl == 4'b1111) ? {flag[1],in2}:      //IN
        {flag[1], out};                                //NOP

        // (aluControl == 3'b100) ? {flag[1],~in2}:       //NOT               
        // (aluControl == 3'b001) ? {flag[1],in1}:        //LDD
        // (aluControl == 3'b111) ? {flag[1],in1}:        //LDM
        // (aluControl == 3'b010) ? {flag[1],in1}:        //STD
        // {flag[1], out};                                //NOP


//Zero Flag
assign flag[0]=(aluControl === 4'b0000 || aluControl === 4'b0011 || aluControl === 4'b1111 || aluControl === 4'b1001 || aluControl === 4'b1010)?flag[0]:((out=={16{1'b0}})?1'b1:1'b0);

// Negative Flag
assign flag[2]=(aluControl === 4'b0000 || aluControl === 4'b0011 || aluControl === 4'b1111 || aluControl === 4'b1001 || aluControl === 4'b1010)?flag[2]:((out<0)?1'b1:1'b0);


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
/*
assign out = 
(aluControl == 3'b000 ) ? 'bz : 
(aluControl == 3'b001 ) ? sum : 
(aluControl == 3'b010 ) ? ~in2 : 
(aluControl == 3'b011 ) ? in1 : 
(aluControl == 3'b100 ) ? in2 : 'bx;
*/
endmodule
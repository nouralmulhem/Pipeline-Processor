//ALU Control for phase 1 should be modified later
module ALUControl (aluOp, funct, opcode, aluControl);
    input aluOp;
    input [3:0] opcode
    input [2:0] funct;
    output [2:0] aluControl;

    // if combinational circuit
    // assign aluControl = 
    //     (aluOp == 1) ? ((funct == 3'b001) ? 3'b001:                     //LDD
    //                     (funct == 3'b111) ? 3'b111:                     //LDM
    //                     (funct == 3'b010) ? 3'b010:                     //Store
    //                     (funct == 3'b011) ? 3'b011: 3'b100) : 3'b101;   // Add : Not : Nop(aluOp is 0) 

    assign aluControl = (aluOp == 1) ?
        (opcode == 4'b0001 && funct = 3'b) ? 3'b :  // clrc
        (opcode == 4'b0001 && funct = 3'b) ? 3'b :  // setc
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // not
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // inc
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // dec
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // mov
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // add
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // sub
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // and
        (opcode == 4'b0010 && funct = 3'b) ? 3'b :  // or
        (opcode == 4'b0101 && funct = 3'b) ? 3'b :  // shl
        (opcode == 4'b0101 && funct = 3'b) ? 3'b :  // shr
        (opcode == 4'b0101 && funct = 3'b) ? 3'b :  // ldm
        (opcode == 4'b1011 && funct = 3'b) ? 3'b :  // ldd
        (opcode == 4'b1100 && funct = 3'b) ? 3'b :  // std
        (opcode == 4'b1100 && funct = 3'b) ? 3'b :  // push
        (opcode == 4'b1100 && funct = 3'b) ? 3'b :  // pop
        (opcode == 4'b1000 && funct = 3'b) ? 3'b :  // jz
        (opcode == 4'b1000 && funct = 3'b) ? 3'b :  // jn
        (opcode == 4'b1000 && funct = 3'b) ? 3'b :  // jc
        (opcode == 4'b1000 && funct = 3'b) ? 3'b :  // jmp
        (opcode == 4'b1001 && funct = 3'b) ? 3'b :  // call
        (opcode == 4'b1010 && funct = 3'b) ? 3'b :  // rti
        (opcode == 4'b1010 && funct = 3'b) ? 3'b :  // ret
        (opcode == 4'b0011 && funct = 3'b) ? 3'b :  // out
        (opcode == 4'b0100 && funct = 3'b) ? 3'b :  // in : default: nop




endmodule

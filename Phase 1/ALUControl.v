//ALU Control for phase 1 should be modified later
module ALUControl (ALUOp, Funct, Operation);
    input ALUOp;
    input [2:0] Funct;
    output [2:0] Operation;

    // if sequential circuit
    // always @(posedge clk) begin
    //     if(ALUOp) begin
    //     case (Funct)
    //         3'b001 : Operation = 3'b001;      //Load
    //         3'b010 : Operation = 3'b010;      //Store
    //         3'b011 : Operation = 3'b011;      //Add
    //         3'b100 : Operation = 3'b100;      //Not
    //         // 3'b101 : Operation = 3'b101;      //No Operation
    //         default: Operation = 3'b101;      //No Operation
    //     endcase
    // end
    // end

    // if combinational circuit
    assign Operation = 
        (ALUOp == 1) ? ((Funct == 3'b001) ? 3'b001:                     //Load
                        (Funct == 3'b010) ? 3'b010:                     //Store
                        (Funct == 3'b011) ? 3'b011: 3'b100) : 3'b101;   // Add : Not : Nop(ALUOp is 0) 
endmodule

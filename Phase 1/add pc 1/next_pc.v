module next_pc(clk,
pc,
next_pc
);
input clk;
input[31:0] pc;
output reg[31:0] next_pc;

always @ (posedge clk) begin
  next_pc = pc + 1;
end

endmodule
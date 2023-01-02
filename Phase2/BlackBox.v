module BlackBox(clk,interrupt,PC,reset,PC_out, sel);
input clk,reset,interrupt;
input [15:0] PC;
output reg [47:0] PC_out;
output reg sel;

reg [1:0] count_state;

localparam count = 1'b1;

always @(posedge clk)begin

// if(interrupt === 1'b1)begin
//             // count_state=2'b10;
//             // PC_out = PC+32'h0001;
//         end else begin
            
//         end
    // count_state = 2'b0;

// else if(count_state > 2'b01) begin
//         PC_out = PC_out << 16;
//         PC_out[15:0] = PC;
//         count_state=count_state-2'b01;
//         sel = 1'b0;
//     end else if(count_state===2'b01) begin
//         count_state=count_state-2'b01;
//         sel = 1'b1;
//     end
    if(reset===1'b1)begin
        count_state=2'b01;
        PC_out = {32'b0 , PC};
    end else if (count_state === 2'b01)begin
        count_state=count_state-2'b01;
        PC_out = PC_out << 16;
        PC_out[15:0] = PC;
        sel = 1'b1;
    end else begin
        sel = 1'b0;
    end

end

endmodule
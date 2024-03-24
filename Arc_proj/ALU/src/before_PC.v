module Before_PC(
    input wire [31:0] currentPC,  // Current PC value
    input wire [25:0] Imm26,      
    input wire [15:0] Imm16,      
    input wire ExtOp,             
    input wire [1:0] sel,         
    output reg [31:0] out         
);

wire [31:0] in0 = currentPC + 4;  // Next instruction address
wire [31:0] in1 = {currentPC[31:28], Imm26};
reg [31:0] in2;

always @(*) begin
    if (ExtOp)
        in2 = {{16{Imm16[15]}}, Imm16} + currentPC + 4;  // Sign extension
    else
        in2 = {16'b0, Imm16} + currentPC + 4;           // Zero extension
end

always @(*) begin
    case (sel)
        2'b00: out = in0;  // Increment PC by 4
        2'b01: out = in1;  // PC[31:28] ? Imm26
        2'b10: out = in2;  // PC + Imm16 (with extension)
        default: out = 32'bx;  // Handle unexpected cases
    endcase
end

endmodule
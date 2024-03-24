module PCControlFunction(
    input wire [5:0] Op,
    input wire Zero,
    input wire BGT,
    input wire BLT,
    output reg [1:0] PC_SRC
);

always @*
    if (Op == 6'b001010 && Zero) PC_SRC = 2'b10;  // beq
    else if (Op == 6'b001011 && !Zero) PC_SRC = 2'b10;  // bne
    else if (Op == 6'b001001 && BLT) PC_SRC = 2'b10;  // blt
    else if (Op == 6'b001000 && BGT) PC_SRC = 2'b10;  // bgt
    else if (Op == 6'b001100 || Op == 6'b001101) PC_SRC = 2'b01;  // jump or call
    else PC_SRC = 2'b00;  // other instruction or no if statement is true

endmodule


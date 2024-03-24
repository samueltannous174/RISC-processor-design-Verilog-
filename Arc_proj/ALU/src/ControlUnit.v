module Control_Unit(
    input wire [5:0] opcode,
    output reg RegDst,
    output reg RegWrite,
    output reg ExtOp,
    output reg ALUSrc,
    output reg MemRd,
    output reg MemWrite,
    output reg WBdata
);

always @*
    case (opcode)
        6'b000000, 6'b000001, 6'b000010:
            {RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b1x0000; //Rtype
        6'b000011:
            {RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b101000; // ANDI
        6'b000100:
            {RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b111000; // ADDI
        6'b000101, 6'b000110:
            {RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b111101; // lw
        6'b000111:
            {RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b01101x; // sw
        6'b001000, 6'b001001, 6'b001010, 6'b001011:
            {RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b01000x; // branches
        6'b001100:																						
		{RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b0xx00x;   // j	
		6'b001101:																						
		{RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b0xx00x;   // j
		
        default:
            {RegWrite, ExtOp, ALUSrc, MemRd, MemWrite, WBdata} = 6'b000000; // Default case
    endcase

endmodule

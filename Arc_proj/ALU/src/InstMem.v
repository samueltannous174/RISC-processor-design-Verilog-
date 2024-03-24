module InstMemory (
  input wire [31:0] addr,
  output reg [31:0] instruction
);

  // Memory to store instructions
  reg [31:0] mem [0:1023];

  // Example instruction at address 0 (AND instruction)
  initial begin
    mem[0] = 32'h0000000000000000; // 6'b000000 | 4'b0000 | 4'b0000 | 4'b0001 | 14'b00000000000000
    // Example instruction at address 1 (ADD instruction)
    mem[1] = 32'h0001000000000000; // 6'b000001 | 4'b0001 | 4'b0010 | 4'b0011 | 14'b00000000000000
    // Example instruction at address 2 (SUB instruction)
    mem[2] = 32'h0002000000000000; // 6'b000010 | 4'b0010 | 4'b0011 | 4'b0100 | 14'b00000000000000
    // Example instruction at address 3 (ANDI instruction)
    mem[3] = 32'h0003110012340100; // 6'b000011 | 4'b0001 | 4'b0011 | 16'h1234 | 2'b01
    // Example instruction at address 4 (ADDI instruction)
    mem[4] = 32'h0004000200340100; // 6'b000100 | 4'b0002 | 4'b0011 | 16'h3456 | 2'b01
    // Example instruction at address 5 (LW instruction)
    mem[5] = 32'h0005010300400100; // 6'b000101 | 4'b0011 | 4'b0003 | 16'h4001 | 2'b00
    // Example instruction at address 6 (LW.POI instruction)
    mem[6] = 32'h0006010412340100; // 6'b000110 | 4'b0100 | 4'b0004 | 16'h1234 | 2'b01
    // Example instruction at address 7 (SW instruction)
    mem[7] = 32'h0007010500400100; // 6'b000111 | 4'b0101 | 4'b0005 | 16'h4001 | 2'b00
    // Example instruction at address 8 (BGT instruction)
    mem[8] = 32'h001000060712345001; // 6'b001000 | 4'b0000 | 4'b0111 | 16'h2345 | 2'b01
    // Example instruction at address 9 (BLT instruction)
    mem[9] = 32'h001001060801234502; // 6'b001001 | 4'b0000 | 4'b1000 | 16'h1234 | 2'b10
    // Example instruction at address 10 (BEQ instruction)
    mem[10] = 32'h001010070901234512; // 6'b001010 | 4'b0000 | 4'b1001 | 16'h2345 | 2'b10
    // Example instruction at address 11 (BNE instruction)
    mem[11] = 32'h001011081001234523; // 6'b001011 | 4'b0000 | 4'b1001 | 16'h3456 | 2'b11
    // Example instruction at address 12 (JMP instruction)
    mem[12] = 32'h0011000A00000000; // 6'b001100 | 26'b00000000000000000000000000
    // Example instruction at address 13 (CALL instruction)
    mem[13] = 32'h0011010B12345678; // 6'b001101 | 26'b12345678
    // Example instruction at address 14 (RET instruction)
    mem[14] = 32'h0011100C00000000; // 6'b001110 | 26'b00000000000000000000000000
    // Example instruction at address 15 (PUSH instruction)
    mem[15] = 32'h0011110D00000000; // 6'b001111 | 4'b1101 | 22'b00000000000000000000
    // Example instruction at address 16 (POP instruction)
    mem[16] = 32'h0100000E00000000; // 6'b010000 | 4'b1110 | 22'b00000000000000000000
    // Add more instructions as needed
  end

  always @(*) begin
    // Read the instruction at the specified address
    instruction = mem[addr];
  end

endmodule

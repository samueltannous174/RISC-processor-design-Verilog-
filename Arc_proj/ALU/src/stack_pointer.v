 module StackPointer (
  input wire clk,          // Clock input
  input wire rst,          // Reset input
  input wire push,         // Push operation
  input wire pop,		// Pop operation
  input wire StackOP,	
  input wire MemRD,
  input wire MemWR,
  output reg [31:0] sp       // Stack pointer, 4 bits to represent 16 locations
);
	parameter MEM_DEPTH = 16; // 64 bytes = 16 words
	parameter Stack_Depth = MEM_DEPTH / 2;
  always @(posedge clk) begin
          
     if (MemWR && StackOP) begin 
		 if(Stack_Depth<MEM_DEPTH-1)
      sp <= sp + 1;        // Increment stack pointer on push
    end else if (MemRD && StackOP) begin
		if(sp >= Stack_Depth)
      sp <= sp - 1;        // Decrement stack pointer on pop
    end
  end

endmodule
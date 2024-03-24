module DataMemory(
    input wire clk,
    input wire [31:0] MemAddr,
    input wire MemRD,
    input wire MemWR,
	input wire StackOP,
	input wire [31:0] stack_pointer,
    input wire [31:0] MemDataIn,
    output reg [31:0] MemDataOut // Declare as reg
);

parameter MEM_DEPTH = 16; // 64 bytes = 16 words
parameter Stack_Depth = MEM_DEPTH / 2;
reg [31:0] memory [0:MEM_DEPTH-1];
//reg [3:0] stack_pointer; // 4-bit stack pointer (16 words)

always @(posedge clk) begin
    // Memory Read
    if (MemRD && ~StackOP) begin
        MemDataOut <= memory[MemAddr];
    end

    // Memory Write
    if (MemWR && ~StackOP) begin
        memory[MemAddr] <= MemDataIn;
		if (MemAddr < Stack_Depth) begin
			memory[MemAddr] <= MemDataIn; 
		end
        else begin
             $display("Attempted write to stack address %h from normal memory write.", MemAddr);
        end
    end

    // Stack operations
    if (StackOP && MemWR) begin
        // Push onto stack (assuming a 4-byte data width)
        if (stack_pointer < MEM_DEPTH-1) begin
            //stack_pointer <= stack_pointer + 1;
            memory[stack_pointer] <= MemDataIn;
        end
    end

    if (StackOP && MemRD) begin
        // Pop from stack (assuming a 4-byte data width)
        if (stack_pointer >= Stack_Depth) begin
             MemDataOut <= memory[stack_pointer]; 
           // stack_pointer <= stack_pointer - 1;
        end
    end
end


endmodule	  




module DataMemory_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // in time units
  parameter MEM_DEPTH = 16; // 64 bytes = 16 words

  // Signals
  reg clk;
  reg [31:0] MemAddr, MemDataIn;
  reg MemRD, MemWR, StackOP;
  reg [31:0] stack_pointer;
  wire [31:0] MemDataOut;

  // Instantiate the module
  DataMemory uut (
    .clk(clk),
    .MemAddr(MemAddr),
    .MemDataIn(MemDataIn),
    .MemRD(MemRD),
    .MemWR(MemWR),
    .StackOP(StackOP),
    .stack_pointer(stack_pointer),
    .MemDataOut(MemDataOut)
  );

  // Clock Generation
  always begin	 
	clk = 1'b0;
    forever #5s clk = ~clk;
  end

  // Initial block
  initial begin
    // Initialize variables
    //clk = 0;
    MemAddr = 0;
    MemDataIn = 0;
    MemRD = 0;
    MemWR = 0;
    StackOP = 1;
    stack_pointer = 8;

    // Apply stimulus
    // Write to normal memory
    MemAddr = 4; // Choose an address within MEM_DEPTH
    MemDataIn = 32'h12345678;
    MemWR = 1;
    #10s;
    MemWR = 0;

    // Read from normal memory
    MemAddr = 4; // Choose the same address as before
    MemRD = 1;
    #10s;
    MemRD = 0;

    // Push to stack
    StackOP = 1;
    MemAddr = 0; // Address doesn't matter for stack operations
    MemDataIn = 32'h87654321;
	stack_pointer = 12;
    MemWR = 1;
    #10s;
    MemWR = 0;
    StackOP = 1;

    // Pop from stack
    StackOP = 1;
    MemRD = 1;
    #10s;
    MemRD = 0;
    StackOP = 0;

    // Add more test cases as needed

    #500s; // Run for a while to observe results
    $finish;
  end

endmodule





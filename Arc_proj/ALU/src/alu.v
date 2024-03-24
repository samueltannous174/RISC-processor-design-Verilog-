module ALU (
  input [31:0] operandA,
  input [31:0] operandB,
  input [5:0] opcode,
  output reg [31:0] result,
  output reg [31:0] retReg,
  output reg zero, 
  output reg bgt,
  output reg blt
);

always @* begin
  case(opcode)
	//for R-type
    6'b000000: result = operandA & operandB; // AND
    6'b000001: result = operandA + operandB; // ADD
    6'b000010: result = operandA - operandB; // SUB
	
	//for I-type
    6'b000011: result = operandA & operandB; // ANDI
    6'b000100: result = operandA + operandB; // ADDI
	6'b000101: result = operandA + operandB; // LW
	6'b000110: 								 // LW with Post increament	
	begin
		result = operandA + operandB;
		retReg = operandA + 1;
	end			 
	
	6'b000111: result = operandA + operandB; // SW
	6'b001000: 								 // BGT
	begin
		if(operandB > operandA)
			bgt = 1;
		else
			bgt = 0;
	end
	
	6'b001001: 								//BLT
	begin
		if(operandB < operandA)
			blt = 1;
		else
			blt = 0;
	end
	
	6'b001010: 								//BEQ
	begin
		if(operandB == operandA) begin
			zero = 1;
		end else
			zero = 0;
	end
	
	6'b001011:			   				   //BNE
	begin
		if(operandB != operandA) begin
			zero = 0;
		end else
			zero = 1;
	end
	
	
    default: result = 32'b0; // Default case (zero)
  endcase

  zero = (result == 32'b0); // Set zero flag
  bgt = (result == 32'b0);	//set bgt flag	   
  blt = (result == 32'b0);	//set blt flag
end		  

endmodule




module alu_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // in time units

  // Signals
  reg [31:0] operandA, operandB;
  reg [5:0] opcode;
  wire [31:0] result, retReg;
  wire zero, bgt, blt;

  // Instantiate the module
  alu uut (
    .operandA(operandA),
    .operandB(operandB),
    .opcode(opcode),
    .result(result),
    .retReg(retReg),
    .zero(zero),
    .bgt(bgt),
    .blt(blt)
  );

  // Clock Generation
  always begin
    #10s operandA = 20;
    #10s operandB = 10;
    #10s opcode = 5; // Limit opcode to 6 bits
    #10s;
  end

  // Initial block
  initial begin
    // Apply stimulus and print results
    for (int i = 0; i < 12; i = i + 1) begin
      // Randomize inputs
      operandA = 2;
      operandB = 3;
      opcode = opcode + 1; // Limit opcode to 6 bits

      #15s; // Wait for one clock cycle

      // Print the inputs and outputs for verification
      $display("Cycle %0d: operandA=%h, operandB=%h, opcode=%b, result=%h, retReg=%h, zero=%b, bgt=%b, blt=%b",
                i, operandA, operandB, opcode, result, retReg, zero, bgt, blt);
    end

    $finish; // Finish simulation
  end

endmodule

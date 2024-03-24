   module next_instruction(
	   input wire [31:0] current_instruction,
	   output reg[31:0] next_instruction
	   ); 
	   
	   
	   always@(*)
		   begin
		   
		   next_instruction= current_instruction+4;
		   end 
		   endmodule
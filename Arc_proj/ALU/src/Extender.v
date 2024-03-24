module Extender (
  input [15:0] immediate, // 16-bit immediate value
  input sign_extend,      // Control signal for sign extension (1) or zero extension (0)
  output reg [31:0] result // Extended 32-bit immediate value
);

  always @(*)
    if (sign_extend)
      result = {{16{immediate[15]}}, immediate}; // Sign extension
    else
      result = {{16'b0}, immediate}; // Zero extension

endmodule
module MUX2x1 (
  input wire [31:0] a,
  input wire [31:0] b,
  input wire select,
  output reg [31:0] y
);

  always @(select) begin
    // 2x1 MUX logic
    if (select == 0)
      y = a;
    else
      y = b;
  end

endmodule

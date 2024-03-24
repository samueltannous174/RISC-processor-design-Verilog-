module MUX2x1_4Bits (
  input wire [3:0] a,
  input wire [3:0] b,
  input wire select,
  output reg [3:0] y
);

  always @(select) begin
    // 2x1 MUX logic
    if (select == 0)
      y = a;
    else
      y = b;
  end

endmodule

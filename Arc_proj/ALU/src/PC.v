module ProgramCounter(
    input wire clk,
    input wire [31:0] nextAddress,
    output reg [31:0] currentAddress
);

// Update PC on each rising edge of the clock
always @(posedge clk) begin
    currentAddress <= nextAddress;
end

endmodule
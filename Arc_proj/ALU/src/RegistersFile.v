module Register_File (
  input wire clk,
  input wire [3:0] read_registerA,
  input wire [3:0] read_registerB,
  input wire [3:0] read_currentDataRD,
  input wire [3:0] write_register,
  input wire write_enable,
  input wire [31:0] write_data,
  output reg [31:0] read_dataA,
  output reg [31:0] read_dataB,
  output reg [31:0] currentDataRD
);

  reg [31:0] registers [0:15];  // 16 registers, each 32 bits wide

  always @(posedge clk) begin
    read_dataA <= registers[read_registerA];
    read_dataB <= registers[read_registerB];
	currentDataRD <= registers[read_currentDataRD];
	

    if (write_enable) begin     // Write data to register if write_enable==1
      registers[write_register] <= write_data;
    end
  end

endmodule
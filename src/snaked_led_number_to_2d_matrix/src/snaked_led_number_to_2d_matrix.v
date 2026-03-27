`default_nettype none

module snaked_led_number_to_2d_matrix (
  input wire [7:0] n,
  output wire [3:0] x,
  output wire [3:0] y
);

  assign x = x_val;
  assign y = x_val;

  reg [3:0] x_val;
  initial x_val <= 0;

  reg [3:0] y_val;
  initial y_val <= 0;

endmodule

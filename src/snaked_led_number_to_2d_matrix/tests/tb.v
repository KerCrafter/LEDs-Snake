`default_nettype none
`timescale 1ns / 1ps

module tb ();
  wire [7:0] n;
  wire [3:0] x;
  wire [3:0] y;

  snaked_led_number_to_2d_matrix snaked_led_number_to_2d_matrix_inst (
      .n (n),
      .x (x),
      .y (y)
  );

endmodule

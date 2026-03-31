`default_nettype none
`timescale 1ns / 1ps

module tb ();

  // Dump the signals to a FST file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb);
    #1;
  end

  wire clk;
  wire reset;
  wire move_timer;
  wire players_commands_left;
  wire players_commands_right;
  wire players_commands_up;
  wire players_commands_down;
  wire [3:0] bonus_random_x;
  wire [3:0] bonus_random_y;

  wire [3:0] current_led_x;
  wire [3:0] current_led_y;
  wire update_frame;
  wire [7:0] led_red_intensity;
  wire [7:0] led_green_intensity;
  wire [7:0] led_blue_intensity;

  LEDs_snake_core snake_core (
      .clk  (clk),
      .reset  (reset),
      .move_timer (move_timer),
      .bonus_random_x (bonus_random_x),
      .bonus_random_y (bonus_random_y),
      .players_commands_left (players_commands_left),
      .players_commands_right (players_commands_right),
      .players_commands_up(players_commands_up),
      .players_commands_down (players_commands_down),
      .current_led_x(current_led_x),
      .current_led_y(current_led_y),
      .update_frame(update_frame),
      .led_red_intensity(led_red_intensity),
      .led_green_intensity(led_green_intensity),
      .led_blue_intensity(led_blue_intensity)
  );

endmodule

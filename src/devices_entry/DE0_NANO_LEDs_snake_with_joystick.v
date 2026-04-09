module DE0_NANO_LEDs_snake_with_joystick(
    input  wire reset,
    input  wire clk,
    input  wire top_left_sw,
    input  wire top_right_sw,
    input  wire bottom_left_sw,
    input  wire bottom_right_sw,
    output wire leds_line
);

    wire left;
    wire right;
    wire up;
    wire down;

    joystick_8_directions u_joystick_8_directions (
      .top_right_sw(top_right_sw),
      .top_left_sw(top_left_sw),
      .bottom_right_sw(bottom_right_sw),
      .bottom_left_sw(bottom_left_sw),
      .up(up),
      .down(down),
      .left(left),
      .right(right)
    );

    LEDs_snake_main #(
        .MAX_POS(256),
        .DEBOUNCE_CLK_CNT(65536)
    ) u_LEDs_snake_main (
        .clk(clk),
        .reset(reset),
        .left(left),
        .right(right),
        .up(up),
        .down(down),
        .leds_line(leds_line)
    );

endmodule


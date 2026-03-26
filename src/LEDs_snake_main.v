`default_nettype none

module LEDs_snake_main #(
    parameter MAX_POS = 256,
    parameter DEBOUNCE_CLK_CNT = 65536
)(
    input  wire clk,
    input  wire reset,
    input  wire left,
    input  wire right,
    input  wire up,
    input  wire down,
    output wire leds_line
);

    wire [$clog2(MAX_POS)-1:0] led_proceed;
    wire update_frame;
    wire [7:0] red_intensity;
    wire [7:0] blue_intensity;
    wire [7:0] green_intensity;

    wire players_commands_left;
    wire players_commands_right;
    wire players_commands_up;
    wire players_commands_down;

    button_debouncer #(
        .DEBOUNCE_CLK_CNT(DEBOUNCE_CLK_CNT)
    ) left_debouncer (
        .clk(clk),
        .reset(reset),
        .btn_in(left),
        .btn_debounced(players_commands_left)
    );

    button_debouncer #(
        .DEBOUNCE_CLK_CNT(DEBOUNCE_CLK_CNT)
    ) right_debouncer (
        .clk(clk),
        .reset(reset),
        .btn_in(right),
        .btn_debounced(players_commands_right)
    );

    button_debouncer #(
        .DEBOUNCE_CLK_CNT(DEBOUNCE_CLK_CNT)
    ) up_debouncer (
        .clk(clk),
        .reset(reset),
        .btn_in(up),
        .btn_debounced(players_commands_up)
    );

    button_debouncer #(
        .DEBOUNCE_CLK_CNT(DEBOUNCE_CLK_CNT)
    ) down_debouncer (
        .clk(clk),
        .reset(reset),
        .btn_in(down),
        .btn_debounced(players_commands_down)
    );

    WS2812B_driver #(
        .MAX_POS(MAX_POS)
    ) WS2812B_driver_inst (
        .clk(clk),
        .reset(reset),
        .leds_line(leds_line),
        .program_led_number(led_proceed),
        .program_red_intensity(red_intensity),
        .program_blue_intensity(blue_intensity),
        .program_green_intensity(green_intensity),
        .update_frame(update_frame)
    );

    LEDs_snake_core #(
        .MAX_POS(MAX_POS)
    ) LEDs_snake_core_inst (
        .clk(clk),
        .reset(reset),
        .update_frame(update_frame),
        .players_commands_left(players_commands_left),
        .players_commands_right(players_commands_right),
        .players_commands_up(players_commands_up),
        .players_commands_down(players_commands_down),
        .current_led(led_proceed),
        .led_green_intensity(green_intensity),
        .led_red_intensity(red_intensity),
        .led_blue_intensity(blue_intensity)
    );

endmodule

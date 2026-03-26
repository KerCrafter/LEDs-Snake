module LEDs_snake_core #(
    parameter MAX_POS = 16
)(
    input  wire reset,
    input  wire clk,
    input  wire players_commands_left,
    input  wire players_commands_right,
    input  wire players_commands_up,
    input  wire players_commands_down,
    input  wire [$clog2(MAX_POS)-1:0] current_led,
    output wire update_frame,
    output wire [7:0] led_red_intensity,
    output wire [7:0] led_green_intensity,
    output wire [7:0] led_blue_intensity
);

endmodule


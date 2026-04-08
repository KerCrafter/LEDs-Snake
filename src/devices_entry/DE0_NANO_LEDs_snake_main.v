module DE0_NANO_LEDs_snake_main(
    input  wire reset,
    input  wire clk,
    input  wire left,
    input  wire right,
    input  wire up,
    input  wire down,
    output wire leds_line
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


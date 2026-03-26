module LEDs_snake_core #(
    parameter MAX_POS = 256
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

  reg [7:0] red_intensity;
  reg [7:0] green_intensity;
  reg [7:0] blue_intensity;

  assign led_red_intensity = red_intensity;
  assign led_green_intensity = green_intensity;
  assign led_blue_intensity = blue_intensity;

  always @(posedge clk) begin
    if(current_led == 128) begin
      red_intensity <= 0;
      green_intensity <= 10;
      blue_intensity <= 0;
    end else begin
      red_intensity <= 0;
      green_intensity <= 0;
      blue_intensity <= 0;
    end
  end

endmodule


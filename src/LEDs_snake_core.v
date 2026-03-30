module LEDs_snake_core (
    input  wire reset,
    input  wire clk,
    input  wire move_timer,
    input  wire players_commands_left,
    input  wire players_commands_right,
    input  wire players_commands_up,
    input  wire players_commands_down,
    input  wire [3:0] current_led_x,
    input  wire [3:0] current_led_y,
    output wire update_frame,
    output wire [7:0] led_red_intensity,
    output wire [7:0] led_green_intensity,
    output wire [7:0] led_blue_intensity
);

  reg [3:0] snake_x_pos;
  reg [3:0] snake_y_pos;

  reg [7:0] red_intensity;
  reg [7:0] green_intensity;
  reg [7:0] blue_intensity;

  reg [1:0] direction;


  assign led_red_intensity = red_intensity;
  assign led_green_intensity = green_intensity;
  assign led_blue_intensity = blue_intensity;

  always @(posedge move_timer) begin
    if(direction == 0) begin
      snake_x_pos = snake_x_pos + 1;
    end

    if(direction == 1) begin
      snake_x_pos = snake_x_pos - 1;
    end

    if(direction == 2) begin
      snake_y_pos = snake_y_pos + 1;
    end

    if(direction == 3) begin
      snake_y_pos = snake_y_pos - 1;
    end
  end

  always @(clk) begin
    if(reset) begin
        direction <= 0;
        snake_x_pos <= 7;
        snake_y_pos <= 7;
        red_intensity <= 0;
        green_intensity <= 0;
        blue_intensity <= 0;
    end else begin

      if(players_commands_right) begin
        direction <= 0;
      end

      if(players_commands_left) begin
        direction <= 1;
      end

      if(players_commands_down) begin
        direction <= 2;
      end

      if(players_commands_up) begin
        direction <= 3;
      end

      if(current_led_x == snake_x_pos && current_led_y == snake_y_pos) begin
        red_intensity <= 0;
        green_intensity <= 10;
        blue_intensity <= 0;
      end else begin
        red_intensity <= 0;
        green_intensity <= 0;
        blue_intensity <= 0;
      end
    end
  end

endmodule


module LEDs_snake_core (
    input  wire reset,
    input  wire clk,
    input  wire move_timer,
    input  wire [3:0] bonus_random_x,
    input  wire [3:0] bonus_random_y,
    input  wire players_commands_left,
    input  wire players_commands_right,
    input  wire players_commands_up,
    input  wire players_commands_down,
    input  wire [3:0] current_led_x,
    input  wire [3:0] current_led_y,
    output wire update_frame,
    output wire [7:0] led_red_intensity,
    output wire [7:0] led_green_intensity,
    output wire [7:0] led_blue_intensity,
    output reg [7:0] score
);

  reg [3:0] queue_1_x;
  reg [3:0] queue_1_y;

  reg [3:0] snake_head_x_pos;
  reg [3:0] snake_head_y_pos;

  reg [3:0] current_bonus_x_pos;
  reg [3:0] current_bonus_y_pos;
  reg current_bonus_ready;

  reg [7:0] red_intensity;
  reg [7:0] green_intensity;
  reg [7:0] blue_intensity;

  reg [1:0] direction;

  assign led_red_intensity = red_intensity;
  assign led_green_intensity = green_intensity;
  assign led_blue_intensity = blue_intensity;

  always @(posedge move_timer) begin
    if(
      (direction == 0 && snake_head_x_pos + 1 == current_bonus_x_pos) ||
      (direction == 1 && snake_head_x_pos - 1 == current_bonus_x_pos) ||
      (direction == 2 && snake_head_y_pos + 1 == current_bonus_y_pos) ||
      (direction == 3 && snake_head_y_pos - 1 == current_bonus_y_pos)
    ) begin
      score = score + 1;

      queue_1_x = snake_head_x_pos;
      queue_1_y = snake_head_y_pos;

      snake_head_x_pos = current_bonus_x_pos;
      snake_head_y_pos = current_bonus_y_pos;

      current_bonus_ready = 0;

    end else begin
      queue_1_y = snake_head_y_pos;
      queue_1_x = snake_head_x_pos;

      if(direction == 0) begin
        snake_head_x_pos = snake_head_x_pos + 1;
      end else if(direction == 1) begin
        snake_head_x_pos = snake_head_x_pos - 1;
      end else if(direction == 2) begin
        snake_head_y_pos = snake_head_y_pos + 1;
      end else if(direction == 3) begin
        snake_head_y_pos = snake_head_y_pos - 1;
      end
    end
  end

  always @(clk) begin
    if(reset) begin
        score <= 0;
        queue_1_x <= 0;
        queue_1_y <= 0;
        direction <= 0;
        snake_head_x_pos <= 7;
        snake_head_y_pos <= 7;
        current_bonus_x_pos <= bonus_random_x;
        current_bonus_y_pos <= bonus_random_y;
        current_bonus_ready <= 1;
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


      if(score >= 1 && current_led_x == queue_1_x && current_led_y == queue_1_y) begin
        red_intensity <= 0;
        green_intensity <= 5;
        blue_intensity <= 0;
      end else if(current_led_x == snake_head_x_pos && current_led_y == snake_head_y_pos) begin
        red_intensity <= 0;
        green_intensity <= 10;
        blue_intensity <= 0;
      end else if(current_bonus_ready && current_led_x == current_bonus_x_pos && current_led_y == current_bonus_y_pos) begin
        red_intensity <= 10;
        green_intensity <= 0;
        blue_intensity <= 0;
      end else begin
        red_intensity <= 0;
        green_intensity <= 0;
        blue_intensity <= 0;
      end
    end
  end

endmodule


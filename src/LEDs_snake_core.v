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
    output reg [7:0] led_red_intensity,
    output reg [7:0] led_green_intensity,
    output reg [7:0] led_blue_intensity,
    output reg [7:0] score
);

  reg [3:0] queue_1_x;
  reg [3:0] queue_1_y;

  reg [3:0] queue_2_x;
  reg [3:0] queue_2_y;

  reg [3:0] queue_3_x;
  reg [3:0] queue_3_y;

  reg [3:0] snake_head_x_pos;
  reg [3:0] snake_head_y_pos;

  reg [3:0] current_bonus_x_pos;
  reg [3:0] current_bonus_y_pos;
  reg current_bonus_ready;

  reg [1:0] direction;

  reg end_game;

  always @(posedge move_timer) begin

    queue_1_x <= snake_head_x_pos;
    queue_1_y <= snake_head_y_pos;

    queue_2_x <= queue_1_x;
    queue_2_y <= queue_1_y;

    queue_3_x <= queue_2_x;
    queue_3_y <= queue_2_y;

    if(direction == 2 && snake_head_y_pos + 1 == queue_3_y && snake_head_x_pos == queue_3_x) begin
      end_game <= 1; 
    end else if(direction == 3 && snake_head_y_pos - 1 == queue_3_y && snake_head_x_pos == queue_3_x) begin
      end_game <= 1; 
    end else if(direction == 0 && snake_head_x_pos + 1 == queue_3_x && snake_head_y_pos == queue_3_y) begin
      end_game <= 1; 
    end else if(
      (direction == 0 && snake_head_x_pos + 1 == current_bonus_x_pos) ||
      (direction == 1 && snake_head_x_pos - 1 == current_bonus_x_pos) ||
      (direction == 2 && snake_head_y_pos + 1 == current_bonus_y_pos) ||
      (direction == 3 && snake_head_y_pos - 1 == current_bonus_y_pos)
    ) begin
      score <= score + 1;

      snake_head_x_pos <= current_bonus_x_pos;
      snake_head_y_pos <= current_bonus_y_pos;
 
      current_bonus_x_pos <= bonus_random_x;
      current_bonus_y_pos <= bonus_random_y;

    end else begin
      if(direction == 0) begin
        snake_head_x_pos <= snake_head_x_pos + 1;
      end else if(direction == 1) begin
        snake_head_x_pos <= snake_head_x_pos - 1;
      end else if(direction == 2) begin
        snake_head_y_pos <= snake_head_y_pos + 1;
      end else if(direction == 3) begin
        snake_head_y_pos <= snake_head_y_pos - 1;
      end
    end
  end

  always @(clk) begin
    if(reset) begin
        score <= 0;
        queue_1_x <= 0;
        queue_1_y <= 0;
        queue_2_x <= 0;
        queue_2_y <= 0;
        queue_3_x <= 0;
        queue_3_y <= 0;
        direction <= 0;
        snake_head_x_pos <= 7;
        snake_head_y_pos <= 7;
        current_bonus_x_pos <= bonus_random_x;
        current_bonus_y_pos <= bonus_random_y;
        current_bonus_ready <= 1;
        led_red_intensity <= 0;
        led_green_intensity <= 0;
        led_blue_intensity <= 0;
        end_game <= 0;
    end else begin
      if(players_commands_right && (direction != 1 || score == 0)) begin
        direction <= 0;
      end

      if(players_commands_left && (direction != 0 || score == 0)) begin
        direction <= 1;
      end

      if(players_commands_down && (direction != 3 || score == 0)) begin
        direction <= 2;
      end

      if(players_commands_up && (direction != 2 || score == 0)) begin
        direction <= 3;
      end

      if(end_game) begin
        led_red_intensity <= 10;
        led_green_intensity <= 0;
        led_blue_intensity <= 0;
      end else if(score >= 1 && current_led_x == queue_1_x && current_led_y == queue_1_y) begin
        led_red_intensity <= 0;
        led_green_intensity <= 5;
        led_blue_intensity <= 0;
      end else if(score >= 2 && current_led_x == queue_2_x && current_led_y == queue_2_y) begin
        led_red_intensity <= 0;
        led_green_intensity <= 5;
        led_blue_intensity <= 0;
      end else if(score >= 3 && current_led_x == queue_3_x && current_led_y == queue_3_y) begin
        led_red_intensity <= 0;
        led_green_intensity <= 5;
        led_blue_intensity <= 0;
      end else if(current_led_x == snake_head_x_pos && current_led_y == snake_head_y_pos) begin
        led_red_intensity <= 0;
        led_green_intensity <= 10;
        led_blue_intensity <= 0;
      end else if(current_bonus_ready && current_led_x == current_bonus_x_pos && current_led_y == current_bonus_y_pos) begin
        led_red_intensity <= 10;
        led_green_intensity <= 0;
        led_blue_intensity <= 0;
      end else begin
        led_red_intensity <= 0;
        led_green_intensity <= 0;
        led_blue_intensity <= 0;
      end
    end
  end

endmodule


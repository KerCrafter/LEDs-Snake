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
    output wire [7:0] score
);

  wire [3:0] snake_head_x_pos;
  wire [3:0] snake_head_y_pos;

  wire [3:0] queue_1_x;
  wire [3:0] queue_1_y;
  wire queue_1_collide;

  wire [3:0] queue_2_x;
  wire [3:0] queue_2_y;
  wire queue_2_collide;

  wire [3:0] queue_3_x;
  wire [3:0] queue_3_y;
  wire queue_last_collide;

  wire [1:0] direction;

  wire [3:0] current_bonus_x_pos;
  wire [3:0] current_bonus_y_pos;

  wire [7:0] led_red_intensity_1;
  wire [7:0] led_green_intensity_1;
  wire [7:0] led_blue_intensity_1;

  wire [7:0] led_red_intensity_2;
  wire [7:0] led_green_intensity_2;
  wire [7:0] led_blue_intensity_2;

  wire [7:0] led_red_intensity_3;
  wire [7:0] led_green_intensity_3;
  wire [7:0] led_blue_intensity_3;

  wire [7:0] led_red_intensity_4;
  wire [7:0] led_green_intensity_4;
  wire [7:0] led_blue_intensity_4;

  wire [7:0] led_red_intensity_5;
  wire [7:0] led_green_intensity_5;
  wire [7:0] led_blue_intensity_5;

  PlayerCommandsManager player_commands (
    .clk(clk),
    .reset(reset),
    .left(players_commands_left),
    .right(players_commands_right),
    .up(players_commands_up),
    .down(players_commands_down),
    .score(score),
    .direction(direction)
  );

  BonusManager bonus_manager (
    .clk(clk),
    .reset(reset),
    .move_act(move_timer),
    .direction(direction),
    .snake_head_x_pos(snake_head_x_pos),
    .snake_head_y_pos(snake_head_y_pos),
    .bonus_random_x(bonus_random_x),
    .bonus_random_y(bonus_random_y),
    .x_pos(current_bonus_x_pos),
    .y_pos(current_bonus_y_pos),
    .score(score)
  );

  SnakeHead snake_head (
    .clk(clk),
    .reset(reset),
    .direction(direction),
    .move_act(move_timer),
    .x_pos(snake_head_x_pos),
    .y_pos(snake_head_y_pos)
  );

  SnakeQueue queue_1 (
    .clk(clk),
    .reset(reset),
    .move_act(move_timer),
    .next_x_pos(snake_head_x_pos),
    .next_y_pos(snake_head_y_pos),
    .score(score),
    .active_when_score_min(8'd1),
    .direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(1'b0),
    .x_pos(queue_1_x),
    .y_pos(queue_1_y),
    .is_head_collide(queue_1_collide)
  );

  SnakeQueue queue_2 (
    .clk(clk),
    .reset(reset),
    .move_act(move_timer),
    .next_x_pos(queue_1_x),
    .next_y_pos(queue_1_y),
    .score(score),
    .active_when_score_min(8'd2),
    .direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_1_collide),
    .x_pos(queue_2_x),
    .y_pos(queue_2_y),
    .is_head_collide(queue_2_collide)
  );

  SnakeQueue queue_3 (
    .clk(clk),
    .reset(reset),
    .move_act(move_timer),
    .next_x_pos(queue_2_x),
    .next_y_pos(queue_2_y),
    .score(score),
    .active_when_score_min(8'd3),
    .direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_2_collide),
    .x_pos(queue_3_x),
    .y_pos(queue_3_y),
    .is_head_collide(queue_last_collide)
  );

  DrawBonus draw_bonus (
    .end_game(queue_last_collide),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .bonus_x_pos(current_bonus_x_pos),
    .bonus_y_pos(current_bonus_y_pos),
    .led_red_intensity_in(8'd0),
    .led_green_intensity_in(8'd0),
    .led_blue_intensity_in(8'd0),
    .led_red_intensity_out(led_red_intensity_1),
    .led_green_intensity_out(led_green_intensity_1),
    .led_blue_intensity_out(led_blue_intensity_1)
  );

  DrawSnakeHead draw_snake_head (
    .end_game(queue_last_collide),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .led_red_intensity_in(led_red_intensity_1),
    .led_green_intensity_in(led_green_intensity_1),
    .led_blue_intensity_in(led_blue_intensity_1),
    .led_red_intensity_out(led_red_intensity_2),
    .led_green_intensity_out(led_green_intensity_2),
    .led_blue_intensity_out(led_blue_intensity_2)
  );

  DrawSnakeQueue draw_snake_queue_1 (
    .end_game(queue_last_collide),
    .score(score),
    .show_when_score_min(8'd1),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_1_x),
    .queue_y_pos(queue_1_y),
    .led_red_intensity_in(led_red_intensity_2),
    .led_green_intensity_in(led_green_intensity_2),
    .led_blue_intensity_in(led_blue_intensity_2),
    .led_red_intensity_out(led_red_intensity_3),
    .led_green_intensity_out(led_green_intensity_3),
    .led_blue_intensity_out(led_blue_intensity_3)
  );

  DrawSnakeQueue draw_snake_queue_2 (
    .end_game(queue_last_collide),
    .score(score),
    .show_when_score_min(8'd2),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_2_x),
    .queue_y_pos(queue_2_y),
    .led_red_intensity_in(led_red_intensity_3),
    .led_green_intensity_in(led_green_intensity_3),
    .led_blue_intensity_in(led_blue_intensity_3),
    .led_red_intensity_out(led_red_intensity_4),
    .led_green_intensity_out(led_green_intensity_4),
    .led_blue_intensity_out(led_blue_intensity_4)
  );

  DrawSnakeQueue draw_snake_queue_3 (
    .end_game(queue_last_collide),
    .score(score),
    .show_when_score_min(8'd3),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_3_x),
    .queue_y_pos(queue_3_y),
    .led_red_intensity_in(led_red_intensity_4),
    .led_green_intensity_in(led_green_intensity_4),
    .led_blue_intensity_in(led_blue_intensity_4),
    .led_red_intensity_out(led_red_intensity_5),
    .led_green_intensity_out(led_green_intensity_5),
    .led_blue_intensity_out(led_blue_intensity_5)
  );

  DrawEndGame draw_end_game (
    .end_game(queue_last_collide),
    .led_red_intensity_in(led_red_intensity_5),
    .led_green_intensity_in(led_green_intensity_5),
    .led_blue_intensity_in(led_blue_intensity_5),
    .led_red_intensity_out(led_red_intensity),
    .led_green_intensity_out(led_green_intensity),
    .led_blue_intensity_out(led_blue_intensity)
  );

endmodule


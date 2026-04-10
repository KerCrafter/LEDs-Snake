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
    output wire [7:0] led_red_intensity,
    output wire [7:0] led_green_intensity,
    output wire [7:0] led_blue_intensity,
    output wire [7:0] score
);

  wire [3:0] snake_head_x_pos;
  wire [3:0] snake_head_y_pos;

  wire [3:0] queue_1_x;
  wire [3:0] queue_1_y;
  wire [1:0] queue_1_direction;
  wire queue_1_collide;
  wire queue_1_active;

  wire [3:0] queue_2_x;
  wire [3:0] queue_2_y;
  wire [1:0] queue_2_direction;
  wire queue_2_collide;
  wire queue_2_active;

  wire [3:0] queue_3_x;
  wire [3:0] queue_3_y;
  wire [1:0] queue_3_direction;
  wire queue_3_collide;
  wire queue_3_active;

  wire [3:0] queue_4_x;
  wire [3:0] queue_4_y;
  wire [1:0] queue_4_direction;
  wire queue_4_collide;
  wire queue_4_active;

  wire [3:0] queue_5_x;
  wire [3:0] queue_5_y;
  wire [1:0] queue_5_direction;
  wire queue_5_collide;
  wire queue_5_active;

  wire [3:0] queue_6_x;
  wire [3:0] queue_6_y;
  wire [1:0] queue_6_direction;
  wire queue_6_collide;
  wire queue_6_active;

  wire [3:0] queue_7_x;
  wire [3:0] queue_7_y;
  wire [1:0] queue_7_direction;
  wire queue_7_collide;
  wire queue_7_active;

  wire [3:0] queue_8_x;
  wire [3:0] queue_8_y;
  wire [1:0] queue_8_direction;
  wire queue_8_collide;
  wire queue_8_active;

  wire [3:0] queue_9_x;
  wire [3:0] queue_9_y;
  wire [1:0] queue_9_direction;
  wire queue_9_collide;
  wire queue_9_active;

  wire [3:0] queue_10_x;
  wire [3:0] queue_10_y;
  wire [1:0] queue_10_direction;
  wire queue_10_collide;
  wire queue_10_active;

  wire [3:0] queue_11_x;
  wire [3:0] queue_11_y;
  wire [1:0] queue_11_direction;
  wire queue_11_collide;
  wire queue_11_active;

  wire [3:0] queue_12_x;
  wire [3:0] queue_12_y;
  wire [1:0] queue_12_direction;
  wire queue_12_collide;
  wire queue_12_active;

  wire [3:0] queue_13_x;
  wire [3:0] queue_13_y;
  wire [1:0] queue_13_direction;
  wire queue_13_collide;
  wire queue_13_active;

  wire [3:0] queue_14_x;
  wire [3:0] queue_14_y;
  wire [1:0] queue_14_direction;
  wire queue_14_collide;
  wire queue_14_active;

  wire [3:0] queue_15_x;
  wire [3:0] queue_15_y;
  wire [1:0] queue_15_direction;
  wire queue_15_collide;
  wire queue_15_active;

  wire [3:0] queue_16_x;
  wire [3:0] queue_16_y;
  wire [1:0] queue_16_direction;
  wire queue_16_collide;
  wire queue_16_active;

  wire [3:0] queue_17_x;
  wire [3:0] queue_17_y;
  wire [1:0] queue_17_direction;
  wire queue_17_collide;
  wire queue_17_active;

  wire [3:0] queue_18_x;
  wire [3:0] queue_18_y;
  wire [1:0] queue_18_direction;
  wire queue_18_collide;
  wire queue_18_active;

  wire [3:0] queue_19_x;
  wire [3:0] queue_19_y;
  wire [1:0] queue_19_direction;
  wire queue_19_collide;
  wire queue_19_active;

  wire [3:0] queue_20_x;
  wire [3:0] queue_20_y;
  wire [1:0] queue_20_direction;
  wire queue_last_collide;
  wire queue_20_active;

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

  wire [7:0] led_red_intensity_6;
  wire [7:0] led_green_intensity_6;
  wire [7:0] led_blue_intensity_6;

  wire [7:0] led_red_intensity_7;
  wire [7:0] led_green_intensity_7;
  wire [7:0] led_blue_intensity_7;

  wire [7:0] led_red_intensity_8;
  wire [7:0] led_green_intensity_8;
  wire [7:0] led_blue_intensity_8;

  wire [7:0] led_red_intensity_9;
  wire [7:0] led_green_intensity_9;
  wire [7:0] led_blue_intensity_9;

  wire [7:0] led_red_intensity_10;
  wire [7:0] led_green_intensity_10;
  wire [7:0] led_blue_intensity_10;

  wire [7:0] led_red_intensity_11;
  wire [7:0] led_green_intensity_11;
  wire [7:0] led_blue_intensity_11;

  wire [7:0] led_red_intensity_12;
  wire [7:0] led_green_intensity_12;
  wire [7:0] led_blue_intensity_12;

  wire [7:0] led_red_intensity_13;
  wire [7:0] led_green_intensity_13;
  wire [7:0] led_blue_intensity_13;

  wire [7:0] led_red_intensity_14;
  wire [7:0] led_green_intensity_14;
  wire [7:0] led_blue_intensity_14;

  wire [7:0] led_red_intensity_15;
  wire [7:0] led_green_intensity_15;
  wire [7:0] led_blue_intensity_15;

  wire [7:0] led_red_intensity_16;
  wire [7:0] led_green_intensity_16;
  wire [7:0] led_blue_intensity_16;

  wire [7:0] led_red_intensity_17;
  wire [7:0] led_green_intensity_17;
  wire [7:0] led_blue_intensity_17;

  wire [7:0] led_red_intensity_18;
  wire [7:0] led_green_intensity_18;
  wire [7:0] led_blue_intensity_18;

  wire [7:0] led_red_intensity_19;
  wire [7:0] led_green_intensity_19;
  wire [7:0] led_blue_intensity_19;

  wire [7:0] led_red_intensity_20;
  wire [7:0] led_green_intensity_20;
  wire [7:0] led_blue_intensity_20;

  wire [7:0] led_red_intensity_21;
  wire [7:0] led_green_intensity_21;
  wire [7:0] led_blue_intensity_21;

  wire [7:0] led_red_intensity_22;
  wire [7:0] led_green_intensity_22;
  wire [7:0] led_blue_intensity_22;

  reg move_act_prev;

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      move_act_prev <= 0;
    end else begin
      move_act_prev <= move_timer; 
    end
  end

  wire move_act_rise = move_timer & ~move_act_prev;

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
    .move_act(move_act_rise),
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
    .move_act(move_act_rise),
    .x_pos(snake_head_x_pos),
    .y_pos(snake_head_y_pos)
  );

  SnakeQueue queue_1 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(direction),
    .next_x_pos(snake_head_x_pos),
    .next_y_pos(snake_head_y_pos),
    .score(score),
    .active_when_score_min(8'd1),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(1'b0),
    .direction(queue_1_direction),
    .x_pos(queue_1_x),
    .y_pos(queue_1_y),
    .is_head_collide(queue_1_collide),
    .is_active(queue_1_active)
  );

  SnakeQueue queue_2 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_1_direction),
    .next_x_pos(queue_1_x),
    .next_y_pos(queue_1_y),
    .score(score),
    .active_when_score_min(8'd2),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_1_collide),
    .direction(queue_2_direction),
    .x_pos(queue_2_x),
    .y_pos(queue_2_y),
    .is_head_collide(queue_2_collide),
    .is_active(queue_2_active)
  );

  SnakeQueue queue_3 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_2_direction),
    .next_x_pos(queue_2_x),
    .next_y_pos(queue_2_y),
    .score(score),
    .active_when_score_min(8'd3),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_2_collide),
    .direction(queue_3_direction),
    .x_pos(queue_3_x),
    .y_pos(queue_3_y),
    .is_head_collide(queue_3_collide),
    .is_active(queue_3_active)
  );

  SnakeQueue queue_4 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_3_direction),
    .next_x_pos(queue_3_x),
    .next_y_pos(queue_3_y),
    .score(score),
    .active_when_score_min(8'd4),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_3_collide),
    .direction(queue_4_direction),
    .x_pos(queue_4_x),
    .y_pos(queue_4_y),
    .is_head_collide(queue_4_collide),
    .is_active(queue_4_active)
  );

  SnakeQueue queue_5 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_4_direction),
    .next_x_pos(queue_4_x),
    .next_y_pos(queue_4_y),
    .score(score),
    .active_when_score_min(8'd5),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_4_collide),
    .direction(queue_5_direction),
    .x_pos(queue_5_x),
    .y_pos(queue_5_y),
    .is_head_collide(queue_5_collide),
    .is_active(queue_5_active)
  );

  SnakeQueue queue_6 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_5_direction),
    .next_x_pos(queue_5_x),
    .next_y_pos(queue_5_y),
    .score(score),
    .active_when_score_min(8'd6),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_5_collide),
    .direction(queue_6_direction),
    .x_pos(queue_6_x),
    .y_pos(queue_6_y),
    .is_head_collide(queue_6_collide),
    .is_active(queue_6_active)
  );

  SnakeQueue queue_7 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_6_direction),
    .next_x_pos(queue_6_x),
    .next_y_pos(queue_6_y),
    .score(score),
    .active_when_score_min(8'd7),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_6_collide),
    .direction(queue_7_direction),
    .x_pos(queue_7_x),
    .y_pos(queue_7_y),
    .is_head_collide(queue_7_collide),
    .is_active(queue_7_active)
  );

  SnakeQueue queue_8 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_7_direction),
    .next_x_pos(queue_7_x),
    .next_y_pos(queue_7_y),
    .score(score),
    .active_when_score_min(8'd8),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_7_collide),
    .direction(queue_8_direction),
    .x_pos(queue_8_x),
    .y_pos(queue_8_y),
    .is_head_collide(queue_8_collide),
    .is_active(queue_8_active)
  );

  SnakeQueue queue_9 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_8_direction),
    .next_x_pos(queue_8_x),
    .next_y_pos(queue_8_y),
    .score(score),
    .active_when_score_min(8'd9),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_8_collide),
    .direction(queue_9_direction),
    .x_pos(queue_9_x),
    .y_pos(queue_9_y),
    .is_head_collide(queue_9_collide),
    .is_active(queue_9_active)
  );

  SnakeQueue queue_10 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_9_direction),
    .next_x_pos(queue_9_x),
    .next_y_pos(queue_9_y),
    .score(score),
    .active_when_score_min(8'd10),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_9_collide),
    .direction(queue_10_direction),
    .x_pos(queue_10_x),
    .y_pos(queue_10_y),
    .is_head_collide(queue_10_collide),
    .is_active(queue_10_active)
  );

  SnakeQueue queue_11 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_10_direction),
    .next_x_pos(queue_10_x),
    .next_y_pos(queue_10_y),
    .score(score),
    .active_when_score_min(8'd11),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_10_collide),
    .direction(queue_11_direction),
    .x_pos(queue_11_x),
    .y_pos(queue_11_y),
    .is_head_collide(queue_11_collide),
    .is_active(queue_11_active)
  );

  SnakeQueue queue_12 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_11_direction),
    .next_x_pos(queue_11_x),
    .next_y_pos(queue_11_y),
    .score(score),
    .active_when_score_min(8'd12),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_11_collide),
    .direction(queue_12_direction),
    .x_pos(queue_12_x),
    .y_pos(queue_12_y),
    .is_head_collide(queue_12_collide),
    .is_active(queue_12_active)
  );

  SnakeQueue queue_13 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_12_direction),
    .next_x_pos(queue_12_x),
    .next_y_pos(queue_12_y),
    .score(score),
    .active_when_score_min(8'd13),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_12_collide),
    .direction(queue_13_direction),
    .x_pos(queue_13_x),
    .y_pos(queue_13_y),
    .is_head_collide(queue_13_collide),
    .is_active(queue_13_active)
  );

  SnakeQueue queue_14 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_13_direction),
    .next_x_pos(queue_13_x),
    .next_y_pos(queue_13_y),
    .score(score),
    .active_when_score_min(8'd14),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_13_collide),
    .direction(queue_14_direction),
    .x_pos(queue_14_x),
    .y_pos(queue_14_y),
    .is_head_collide(queue_14_collide),
    .is_active(queue_14_active)
  );

  SnakeQueue queue_15 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_14_direction),
    .next_x_pos(queue_14_x),
    .next_y_pos(queue_14_y),
    .score(score),
    .active_when_score_min(8'd15),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_14_collide),
    .direction(queue_15_direction),
    .x_pos(queue_15_x),
    .y_pos(queue_15_y),
    .is_head_collide(queue_15_collide),
    .is_active(queue_15_active)
  );

  SnakeQueue queue_16 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_15_direction),
    .next_x_pos(queue_15_x),
    .next_y_pos(queue_15_y),
    .score(score),
    .active_when_score_min(8'd16),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_15_collide),
    .direction(queue_16_direction),
    .x_pos(queue_16_x),
    .y_pos(queue_16_y),
    .is_head_collide(queue_16_collide),
    .is_active(queue_16_active)
  );

  SnakeQueue queue_17 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_16_direction),
    .next_x_pos(queue_16_x),
    .next_y_pos(queue_16_y),
    .score(score),
    .active_when_score_min(8'd17),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_16_collide),
    .direction(queue_17_direction),
    .x_pos(queue_17_x),
    .y_pos(queue_17_y),
    .is_head_collide(queue_17_collide),
    .is_active(queue_17_active)
  );

  SnakeQueue queue_18 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_17_direction),
    .next_x_pos(queue_17_x),
    .next_y_pos(queue_17_y),
    .score(score),
    .active_when_score_min(8'd18),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_17_collide),
    .direction(queue_18_direction),
    .x_pos(queue_18_x),
    .y_pos(queue_18_y),
    .is_head_collide(queue_18_collide),
    .is_active(queue_18_active)
  );

  SnakeQueue queue_19 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_18_direction),
    .next_x_pos(queue_18_x),
    .next_y_pos(queue_18_y),
    .score(score),
    .active_when_score_min(8'd19),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_18_collide),
    .direction(queue_19_direction),
    .x_pos(queue_19_x),
    .y_pos(queue_19_y),
    .is_head_collide(queue_19_collide),
    .is_active(queue_19_active)
  );

  SnakeQueue queue_20 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_19_direction),
    .next_x_pos(queue_19_x),
    .next_y_pos(queue_19_y),
    .score(score),
    .active_when_score_min(8'd20),
    .head_direction(direction),
    .head_x_pos(snake_head_x_pos),
    .head_y_pos(snake_head_y_pos),
    .next_collide_head(queue_19_collide),
    .direction(queue_20_direction),
    .x_pos(queue_20_x),
    .y_pos(queue_20_y),
    .is_head_collide(queue_last_collide),
    .is_active(queue_20_active)
  );

  DrawBonus draw_bonus (
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
    .enable(queue_1_active),
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
    .enable(queue_2_active),
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
    .enable(queue_3_active),
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

  DrawSnakeQueue draw_snake_queue_4 (
    .enable(queue_4_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_4_x),
    .queue_y_pos(queue_4_y),
    .led_red_intensity_in(led_red_intensity_5),
    .led_green_intensity_in(led_green_intensity_5),
    .led_blue_intensity_in(led_blue_intensity_5),
    .led_red_intensity_out(led_red_intensity_6),
    .led_green_intensity_out(led_green_intensity_6),
    .led_blue_intensity_out(led_blue_intensity_6)
  );

  DrawSnakeQueue draw_snake_queue_5 (
    .enable(queue_5_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_5_x),
    .queue_y_pos(queue_5_y),
    .led_red_intensity_in(led_red_intensity_6),
    .led_green_intensity_in(led_green_intensity_6),
    .led_blue_intensity_in(led_blue_intensity_6),
    .led_red_intensity_out(led_red_intensity_7),
    .led_green_intensity_out(led_green_intensity_7),
    .led_blue_intensity_out(led_blue_intensity_7)
  );

  DrawSnakeQueue draw_snake_queue_6 (
    .enable(queue_6_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_6_x),
    .queue_y_pos(queue_6_y),
    .led_red_intensity_in(led_red_intensity_7),
    .led_green_intensity_in(led_green_intensity_7),
    .led_blue_intensity_in(led_blue_intensity_7),
    .led_red_intensity_out(led_red_intensity_8),
    .led_green_intensity_out(led_green_intensity_8),
    .led_blue_intensity_out(led_blue_intensity_8)
  );

  DrawSnakeQueue draw_snake_queue_7 (
    .enable(queue_7_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_7_x),
    .queue_y_pos(queue_7_y),
    .led_red_intensity_in(led_red_intensity_8),
    .led_green_intensity_in(led_green_intensity_8),
    .led_blue_intensity_in(led_blue_intensity_8),
    .led_red_intensity_out(led_red_intensity_9),
    .led_green_intensity_out(led_green_intensity_9),
    .led_blue_intensity_out(led_blue_intensity_9)
  );

  DrawSnakeQueue draw_snake_queue_8 (
    .enable(queue_8_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_8_x),
    .queue_y_pos(queue_8_y),
    .led_red_intensity_in(led_red_intensity_9),
    .led_green_intensity_in(led_green_intensity_9),
    .led_blue_intensity_in(led_blue_intensity_9),
    .led_red_intensity_out(led_red_intensity_10),
    .led_green_intensity_out(led_green_intensity_10),
    .led_blue_intensity_out(led_blue_intensity_10)
  );

  DrawSnakeQueue draw_snake_queue_9 (
    .enable(queue_9_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_9_x),
    .queue_y_pos(queue_9_y),
    .led_red_intensity_in(led_red_intensity_10),
    .led_green_intensity_in(led_green_intensity_10),
    .led_blue_intensity_in(led_blue_intensity_10),
    .led_red_intensity_out(led_red_intensity_11),
    .led_green_intensity_out(led_green_intensity_11),
    .led_blue_intensity_out(led_blue_intensity_11)
  );

  DrawSnakeQueue draw_snake_queue_10 (
    .enable(queue_10_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_10_x),
    .queue_y_pos(queue_10_y),
    .led_red_intensity_in(led_red_intensity_11),
    .led_green_intensity_in(led_green_intensity_11),
    .led_blue_intensity_in(led_blue_intensity_11),
    .led_red_intensity_out(led_red_intensity_12),
    .led_green_intensity_out(led_green_intensity_12),
    .led_blue_intensity_out(led_blue_intensity_12)
  );

  DrawSnakeQueue draw_snake_queue_11 (
    .enable(queue_11_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_11_x),
    .queue_y_pos(queue_11_y),
    .led_red_intensity_in(led_red_intensity_12),
    .led_green_intensity_in(led_green_intensity_12),
    .led_blue_intensity_in(led_blue_intensity_12),
    .led_red_intensity_out(led_red_intensity_13),
    .led_green_intensity_out(led_green_intensity_13),
    .led_blue_intensity_out(led_blue_intensity_13)
  );

  DrawSnakeQueue draw_snake_queue_12 (
    .enable(queue_12_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_12_x),
    .queue_y_pos(queue_12_y),
    .led_red_intensity_in(led_red_intensity_13),
    .led_green_intensity_in(led_green_intensity_13),
    .led_blue_intensity_in(led_blue_intensity_13),
    .led_red_intensity_out(led_red_intensity_14),
    .led_green_intensity_out(led_green_intensity_14),
    .led_blue_intensity_out(led_blue_intensity_14)
  );

  DrawSnakeQueue draw_snake_queue_13 (
    .enable(queue_13_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_13_x),
    .queue_y_pos(queue_13_y),
    .led_red_intensity_in(led_red_intensity_14),
    .led_green_intensity_in(led_green_intensity_14),
    .led_blue_intensity_in(led_blue_intensity_14),
    .led_red_intensity_out(led_red_intensity_15),
    .led_green_intensity_out(led_green_intensity_15),
    .led_blue_intensity_out(led_blue_intensity_15)
  );

  DrawSnakeQueue draw_snake_queue_14 (
    .enable(queue_14_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_14_x),
    .queue_y_pos(queue_14_y),
    .led_red_intensity_in(led_red_intensity_15),
    .led_green_intensity_in(led_green_intensity_15),
    .led_blue_intensity_in(led_blue_intensity_15),
    .led_red_intensity_out(led_red_intensity_16),
    .led_green_intensity_out(led_green_intensity_16),
    .led_blue_intensity_out(led_blue_intensity_16)
  );

  DrawSnakeQueue draw_snake_queue_15 (
    .enable(queue_15_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_15_x),
    .queue_y_pos(queue_15_y),
    .led_red_intensity_in(led_red_intensity_16),
    .led_green_intensity_in(led_green_intensity_16),
    .led_blue_intensity_in(led_blue_intensity_16),
    .led_red_intensity_out(led_red_intensity_17),
    .led_green_intensity_out(led_green_intensity_17),
    .led_blue_intensity_out(led_blue_intensity_17)
  );

  DrawSnakeQueue draw_snake_queue_16 (
    .enable(queue_16_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_16_x),
    .queue_y_pos(queue_16_y),
    .led_red_intensity_in(led_red_intensity_17),
    .led_green_intensity_in(led_green_intensity_17),
    .led_blue_intensity_in(led_blue_intensity_17),
    .led_red_intensity_out(led_red_intensity_18),
    .led_green_intensity_out(led_green_intensity_18),
    .led_blue_intensity_out(led_blue_intensity_18)
  );

  DrawSnakeQueue draw_snake_queue_17 (
    .enable(queue_17_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_17_x),
    .queue_y_pos(queue_17_y),
    .led_red_intensity_in(led_red_intensity_18),
    .led_green_intensity_in(led_green_intensity_18),
    .led_blue_intensity_in(led_blue_intensity_18),
    .led_red_intensity_out(led_red_intensity_19),
    .led_green_intensity_out(led_green_intensity_19),
    .led_blue_intensity_out(led_blue_intensity_19)
  );

  DrawSnakeQueue draw_snake_queue_18 (
    .enable(queue_18_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_18_x),
    .queue_y_pos(queue_18_y),
    .led_red_intensity_in(led_red_intensity_19),
    .led_green_intensity_in(led_green_intensity_19),
    .led_blue_intensity_in(led_blue_intensity_19),
    .led_red_intensity_out(led_red_intensity_20),
    .led_green_intensity_out(led_green_intensity_20),
    .led_blue_intensity_out(led_blue_intensity_20)
  );

  DrawSnakeQueue draw_snake_queue_19 (
    .enable(queue_19_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_19_x),
    .queue_y_pos(queue_19_y),
    .led_red_intensity_in(led_red_intensity_20),
    .led_green_intensity_in(led_green_intensity_20),
    .led_blue_intensity_in(led_blue_intensity_20),
    .led_red_intensity_out(led_red_intensity_21),
    .led_green_intensity_out(led_green_intensity_21),
    .led_blue_intensity_out(led_blue_intensity_21)
  );

  DrawSnakeQueue draw_snake_queue_20 (
    .enable(queue_20_active),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_20_x),
    .queue_y_pos(queue_20_y),
    .led_red_intensity_in(led_red_intensity_21),
    .led_green_intensity_in(led_green_intensity_21),
    .led_blue_intensity_in(led_blue_intensity_21),
    .led_red_intensity_out(led_red_intensity_22),
    .led_green_intensity_out(led_green_intensity_22),
    .led_blue_intensity_out(led_blue_intensity_22)
  );

  DrawEndGame draw_end_game (
    .collision_detected(queue_last_collide),
    .led_red_intensity_in(led_red_intensity_22),
    .led_green_intensity_in(led_green_intensity_22),
    .led_blue_intensity_in(led_blue_intensity_22),
    .led_red_intensity_out(led_red_intensity),
    .led_green_intensity_out(led_green_intensity),
    .led_blue_intensity_out(led_blue_intensity)
  );

endmodule


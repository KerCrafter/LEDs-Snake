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

  wire [3:0] head_x_pos;
  wire [3:0] head_y_pos;

  wire [3:0] queue_x [19:0];
  wire [3:0] queue_y [19:0];
  wire [1:0] queue_direction [19:0];
  wire queue_active [19:0];


  wire queue_1_collide;

  wire queue_2_collide;

  wire queue_3_collide;

  wire queue_4_collide;

  wire queue_5_collide;

  wire queue_6_collide;

  wire queue_7_collide;

  wire queue_8_collide;

  wire queue_9_collide;

  wire queue_10_collide;

  wire queue_11_collide;

  wire queue_12_collide;

  wire queue_13_collide;

  wire queue_14_collide;

  wire queue_15_collide;

  wire queue_16_collide;

  wire queue_17_collide;

  wire queue_18_collide;

  wire queue_19_collide;

  wire queue_last_collide;

  wire [1:0] head_direction;

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
    .direction(head_direction)
  );

  BonusManager bonus_manager (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .bonus_random_x(bonus_random_x),
    .bonus_random_y(bonus_random_y),
    .x_pos(current_bonus_x_pos),
    .y_pos(current_bonus_y_pos),
    .score(score)
  );

  SnakeHead snake_head (
    .clk(clk),
    .reset(reset),
    .direction(head_direction),
    .move_act(move_act_rise),
    .x_pos(head_x_pos),
    .y_pos(head_y_pos)
  );

  SnakeQueue queue_1 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(head_direction),
    .next_x_pos(head_x_pos),
    .next_y_pos(head_y_pos),
    .score(score),
    .active_when_score_min(8'd1),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(1'b0),
    .direction(queue_direction[0]),
    .x_pos(queue_x[0]),
    .y_pos(queue_y[0]),
    .is_head_collide(queue_1_collide),
    .is_active(queue_active[0])
  );

  SnakeQueue queue_2 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[0]),
    .next_x_pos(queue_x[0]),
    .next_y_pos(queue_y[0]),
    .score(score),
    .active_when_score_min(8'd2),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_1_collide),
    .direction(queue_direction[1]),
    .x_pos(queue_x[1]),
    .y_pos(queue_y[1]),
    .is_head_collide(queue_2_collide),
    .is_active(queue_active[1])
  );

  SnakeQueue queue_3 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[1]),
    .next_x_pos(queue_x[1]),
    .next_y_pos(queue_y[1]),
    .score(score),
    .active_when_score_min(8'd3),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_2_collide),
    .direction(queue_direction[2]),
    .x_pos(queue_x[2]),
    .y_pos(queue_y[2]),
    .is_head_collide(queue_3_collide),
    .is_active(queue_active[2])
  );

  SnakeQueue queue_4 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[2]),
    .next_x_pos(queue_x[2]),
    .next_y_pos(queue_y[2]),
    .score(score),
    .active_when_score_min(8'd4),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_3_collide),
    .direction(queue_direction[3]),
    .x_pos(queue_x[3]),
    .y_pos(queue_y[3]),
    .is_head_collide(queue_4_collide),
    .is_active(queue_active[3])
  );

  SnakeQueue queue_5 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[3]),
    .next_x_pos(queue_x[3]),
    .next_y_pos(queue_y[3]),
    .score(score),
    .active_when_score_min(8'd5),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_4_collide),
    .direction(queue_direction[4]),
    .x_pos(queue_x[4]),
    .y_pos(queue_y[4]),
    .is_head_collide(queue_5_collide),
    .is_active(queue_active[4])
  );

  SnakeQueue queue_6 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[4]),
    .next_x_pos(queue_x[4]),
    .next_y_pos(queue_y[4]),
    .score(score),
    .active_when_score_min(8'd6),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_5_collide),
    .direction(queue_direction[5]),
    .x_pos(queue_x[5]),
    .y_pos(queue_y[5]),
    .is_head_collide(queue_6_collide),
    .is_active(queue_active[5])
  );

  SnakeQueue queue_7 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[5]),
    .next_x_pos(queue_x[5]),
    .next_y_pos(queue_y[5]),
    .score(score),
    .active_when_score_min(8'd7),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_6_collide),
    .direction(queue_direction[6]),
    .x_pos(queue_x[6]),
    .y_pos(queue_y[6]),
    .is_head_collide(queue_7_collide),
    .is_active(queue_active[6])
  );

  SnakeQueue queue_8 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[6]),
    .next_x_pos(queue_x[6]),
    .next_y_pos(queue_y[6]),
    .score(score),
    .active_when_score_min(8'd8),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_7_collide),
    .direction(queue_direction[7]),
    .x_pos(queue_x[7]),
    .y_pos(queue_y[7]),
    .is_head_collide(queue_8_collide),
    .is_active(queue_active[7])
  );

  SnakeQueue queue_9 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[7]),
    .next_x_pos(queue_x[7]),
    .next_y_pos(queue_y[7]),
    .score(score),
    .active_when_score_min(8'd9),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_8_collide),
    .direction(queue_direction[8]),
    .x_pos(queue_x[8]),
    .y_pos(queue_y[8]),
    .is_head_collide(queue_9_collide),
    .is_active(queue_active[8])
  );

  SnakeQueue queue_10 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[8]),
    .next_x_pos(queue_x[8]),
    .next_y_pos(queue_y[8]),
    .score(score),
    .active_when_score_min(8'd10),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_9_collide),
    .direction(queue_direction[9]),
    .x_pos(queue_x[9]),
    .y_pos(queue_y[9]),
    .is_head_collide(queue_10_collide),
    .is_active(queue_active[9])
  );

  SnakeQueue queue_11 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[9]),
    .next_x_pos(queue_x[9]),
    .next_y_pos(queue_y[9]),
    .score(score),
    .active_when_score_min(8'd11),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_10_collide),
    .direction(queue_direction[10]),
    .x_pos(queue_x[10]),
    .y_pos(queue_y[10]),
    .is_head_collide(queue_11_collide),
    .is_active(queue_active[10])
  );

  SnakeQueue queue_12 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[10]),
    .next_x_pos(queue_x[10]),
    .next_y_pos(queue_y[10]),
    .score(score),
    .active_when_score_min(8'd12),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_11_collide),
    .direction(queue_direction[11]),
    .x_pos(queue_x[11]),
    .y_pos(queue_y[11]),
    .is_head_collide(queue_12_collide),
    .is_active(queue_active[11])
  );

  SnakeQueue queue_13 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[11]),
    .next_x_pos(queue_x[11]),
    .next_y_pos(queue_y[11]),
    .score(score),
    .active_when_score_min(8'd13),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_12_collide),
    .direction(queue_direction[12]),
    .x_pos(queue_x[12]),
    .y_pos(queue_y[12]),
    .is_head_collide(queue_13_collide),
    .is_active(queue_active[12])
  );

  SnakeQueue queue_14 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[12]),
    .next_x_pos(queue_x[12]),
    .next_y_pos(queue_y[12]),
    .score(score),
    .active_when_score_min(8'd14),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_13_collide),
    .direction(queue_direction[13]),
    .x_pos(queue_x[13]),
    .y_pos(queue_y[13]),
    .is_head_collide(queue_14_collide),
    .is_active(queue_active[13])
  );

  SnakeQueue queue_15 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[13]),
    .next_x_pos(queue_x[13]),
    .next_y_pos(queue_y[13]),
    .score(score),
    .active_when_score_min(8'd15),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_14_collide),
    .direction(queue_direction[14]),
    .x_pos(queue_x[14]),
    .y_pos(queue_y[14]),
    .is_head_collide(queue_15_collide),
    .is_active(queue_active[14])
  );

  SnakeQueue queue_16 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[14]),
    .next_x_pos(queue_x[14]),
    .next_y_pos(queue_y[14]),
    .score(score),
    .active_when_score_min(8'd16),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_15_collide),
    .direction(queue_direction[15]),
    .x_pos(queue_x[15]),
    .y_pos(queue_y[15]),
    .is_head_collide(queue_16_collide),
    .is_active(queue_active[15])
  );

  SnakeQueue queue_17 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[15]),
    .next_x_pos(queue_x[15]),
    .next_y_pos(queue_y[15]),
    .score(score),
    .active_when_score_min(8'd17),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_16_collide),
    .direction(queue_direction[16]),
    .x_pos(queue_x[16]),
    .y_pos(queue_y[16]),
    .is_head_collide(queue_17_collide),
    .is_active(queue_active[16])
  );

  SnakeQueue queue_18 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[16]),
    .next_x_pos(queue_x[16]),
    .next_y_pos(queue_y[16]),
    .score(score),
    .active_when_score_min(8'd18),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_17_collide),
    .direction(queue_direction[17]),
    .x_pos(queue_x[17]),
    .y_pos(queue_y[17]),
    .is_head_collide(queue_18_collide),
    .is_active(queue_active[17])
  );

  SnakeQueue queue_19 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[17]),
    .next_x_pos(queue_x[17]),
    .next_y_pos(queue_y[17]),
    .score(score),
    .active_when_score_min(8'd19),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_18_collide),
    .direction(queue_direction[18]),
    .x_pos(queue_x[18]),
    .y_pos(queue_y[18]),
    .is_head_collide(queue_19_collide),
    .is_active(queue_active[18])
  );

  SnakeQueue queue_20 (
    .clk(clk),
    .reset(reset),
    .move_act(move_act_rise),
    .next_direction(queue_direction[18]),
    .next_x_pos(queue_x[18]),
    .next_y_pos(queue_y[18]),
    .score(score),
    .active_when_score_min(8'd20),
    .head_direction(head_direction),
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .next_collide_head(queue_19_collide),
    .direction(queue_direction[19]),
    .x_pos(queue_x[19]),
    .y_pos(queue_y[19]),
    .is_head_collide(queue_last_collide),
    .is_active(queue_active[19])
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
    .head_x_pos(head_x_pos),
    .head_y_pos(head_y_pos),
    .led_red_intensity_in(led_red_intensity_1),
    .led_green_intensity_in(led_green_intensity_1),
    .led_blue_intensity_in(led_blue_intensity_1),
    .led_red_intensity_out(led_red_intensity_2),
    .led_green_intensity_out(led_green_intensity_2),
    .led_blue_intensity_out(led_blue_intensity_2)
  );

  DrawSnakeQueue draw_snake_queue_1 (
    .enable(queue_active[0]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[0]),
    .queue_y_pos(queue_y[0]),
    .led_red_intensity_in(led_red_intensity_2),
    .led_green_intensity_in(led_green_intensity_2),
    .led_blue_intensity_in(led_blue_intensity_2),
    .led_red_intensity_out(led_red_intensity_3),
    .led_green_intensity_out(led_green_intensity_3),
    .led_blue_intensity_out(led_blue_intensity_3)
  );

  DrawSnakeQueue draw_snake_queue_2 (
    .enable(queue_active[1]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[1]),
    .queue_y_pos(queue_y[1]),
    .led_red_intensity_in(led_red_intensity_3),
    .led_green_intensity_in(led_green_intensity_3),
    .led_blue_intensity_in(led_blue_intensity_3),
    .led_red_intensity_out(led_red_intensity_4),
    .led_green_intensity_out(led_green_intensity_4),
    .led_blue_intensity_out(led_blue_intensity_4)
  );

  DrawSnakeQueue draw_snake_queue_3 (
    .enable(queue_active[2]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[2]),
    .queue_y_pos(queue_y[2]),
    .led_red_intensity_in(led_red_intensity_4),
    .led_green_intensity_in(led_green_intensity_4),
    .led_blue_intensity_in(led_blue_intensity_4),
    .led_red_intensity_out(led_red_intensity_5),
    .led_green_intensity_out(led_green_intensity_5),
    .led_blue_intensity_out(led_blue_intensity_5)
  );

  DrawSnakeQueue draw_snake_queue_4 (
    .enable(queue_active[3]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[3]),
    .queue_y_pos(queue_y[3]),
    .led_red_intensity_in(led_red_intensity_5),
    .led_green_intensity_in(led_green_intensity_5),
    .led_blue_intensity_in(led_blue_intensity_5),
    .led_red_intensity_out(led_red_intensity_6),
    .led_green_intensity_out(led_green_intensity_6),
    .led_blue_intensity_out(led_blue_intensity_6)
  );

  DrawSnakeQueue draw_snake_queue_5 (
    .enable(queue_active[4]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[4]),
    .queue_y_pos(queue_y[4]),
    .led_red_intensity_in(led_red_intensity_6),
    .led_green_intensity_in(led_green_intensity_6),
    .led_blue_intensity_in(led_blue_intensity_6),
    .led_red_intensity_out(led_red_intensity_7),
    .led_green_intensity_out(led_green_intensity_7),
    .led_blue_intensity_out(led_blue_intensity_7)
  );

  DrawSnakeQueue draw_snake_queue_6 (
    .enable(queue_active[5]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[5]),
    .queue_y_pos(queue_y[5]),
    .led_red_intensity_in(led_red_intensity_7),
    .led_green_intensity_in(led_green_intensity_7),
    .led_blue_intensity_in(led_blue_intensity_7),
    .led_red_intensity_out(led_red_intensity_8),
    .led_green_intensity_out(led_green_intensity_8),
    .led_blue_intensity_out(led_blue_intensity_8)
  );

  DrawSnakeQueue draw_snake_queue_7 (
    .enable(queue_active[6]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[6]),
    .queue_y_pos(queue_y[6]),
    .led_red_intensity_in(led_red_intensity_8),
    .led_green_intensity_in(led_green_intensity_8),
    .led_blue_intensity_in(led_blue_intensity_8),
    .led_red_intensity_out(led_red_intensity_9),
    .led_green_intensity_out(led_green_intensity_9),
    .led_blue_intensity_out(led_blue_intensity_9)
  );

  DrawSnakeQueue draw_snake_queue_8 (
    .enable(queue_active[7]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[7]),
    .queue_y_pos(queue_y[7]),
    .led_red_intensity_in(led_red_intensity_9),
    .led_green_intensity_in(led_green_intensity_9),
    .led_blue_intensity_in(led_blue_intensity_9),
    .led_red_intensity_out(led_red_intensity_10),
    .led_green_intensity_out(led_green_intensity_10),
    .led_blue_intensity_out(led_blue_intensity_10)
  );

  DrawSnakeQueue draw_snake_queue_9 (
    .enable(queue_active[8]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[8]),
    .queue_y_pos(queue_y[8]),
    .led_red_intensity_in(led_red_intensity_10),
    .led_green_intensity_in(led_green_intensity_10),
    .led_blue_intensity_in(led_blue_intensity_10),
    .led_red_intensity_out(led_red_intensity_11),
    .led_green_intensity_out(led_green_intensity_11),
    .led_blue_intensity_out(led_blue_intensity_11)
  );

  DrawSnakeQueue draw_snake_queue_10 (
    .enable(queue_active[9]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[9]),
    .queue_y_pos(queue_y[9]),
    .led_red_intensity_in(led_red_intensity_11),
    .led_green_intensity_in(led_green_intensity_11),
    .led_blue_intensity_in(led_blue_intensity_11),
    .led_red_intensity_out(led_red_intensity_12),
    .led_green_intensity_out(led_green_intensity_12),
    .led_blue_intensity_out(led_blue_intensity_12)
  );

  DrawSnakeQueue draw_snake_queue_11 (
    .enable(queue_active[10]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[10]),
    .queue_y_pos(queue_y[10]),
    .led_red_intensity_in(led_red_intensity_12),
    .led_green_intensity_in(led_green_intensity_12),
    .led_blue_intensity_in(led_blue_intensity_12),
    .led_red_intensity_out(led_red_intensity_13),
    .led_green_intensity_out(led_green_intensity_13),
    .led_blue_intensity_out(led_blue_intensity_13)
  );

  DrawSnakeQueue draw_snake_queue_12 (
    .enable(queue_active[11]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[11]),
    .queue_y_pos(queue_y[11]),
    .led_red_intensity_in(led_red_intensity_13),
    .led_green_intensity_in(led_green_intensity_13),
    .led_blue_intensity_in(led_blue_intensity_13),
    .led_red_intensity_out(led_red_intensity_14),
    .led_green_intensity_out(led_green_intensity_14),
    .led_blue_intensity_out(led_blue_intensity_14)
  );

  DrawSnakeQueue draw_snake_queue_13 (
    .enable(queue_active[12]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[12]),
    .queue_y_pos(queue_y[12]),
    .led_red_intensity_in(led_red_intensity_14),
    .led_green_intensity_in(led_green_intensity_14),
    .led_blue_intensity_in(led_blue_intensity_14),
    .led_red_intensity_out(led_red_intensity_15),
    .led_green_intensity_out(led_green_intensity_15),
    .led_blue_intensity_out(led_blue_intensity_15)
  );

  DrawSnakeQueue draw_snake_queue_14 (
    .enable(queue_active[13]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[13]),
    .queue_y_pos(queue_y[13]),
    .led_red_intensity_in(led_red_intensity_15),
    .led_green_intensity_in(led_green_intensity_15),
    .led_blue_intensity_in(led_blue_intensity_15),
    .led_red_intensity_out(led_red_intensity_16),
    .led_green_intensity_out(led_green_intensity_16),
    .led_blue_intensity_out(led_blue_intensity_16)
  );

  DrawSnakeQueue draw_snake_queue_15 (
    .enable(queue_active[14]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[14]),
    .queue_y_pos(queue_y[14]),
    .led_red_intensity_in(led_red_intensity_16),
    .led_green_intensity_in(led_green_intensity_16),
    .led_blue_intensity_in(led_blue_intensity_16),
    .led_red_intensity_out(led_red_intensity_17),
    .led_green_intensity_out(led_green_intensity_17),
    .led_blue_intensity_out(led_blue_intensity_17)
  );

  DrawSnakeQueue draw_snake_queue_16 (
    .enable(queue_active[15]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[15]),
    .queue_y_pos(queue_y[15]),
    .led_red_intensity_in(led_red_intensity_17),
    .led_green_intensity_in(led_green_intensity_17),
    .led_blue_intensity_in(led_blue_intensity_17),
    .led_red_intensity_out(led_red_intensity_18),
    .led_green_intensity_out(led_green_intensity_18),
    .led_blue_intensity_out(led_blue_intensity_18)
  );

  DrawSnakeQueue draw_snake_queue_17 (
    .enable(queue_active[16]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[16]),
    .queue_y_pos(queue_y[16]),
    .led_red_intensity_in(led_red_intensity_18),
    .led_green_intensity_in(led_green_intensity_18),
    .led_blue_intensity_in(led_blue_intensity_18),
    .led_red_intensity_out(led_red_intensity_19),
    .led_green_intensity_out(led_green_intensity_19),
    .led_blue_intensity_out(led_blue_intensity_19)
  );

  DrawSnakeQueue draw_snake_queue_18 (
    .enable(queue_active[17]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[17]),
    .queue_y_pos(queue_y[17]),
    .led_red_intensity_in(led_red_intensity_19),
    .led_green_intensity_in(led_green_intensity_19),
    .led_blue_intensity_in(led_blue_intensity_19),
    .led_red_intensity_out(led_red_intensity_20),
    .led_green_intensity_out(led_green_intensity_20),
    .led_blue_intensity_out(led_blue_intensity_20)
  );

  DrawSnakeQueue draw_snake_queue_19 (
    .enable(queue_active[18]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[18]),
    .queue_y_pos(queue_y[18]),
    .led_red_intensity_in(led_red_intensity_20),
    .led_green_intensity_in(led_green_intensity_20),
    .led_blue_intensity_in(led_blue_intensity_20),
    .led_red_intensity_out(led_red_intensity_21),
    .led_green_intensity_out(led_green_intensity_21),
    .led_blue_intensity_out(led_blue_intensity_21)
  );

  DrawSnakeQueue draw_snake_queue_20 (
    .enable(queue_active[19]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[19]),
    .queue_y_pos(queue_y[19]),
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


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
  wire queue_collide [19:0];

  wire [1:0] head_direction;

  wire [3:0] current_bonus_x_pos;
  wire [3:0] current_bonus_y_pos;

  wire [7:0] led_red_intensity_1;
  wire [7:0] led_green_intensity_1;
  wire [7:0] led_blue_intensity_1;

  wire [7:0] led_red_intensity_queue [19:0];
  wire [7:0] led_green_intensity_queue [19:0];
  wire [7:0] led_blue_intensity_queue [19:0];

  wire [7:0] led_red_intensity_end;
  wire [7:0] led_green_intensity_end;
  wire [7:0] led_blue_intensity_end;

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

  genvar i;
  generate
    for(i = 0; i < 20 ; i = i + 1) begin : queues_gen
      if(i == 0) begin
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
          .is_head_collide(queue_collide[0]),
          .is_active(queue_active[0])
        );
      end else begin
        SnakeQueue queue (
          .clk(clk),
          .reset(reset),
          .move_act(move_act_rise),
          .next_direction(queue_direction[i-1]),
          .next_x_pos(queue_x[i-1]),
          .next_y_pos(queue_y[i-1]),
          .next_collide_head(queue_collide[i-1]),
          .score(score),
          .active_when_score_min(i+1),
          .head_direction(head_direction),
          .head_x_pos(head_x_pos),
          .head_y_pos(head_y_pos),
          .direction(queue_direction[i]),
          .x_pos(queue_x[i]),
          .y_pos(queue_y[i]),
          .is_head_collide(queue_collide[i]),
          .is_active(queue_active[i])
        );
      end
    end
  endgenerate

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
    .led_red_intensity_out(led_red_intensity_queue[0]),
    .led_green_intensity_out(led_green_intensity_queue[0]),
    .led_blue_intensity_out(led_blue_intensity_queue[0])
  );

  DrawSnakeQueue draw_snake_queue_1 (
    .enable(queue_active[0]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[0]),
    .queue_y_pos(queue_y[0]),
    .led_red_intensity_in(led_red_intensity_queue[0]),
    .led_green_intensity_in(led_green_intensity_queue[0]),
    .led_blue_intensity_in(led_blue_intensity_queue[0]),
    .led_red_intensity_out(led_red_intensity_queue[1]),
    .led_green_intensity_out(led_green_intensity_queue[1]),
    .led_blue_intensity_out(led_blue_intensity_queue[1])
  );

  DrawSnakeQueue draw_snake_queue_2 (
    .enable(queue_active[1]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[1]),
    .queue_y_pos(queue_y[1]),
    .led_red_intensity_in(led_red_intensity_queue[1]),
    .led_green_intensity_in(led_green_intensity_queue[1]),
    .led_blue_intensity_in(led_blue_intensity_queue[1]),
    .led_red_intensity_out(led_red_intensity_queue[2]),
    .led_green_intensity_out(led_green_intensity_queue[2]),
    .led_blue_intensity_out(led_blue_intensity_queue[2])
  );

  DrawSnakeQueue draw_snake_queue_3 (
    .enable(queue_active[2]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[2]),
    .queue_y_pos(queue_y[2]),
    .led_red_intensity_in(led_red_intensity_queue[2]),
    .led_green_intensity_in(led_green_intensity_queue[2]),
    .led_blue_intensity_in(led_blue_intensity_queue[2]),
    .led_red_intensity_out(led_red_intensity_queue[3]),
    .led_green_intensity_out(led_green_intensity_queue[3]),
    .led_blue_intensity_out(led_blue_intensity_queue[3])
  );

  DrawSnakeQueue draw_snake_queue_4 (
    .enable(queue_active[3]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[3]),
    .queue_y_pos(queue_y[3]),
    .led_red_intensity_in(led_red_intensity_queue[3]),
    .led_green_intensity_in(led_green_intensity_queue[3]),
    .led_blue_intensity_in(led_blue_intensity_queue[3]),
    .led_red_intensity_out(led_red_intensity_queue[4]),
    .led_green_intensity_out(led_green_intensity_queue[4]),
    .led_blue_intensity_out(led_blue_intensity_queue[4])
  );

  DrawSnakeQueue draw_snake_queue_5 (
    .enable(queue_active[4]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[4]),
    .queue_y_pos(queue_y[4]),
    .led_red_intensity_in(led_red_intensity_queue[4]),
    .led_green_intensity_in(led_green_intensity_queue[4]),
    .led_blue_intensity_in(led_blue_intensity_queue[4]),
    .led_red_intensity_out(led_red_intensity_queue[5]),
    .led_green_intensity_out(led_green_intensity_queue[5]),
    .led_blue_intensity_out(led_blue_intensity_queue[5])
  );

  DrawSnakeQueue draw_snake_queue_6 (
    .enable(queue_active[5]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[5]),
    .queue_y_pos(queue_y[5]),
    .led_red_intensity_in(led_red_intensity_queue[5]),
    .led_green_intensity_in(led_green_intensity_queue[5]),
    .led_blue_intensity_in(led_blue_intensity_queue[5]),
    .led_red_intensity_out(led_red_intensity_queue[6]),
    .led_green_intensity_out(led_green_intensity_queue[6]),
    .led_blue_intensity_out(led_blue_intensity_queue[6])
  );

  DrawSnakeQueue draw_snake_queue_7 (
    .enable(queue_active[6]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[6]),
    .queue_y_pos(queue_y[6]),
    .led_red_intensity_in(led_red_intensity_queue[6]),
    .led_green_intensity_in(led_green_intensity_queue[6]),
    .led_blue_intensity_in(led_blue_intensity_queue[6]),
    .led_red_intensity_out(led_red_intensity_queue[7]),
    .led_green_intensity_out(led_green_intensity_queue[7]),
    .led_blue_intensity_out(led_blue_intensity_queue[7])
  );

  DrawSnakeQueue draw_snake_queue_8 (
    .enable(queue_active[7]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[7]),
    .queue_y_pos(queue_y[7]),
    .led_red_intensity_in(led_red_intensity_queue[7]),
    .led_green_intensity_in(led_green_intensity_queue[7]),
    .led_blue_intensity_in(led_blue_intensity_queue[7]),
    .led_red_intensity_out(led_red_intensity_queue[8]),
    .led_green_intensity_out(led_green_intensity_queue[8]),
    .led_blue_intensity_out(led_blue_intensity_queue[8])
  );

  DrawSnakeQueue draw_snake_queue_9 (
    .enable(queue_active[8]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[8]),
    .queue_y_pos(queue_y[8]),
    .led_red_intensity_in(led_red_intensity_queue[8]),
    .led_green_intensity_in(led_green_intensity_queue[8]),
    .led_blue_intensity_in(led_blue_intensity_queue[8]),
    .led_red_intensity_out(led_red_intensity_queue[9]),
    .led_green_intensity_out(led_green_intensity_queue[9]),
    .led_blue_intensity_out(led_blue_intensity_queue[9])
  );

  DrawSnakeQueue draw_snake_queue_10 (
    .enable(queue_active[9]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[9]),
    .queue_y_pos(queue_y[9]),
    .led_red_intensity_in(led_red_intensity_queue[9]),
    .led_green_intensity_in(led_green_intensity_queue[9]),
    .led_blue_intensity_in(led_blue_intensity_queue[9]),
    .led_red_intensity_out(led_red_intensity_queue[10]),
    .led_green_intensity_out(led_green_intensity_queue[10]),
    .led_blue_intensity_out(led_blue_intensity_queue[10])
  );

  DrawSnakeQueue draw_snake_queue_11 (
    .enable(queue_active[10]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[10]),
    .queue_y_pos(queue_y[10]),
    .led_red_intensity_in(led_red_intensity_queue[10]),
    .led_green_intensity_in(led_green_intensity_queue[10]),
    .led_blue_intensity_in(led_blue_intensity_queue[10]),
    .led_red_intensity_out(led_red_intensity_queue[11]),
    .led_green_intensity_out(led_green_intensity_queue[11]),
    .led_blue_intensity_out(led_blue_intensity_queue[11])
  );

  DrawSnakeQueue draw_snake_queue_12 (
    .enable(queue_active[11]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[11]),
    .queue_y_pos(queue_y[11]),
    .led_red_intensity_in(led_red_intensity_queue[11]),
    .led_green_intensity_in(led_green_intensity_queue[11]),
    .led_blue_intensity_in(led_blue_intensity_queue[11]),
    .led_red_intensity_out(led_red_intensity_queue[12]),
    .led_green_intensity_out(led_green_intensity_queue[12]),
    .led_blue_intensity_out(led_blue_intensity_queue[12])
  );

  DrawSnakeQueue draw_snake_queue_13 (
    .enable(queue_active[12]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[12]),
    .queue_y_pos(queue_y[12]),
    .led_red_intensity_in(led_red_intensity_queue[12]),
    .led_green_intensity_in(led_green_intensity_queue[12]),
    .led_blue_intensity_in(led_blue_intensity_queue[12]),
    .led_red_intensity_out(led_red_intensity_queue[13]),
    .led_green_intensity_out(led_green_intensity_queue[13]),
    .led_blue_intensity_out(led_blue_intensity_queue[13])
  );

  DrawSnakeQueue draw_snake_queue_14 (
    .enable(queue_active[13]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[13]),
    .queue_y_pos(queue_y[13]),
    .led_red_intensity_in(led_red_intensity_queue[13]),
    .led_green_intensity_in(led_green_intensity_queue[13]),
    .led_blue_intensity_in(led_blue_intensity_queue[13]),
    .led_red_intensity_out(led_red_intensity_queue[14]),
    .led_green_intensity_out(led_green_intensity_queue[14]),
    .led_blue_intensity_out(led_blue_intensity_queue[14])
  );

  DrawSnakeQueue draw_snake_queue_15 (
    .enable(queue_active[14]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[14]),
    .queue_y_pos(queue_y[14]),
    .led_red_intensity_in(led_red_intensity_queue[14]),
    .led_green_intensity_in(led_green_intensity_queue[14]),
    .led_blue_intensity_in(led_blue_intensity_queue[14]),
    .led_red_intensity_out(led_red_intensity_queue[15]),
    .led_green_intensity_out(led_green_intensity_queue[15]),
    .led_blue_intensity_out(led_blue_intensity_queue[15])
  );

  DrawSnakeQueue draw_snake_queue_16 (
    .enable(queue_active[15]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[15]),
    .queue_y_pos(queue_y[15]),
    .led_red_intensity_in(led_red_intensity_queue[15]),
    .led_green_intensity_in(led_green_intensity_queue[15]),
    .led_blue_intensity_in(led_blue_intensity_queue[15]),
    .led_red_intensity_out(led_red_intensity_queue[16]),
    .led_green_intensity_out(led_green_intensity_queue[16]),
    .led_blue_intensity_out(led_blue_intensity_queue[16])
  );

  DrawSnakeQueue draw_snake_queue_17 (
    .enable(queue_active[16]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[16]),
    .queue_y_pos(queue_y[16]),
    .led_red_intensity_in(led_red_intensity_queue[16]),
    .led_green_intensity_in(led_green_intensity_queue[16]),
    .led_blue_intensity_in(led_blue_intensity_queue[16]),
    .led_red_intensity_out(led_red_intensity_queue[17]),
    .led_green_intensity_out(led_green_intensity_queue[17]),
    .led_blue_intensity_out(led_blue_intensity_queue[17])
  );

  DrawSnakeQueue draw_snake_queue_18 (
    .enable(queue_active[17]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[17]),
    .queue_y_pos(queue_y[17]),
    .led_red_intensity_in(led_red_intensity_queue[17]),
    .led_green_intensity_in(led_green_intensity_queue[17]),
    .led_blue_intensity_in(led_blue_intensity_queue[17]),
    .led_red_intensity_out(led_red_intensity_queue[18]),
    .led_green_intensity_out(led_green_intensity_queue[18]),
    .led_blue_intensity_out(led_blue_intensity_queue[18])
  );

  DrawSnakeQueue draw_snake_queue_19 (
    .enable(queue_active[18]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[18]),
    .queue_y_pos(queue_y[18]),
    .led_red_intensity_in(led_red_intensity_queue[18]),
    .led_green_intensity_in(led_green_intensity_queue[18]),
    .led_blue_intensity_in(led_blue_intensity_queue[18]),
    .led_red_intensity_out(led_red_intensity_queue[19]),
    .led_green_intensity_out(led_green_intensity_queue[19]),
    .led_blue_intensity_out(led_blue_intensity_queue[19])
  );

  DrawSnakeQueue draw_snake_queue_20 (
    .enable(queue_active[19]),
    .current_led_x(current_led_x),
    .current_led_y(current_led_y),
    .queue_x_pos(queue_x[19]),
    .queue_y_pos(queue_y[19]),
    .led_red_intensity_in(led_red_intensity_queue[19]),
    .led_green_intensity_in(led_green_intensity_queue[19]),
    .led_blue_intensity_in(led_blue_intensity_queue[19]),
    .led_red_intensity_out(led_red_intensity_end),
    .led_green_intensity_out(led_green_intensity_end),
    .led_blue_intensity_out(led_blue_intensity_end)
  );

  DrawEndGame draw_end_game (
    .collision_detected(queue_collide[19]),
    .led_red_intensity_in(led_red_intensity_end),
    .led_green_intensity_in(led_green_intensity_end),
    .led_blue_intensity_in(led_blue_intensity_end),
    .led_red_intensity_out(led_red_intensity),
    .led_green_intensity_out(led_green_intensity),
    .led_blue_intensity_out(led_blue_intensity)
  );

endmodule


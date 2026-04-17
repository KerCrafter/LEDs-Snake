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

  localparam SNAKE_MAX_SIZE = 50;

  wire [3:0] head_x_pos;
  wire [3:0] head_y_pos;

  wire [3:0] queue_x [SNAKE_MAX_SIZE-1:0];
  wire [3:0] queue_y [SNAKE_MAX_SIZE-1:0];
  wire [1:0] queue_direction [SNAKE_MAX_SIZE-1:0];
  wire queue_active [SNAKE_MAX_SIZE-1:0];
  wire queue_collide [SNAKE_MAX_SIZE-1:0];

  wire collide_detected = queue_collide[SNAKE_MAX_SIZE-1];
  wire _collide_detected;
  wire [5:0] queue_current_scan;

  reg [3:0] scan_queue_x;
  reg [3:0] scan_queue_y;

  wire [1:0] head_direction;

  wire [3:0] current_bonus_x_pos;
  wire [3:0] current_bonus_y_pos;

  wire [7:0] led_red_intensity_1;
  wire [7:0] led_green_intensity_1;
  wire [7:0] led_blue_intensity_1;

  wire [7:0] led_red_intensity_2;
  wire [7:0] led_green_intensity_2;
  wire [7:0] led_blue_intensity_2;

  wire [7:0] led_red_intensity_queue [SNAKE_MAX_SIZE-1:0];
  wire [7:0] led_green_intensity_queue [SNAKE_MAX_SIZE-1:0];
  wire [7:0] led_blue_intensity_queue [SNAKE_MAX_SIZE-1:0];

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
    .scan_queue_x(scan_queue_x),
    .scan_queue_y(scan_queue_y),
    .x_pos(head_x_pos),
    .y_pos(head_y_pos),
    .queue_current_scan(queue_current_scan),
    .collide_detected(_collide_detected)
  );

  genvar i;
  generate
    for(i = 0; i <= SNAKE_MAX_SIZE-1; i = i + 1) begin : queues_gen
      localparam [7:0] ID_QUEUE = i[7:0] + 8'd1;

      if(i == 0) begin
        SnakeQueue queue_1 (
          .clk(clk),
          .reset(reset),
          .move_act(move_act_rise),
          .next_direction(head_direction),
          .next_x_pos(head_x_pos),
          .next_y_pos(head_y_pos),
          .score(score),
          .active_when_score_min(ID_QUEUE),
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

        DrawSnakeQueue draw_snake_queue_1 (
          .enable(queue_active[i]),
          .current_led_x(current_led_x),
          .current_led_y(current_led_y),
          .queue_x_pos(queue_x[i]),
          .queue_y_pos(queue_y[i]),
          .led_red_intensity_in(led_red_intensity_2),
          .led_green_intensity_in(led_green_intensity_2),
          .led_blue_intensity_in(led_blue_intensity_2),
          .led_red_intensity_out(led_red_intensity_queue[i]),
          .led_green_intensity_out(led_green_intensity_queue[i]),
          .led_blue_intensity_out(led_blue_intensity_queue[i])
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
          .active_when_score_min(ID_QUEUE),
          .head_direction(head_direction),
          .head_x_pos(head_x_pos),
          .head_y_pos(head_y_pos),
          .direction(queue_direction[i]),
          .x_pos(queue_x[i]),
          .y_pos(queue_y[i]),
          .is_head_collide(queue_collide[i]),
          .is_active(queue_active[i])
        );

        DrawSnakeQueue draw_snake_queue (
          .enable(queue_active[i]),
          .current_led_x(current_led_x),
          .current_led_y(current_led_y),
          .queue_x_pos(queue_x[i]),
          .queue_y_pos(queue_y[i]),
          .led_red_intensity_in(led_red_intensity_queue[i-1]),
          .led_green_intensity_in(led_green_intensity_queue[i-1]),
          .led_blue_intensity_in(led_blue_intensity_queue[i-1]),
          .led_red_intensity_out(led_red_intensity_queue[i]),
          .led_green_intensity_out(led_green_intensity_queue[i]),
          .led_blue_intensity_out(led_blue_intensity_queue[i])
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
    .led_red_intensity_out(led_red_intensity_2),
    .led_green_intensity_out(led_green_intensity_2),
    .led_blue_intensity_out(led_blue_intensity_2)
  );

  DrawEndGame draw_end_game (
    .collision_detected(collide_detected),
    .led_red_intensity_in(led_red_intensity_queue[SNAKE_MAX_SIZE-1]),
    .led_green_intensity_in(led_green_intensity_queue[SNAKE_MAX_SIZE-1]),
    .led_blue_intensity_in(led_blue_intensity_queue[SNAKE_MAX_SIZE-1]),
    .led_red_intensity_out(led_red_intensity),
    .led_green_intensity_out(led_green_intensity),
    .led_blue_intensity_out(led_blue_intensity)
  );

endmodule


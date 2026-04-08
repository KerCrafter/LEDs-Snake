module BonusManager (
  input wire move_act,
  input wire clk,
  input wire reset,
  input wire [1:0] direction,
  input wire [3:0] snake_head_x_pos,
  input wire [3:0] snake_head_y_pos,
  input wire [3:0] bonus_random_x,
  input wire [3:0] bonus_random_y,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos,
  output reg [7:0] score
);

  reg move_act_prev;

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      move_act_prev <= 0;
    end else begin
      move_act_prev <= move_act;
    end

  end

  wire move_act_rise = move_act & ~move_act_prev; 

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      score <= 0;
      x_pos <= bonus_random_x;
      y_pos <= bonus_random_y;
    end else if(move_act_rise) begin
      if(
        (direction == 0 && snake_head_x_pos + 1 == x_pos && snake_head_y_pos == y_pos) ||
        (direction == 1 && snake_head_x_pos - 1 == x_pos) ||
        (direction == 2 && snake_head_y_pos + 1 == y_pos) ||
        (direction == 3 && snake_head_y_pos - 1 == y_pos)
      ) begin
        score <= score + 8'd1;

        x_pos <= bonus_random_x;
        y_pos <= bonus_random_y;
      end
    end
  end
endmodule

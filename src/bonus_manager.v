module BonusManager (
  input wire move_act,
  input wire clk,
  input wire reset,
  input wire [1:0] head_direction,
  input wire [3:0] snake_head_x_pos,
  input wire [3:0] snake_head_y_pos,
  input wire [3:0] bonus_random_x,
  input wire [3:0] bonus_random_y,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos,
  output reg [7:0] score
);
  always @(posedge clk) begin
    if(reset) begin
      score <= 0;
      x_pos <= bonus_random_x;
      y_pos <= bonus_random_y;
    end else if(move_act && (
      (head_direction == 0 && snake_head_x_pos + 1 == x_pos && snake_head_y_pos == y_pos) ||
      (head_direction == 1 && snake_head_x_pos - 1 == x_pos && snake_head_y_pos == y_pos) ||
      (head_direction == 2 && snake_head_y_pos + 1 == y_pos && snake_head_x_pos == x_pos) ||
      (head_direction == 3 && snake_head_y_pos - 1 == y_pos && snake_head_x_pos == x_pos)
    )) begin
      score <= score + 8'd1;

      x_pos <= bonus_random_x;
      y_pos <= bonus_random_y;
    end
  end
endmodule

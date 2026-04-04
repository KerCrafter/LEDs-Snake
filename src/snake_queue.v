module SnakeQueue (
  input wire reset,
  input wire clk,
  input wire move_act,
  input wire [3:0] next_x_pos,
  input wire [3:0] next_y_pos,
  input wire [7:0] score,
  input wire [1:0] direction,
  input wire [3:0] head_x_pos,
  input wire [3:0] head_y_pos,
  input wire next_collide_head,
  input wire [7:0] active_when_score_min,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos,
  output reg is_head_collide,
  output reg is_active
);

  always @(posedge move_act) begin
    x_pos <= next_x_pos;
    y_pos <= next_y_pos;

    if(
      next_collide_head || (
        is_active && (
          (direction == 0 && head_x_pos + 1 == x_pos && head_y_pos == y_pos) || 
          (direction == 1 && head_x_pos - 1 == x_pos && head_y_pos == y_pos) ||
          (direction == 2 && head_y_pos + 1 == y_pos && head_x_pos == x_pos) ||
          (direction == 3 && head_y_pos - 1 == y_pos && head_x_pos == x_pos) 
        )
      )
    ) begin
      is_head_collide <= 1; 
    end
  end

  always @(clk) begin
    if(reset) begin
      is_head_collide <= 0;
      is_active <= 0;
      x_pos <= 0;
      y_pos <= 0;
    end else begin
      is_active <= score >= active_when_score_min;
    end
  end

endmodule

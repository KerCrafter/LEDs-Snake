module SnakeQueue (
  input wire reset,
  input wire clk,
  input wire move_act,
  input wire [3:0] next_x_pos,
  input wire [3:0] next_y_pos,
  input wire [1:0] next_direction,
  input wire [7:0] score,
  input wire [1:0] head_direction,
  input wire [3:0] head_x_pos,
  input wire [3:0] head_y_pos,
  input wire next_collide_head,
  input wire [7:0] active_when_score_min,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos,
  output reg [1:0] direction,
  output wire is_head_collide,
  output wire is_active
);

  reg is_collide_with_head;

  assign is_head_collide = is_collide_with_head || next_collide_head; 
  assign is_active = score >= active_when_score_min;

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      is_collide_with_head <= 0;
      direction <= 0;

    end else if(move_act) begin
      direction <= next_direction;

      if(is_active && (
            (head_direction == 0 && head_x_pos + 1 == x_pos && head_y_pos == y_pos) || 
            (head_direction == 1 && head_x_pos - 1 == x_pos && head_y_pos == y_pos) ||
            (head_direction == 2 && head_y_pos + 1 == y_pos && head_x_pos == x_pos) ||
            (head_direction == 3 && head_y_pos - 1 == y_pos && head_x_pos == x_pos) 
        )
      ) begin
        is_collide_with_head <= 1;
      end
    end

  end

  always @(*) begin
    if(direction == 0) begin
      x_pos <= next_x_pos - 4'd1;
      y_pos <= next_y_pos;
    end else if(direction == 1) begin
      x_pos <= next_x_pos + 4'd1;
      y_pos <= next_y_pos;
    end else if(direction == 2) begin
      x_pos <= next_x_pos;
      y_pos <= next_y_pos - 4'd1;
    end else if(direction == 3) begin
      x_pos <= next_x_pos;
      y_pos <= next_y_pos + 4'd1;
    end else begin
      x_pos <= 0;
      y_pos <= 0;
    end
  end


endmodule

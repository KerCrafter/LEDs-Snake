module SnakeQueue (
  input wire reset,
  input wire clk,
  input wire move_act,
  input wire [3:0] next_x_pos,
  input wire [3:0] next_y_pos,
  input wire [1:0] next_direction,
  input wire [7:0] score,
  input wire [1:0] head_direction,
  input wire [7:0] active_when_score_min,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos,
  output reg [1:0] direction,
  output wire is_active
);

  assign is_active = score >= active_when_score_min;

  always @(posedge clk) begin
    if(reset) begin
      direction <= 0;
    end else if(move_act) begin
      direction <= next_direction;
    end
  end

  always @(*) begin
    if(direction == 2'd0) begin
      x_pos <= next_x_pos - 4'd1;
      y_pos <= next_y_pos;
    end else if(direction == 2'd1) begin
      x_pos <= next_x_pos + 4'd1;
      y_pos <= next_y_pos;
    end else if(direction == 2'd2) begin
      x_pos <= next_x_pos;
      y_pos <= next_y_pos - 4'd1;
    end else if(direction == 2'd3) begin
      x_pos <= next_x_pos;
      y_pos <= next_y_pos + 4'd1;
    end else begin
      x_pos <= 0;
      y_pos <= 0;
    end
  end


endmodule

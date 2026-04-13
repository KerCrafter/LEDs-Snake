module SnakeHead (
  input wire reset,
  input wire clk,
  input wire [1:0] direction,
  input wire move_act,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos
);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      x_pos <= 7;
      y_pos <= 7;
    end else if(move_act) begin
      if(direction == 2'd0) begin
        x_pos <= x_pos + 4'd1;
      end else if(direction == 2'd1) begin
        x_pos <= x_pos - 4'd1;
      end else if(direction == 2'd2) begin
        y_pos <= y_pos + 4'd1;
      end else if(direction == 2'd3) begin
        y_pos <= y_pos - 4'd1;
      end
    end
  end

endmodule

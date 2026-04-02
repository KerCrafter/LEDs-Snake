module SnakeHead (
  input wire reset,
  input wire clk,
  input wire [1:0] direction,
  input wire move_act,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos
);

  always @(posedge move_act) begin

    if(direction == 0) begin
      x_pos <= x_pos + 1;
    end else if(direction == 1) begin
      x_pos <= x_pos - 1;
    end else if(direction == 2) begin
      y_pos <= y_pos + 1;
    end else if(direction == 3) begin
      y_pos <= y_pos - 1;
    end

  end

  always @(clk) begin
    if(reset) begin
      x_pos <= 7;
      y_pos <= 7;
    end
  end

endmodule

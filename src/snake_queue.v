module SnakeQueue (
  input wire reset,
  input wire clk,
  input wire move_act,
  input wire [3:0] next_x_pos,
  input wire [3:0] next_y_pos,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos
);

  always @(posedge move_act) begin
    x_pos <= next_x_pos;
    y_pos <= next_y_pos;
  end

  always @(clk) begin
    if(reset) begin
      x_pos <= 0;
      y_pos <= 0;
    end
  end

endmodule

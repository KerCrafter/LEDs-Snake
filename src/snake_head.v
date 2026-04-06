module SnakeHead (
  input wire reset,
  input wire clk,
  input wire [1:0] direction,
  input wire move_act,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos
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
      x_pos <= 7;
      y_pos <= 7;
    end else if(move_act_rise) begin
      if(direction == 0) begin
        x_pos <= x_pos + 4'd1;
      end else if(direction == 1) begin
        x_pos <= x_pos - 4'd1;
      end else if(direction == 2) begin
        y_pos <= y_pos + 4'd1;
      end else if(direction == 3) begin
        y_pos <= y_pos - 4'd1;
      end
    end
  end

endmodule

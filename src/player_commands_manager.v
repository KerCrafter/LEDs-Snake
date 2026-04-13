module PlayerCommandsManager (
  input wire clk,
  input wire reset,
  input wire left,
  input wire right,
  input wire up,
  input wire down,
  input wire [7:0] score,
  output reg [1:0] direction
);

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      direction <= 0;
    end else begin
      if(right && (direction != 2'b1 || score == 8'd0)) begin
        direction <= 0;
      end

      if(left && (direction != 2'd0 || score == 8'd0)) begin
        direction <= 1;
      end

      if(down && (direction != 2'd3 || score == 8'd0)) begin
        direction <= 2;
      end

      if(up && (direction != 2'd2 || score == 8'd0)) begin
        direction <= 3;
      end

    end
  end

endmodule

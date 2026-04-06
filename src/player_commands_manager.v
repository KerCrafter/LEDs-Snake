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
      if(right && (direction != 1 || score == 0)) begin
        direction <= 0;
      end

      if(left && (direction != 0 || score == 0)) begin
        direction <= 1;
      end

      if(down && (direction != 3 || score == 0)) begin
        direction <= 2;
      end

      if(up && (direction != 2 || score == 0)) begin
        direction <= 3;
      end
    end
  end

endmodule

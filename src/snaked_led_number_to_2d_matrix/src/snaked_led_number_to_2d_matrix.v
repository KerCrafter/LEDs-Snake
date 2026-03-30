`default_nettype none

module snaked_led_number_to_2d_matrix (
  input wire [7:0] n,
  output reg [3:0] x,
  output reg [3:0] y
);

  reg [4:0] yy;

  always @(*) begin

    yy = n / 16;
    y <= yy;

    if(yy == 1 || yy == 3) begin
      x <= n - 16;
    end

    if(yy == 0 || yy == 2) begin
      x <= (yy * 16) + 15 - n;
    end
  end

endmodule

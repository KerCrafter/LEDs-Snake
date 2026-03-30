`default_nettype none

module snaked_led_number_to_2d_matrix (
  input wire [7:0] n,
  output reg [3:0] x,
  output reg [3:0] y
);

  reg [4:0] yy;
  reg is_pair;

  always @(*) begin
    yy = n / 16;
    is_pair = yy == 0 || yy == 2 || yy == 4;
    y <= yy;

    if(is_pair) begin
      x <= 15 - n;
    end else begin
      x <= n - 16;
    end
  end

endmodule

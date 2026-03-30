`default_nettype none

module snaked_led_number_to_2d_matrix (
  input wire [7:0] n,
  output reg [3:0] x,
  output reg [3:0] y
);

  reg [3:0] line_num;
  reg is_pair;

  always @(*) begin
    line_num = n / 16;
    is_pair = line_num == 0 || line_num == 2 || line_num == 4;

    if(is_pair) begin
      x <= 15 - n;
    end else begin
      x <= n - 16;
    end

    y <= line_num;

  end

endmodule

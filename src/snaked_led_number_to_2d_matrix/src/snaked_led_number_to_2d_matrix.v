`default_nettype none

module snaked_led_number_to_2d_matrix (
  input wire [7:0] n,
  output reg [3:0] x,
  output reg [3:0] y
);

  reg [3:0] line_num;
  reg not_pair;

  always @(*) begin
    line_num = n / 16;
    not_pair = line_num;

    if(not_pair) begin
      x <= n - 16;
    end else begin
      x <= 15 - n;
    end

    y <= line_num;
  end

endmodule

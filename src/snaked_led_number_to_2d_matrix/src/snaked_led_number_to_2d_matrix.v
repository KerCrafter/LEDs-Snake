`default_nettype none

module snaked_led_number_to_2d_matrix (
  input wire [7:0] n,
  output reg [3:0] x,
  output reg [3:0] y
);

  always @(*) begin
    if(n >= 0 && n <= 15) begin
      x <= 15 - n;
      y <= 0;
    end
  end

endmodule

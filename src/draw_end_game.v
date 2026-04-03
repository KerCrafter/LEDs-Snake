module DrawEndGame (
  input wire end_game,
  input wire [7:0] led_red_intensity_in,
  input wire [7:0] led_blue_intensity_in,
  input wire [7:0] led_green_intensity_in,
  output reg [7:0] led_red_intensity_out,
  output reg [7:0] led_blue_intensity_out,
  output reg [7:0] led_green_intensity_out
);

  always @(*) begin
    if(end_game) begin
      led_red_intensity_out <= 10;
      led_green_intensity_out <= 0;
      led_blue_intensity_out <= 0;
    end else begin
      led_red_intensity_out <= led_red_intensity_in;
      led_green_intensity_out <= led_green_intensity_in;
      led_blue_intensity_out <= led_blue_intensity_in;
    end
  end

endmodule

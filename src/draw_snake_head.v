module DrawSnakeHead (
  input wire [3:0] current_led_x,
  input wire [3:0] current_led_y,
  input wire [3:0] head_x_pos,
  input wire [3:0] head_y_pos,
  input wire [7:0] led_red_intensity_in,
  input wire [7:0] led_blue_intensity_in,
  input wire [7:0] led_green_intensity_in,
  output reg [7:0] led_red_intensity_out,
  output reg [7:0] led_blue_intensity_out,
  output reg [7:0] led_green_intensity_out
);

  always @(*) begin
    if(current_led_x == head_x_pos && current_led_y == head_y_pos) begin
      led_red_intensity_out <= 0;
      led_green_intensity_out <= 10;
      led_blue_intensity_out <= 0;
    end else begin
      led_red_intensity_out <= led_red_intensity_in;
      led_green_intensity_out <= led_green_intensity_in;
      led_blue_intensity_out <= led_blue_intensity_in;
    end
  end

endmodule

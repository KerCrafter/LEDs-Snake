module SnakeHead (
  input wire reset,
  input wire clk,
  input wire [1:0] direction,
  input wire move_act,
  input wire [3:0] scan_queue_x,
  input wire [3:0] scan_queue_y,
  output reg [3:0] x_pos,
  output reg [3:0] y_pos,
  output reg [5:0] queue_current_scan,
  output reg collide_detected
);

  reg run_queue_collision_check_scan;
  reg check_collide;

  always @(posedge clk) begin
    if(reset) begin
      queue_current_scan <= 0;
      run_queue_collision_check_scan <= 0;
      collide_detected <= 0;
      check_collide <= 1;
      x_pos <= 7;
      y_pos <= 7;
    end else if(move_act) begin
      check_collide <= 1;
      queue_current_scan <= 0;

      if(direction == 2'd0) begin
        x_pos <= x_pos + 4'd1;
      end else if(direction == 2'd1) begin
        x_pos <= x_pos - 4'd1;
      end else if(direction == 2'd2) begin
        y_pos <= y_pos + 4'd1;
      end else if(direction == 2'd3) begin
        y_pos <= y_pos - 4'd1;
      end

    end else if(check_collide) begin

      if(x_pos == scan_queue_x && y_pos == scan_queue_y) begin
        run_queue_collision_check_scan <= 0;     
        check_collide <= 0;

        collide_detected <= 1;
      end else begin
        check_collide <= 0;
        run_queue_collision_check_scan <= 1;
      end

    end else if(run_queue_collision_check_scan) begin
      queue_current_scan <= queue_current_scan + 1;
      
      check_collide <= 1;
      run_queue_collision_check_scan <= 0;

    end

  end

endmodule

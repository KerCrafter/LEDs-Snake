project_new -family "Cyclone IV E" -overwrite LEDs-snake
set_global_assignment -name DEVICE EP4CE22F17C6

set_global_assignment -name TOP_LEVEL_ENTITY DE0_NANO_LEDs_snake_main

set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

set_global_assignment -name VERILOG_FILE src/devices_entry/DE0_NANO_LEDs_snake_main.v
set_global_assignment -name VERILOG_FILE src/LEDs_snake_main.v 
set_global_assignment -name VERILOG_FILE src/LEDs_snake_core.v

set_global_assignment -name VERILOG_FILE src/button-debouncer/button_debouncer.v
set_global_assignment -name VERILOG_FILE src/WS2812B-driver/WS2812B_driver.v
set_global_assignment -name VERILOG_FILE src/WS2812B-driver/NRZ_sequence.v
set_global_assignment -name VERILOG_FILE src/WS2812B-driver/pipe_tri_bus.v

set_location_assignment PIN_R8 -to clk
set_location_assignment PIN_T14 -to leds_line
set_location_assignment PIN_R14 -to up
set_location_assignment PIN_J16 -to down
set_location_assignment PIN_N12 -to left
set_location_assignment PIN_R13 -to right

project_close

from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer
from fpga_test import fpga_test


@fpga_test
async def should_start_with_black_screen_only_centered_LED_is_darkgreen_represent_snake_head(dut):
    dut._log.info("Start")

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@fpga_test
async def snake_head_should_move_left_to_right(dut):
    dut._log.info("Start")

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 8 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@fpga_test
async def snake_goes_off_screen_should_reappear_on_other_side(dut):
    dut._log.info("Start")

    #x = 8
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 9
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 10
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 11
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 12
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 13
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 14
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 15
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    #x = 0 
    await Timer(10, unit="ns");
    dut.move_timer.value = 1;
    await Timer(10, unit="ns");
    dut.move_timer.value = 0;

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 0 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

async def check_LED(dut, x, y, red, green, blue):
    dut.current_led_x.value = x;
    dut.current_led_y.value = y;

    await Timer(10, unit="ns");
    dut.clk.value = 1;
    await Timer(10, unit="ns");
    dut.clk.value = 0;

    assert dut.led_red_intensity.value == red 
    assert dut.led_green_intensity.value == green 
    assert dut.led_blue_intensity.value == blue 

async def check_LED_is_BLACK(dut, x, y):
    await check_LED(dut, x, y, red=0, green=0, blue=0);

async def check_LED_is_GREEN(dut, x, y):
    await check_LED(dut, x, y, red=0, green=10, blue=0);


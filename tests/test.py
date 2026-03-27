import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer

@cocotb.test()
async def should_start_with_black_screen_only_first_LED_is_green_represent_snake_head(dut):
    dut._log.info("Start")

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
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

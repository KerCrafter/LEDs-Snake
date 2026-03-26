import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer

NUM_OF_LEDS=256;

@cocotb.test()
async def should_start_with_black_screen_only_first_LED_is_green_represent_snake_head(dut):
    dut._log.info("Start")

    await check_LED_is_GREEN(dut, led_number=0);

    for led_number in range(1, NUM_OF_LEDS-1):
      await check_LED_is_BLACK(dut, led_number);

async def check_LED(dut, led_number, red, green, blue):
    dut.current_led.value = led_number

    await Timer(10, unit="ns");
    dut.clk.value = 1;
    await Timer(10, unit="ns");
    dut.clk.value = 0;

    assert dut.led_red_intensity.value == red 
    assert dut.led_green_intensity.value == green 
    assert dut.led_blue_intensity.value == blue 

async def check_LED_is_BLACK(dut, led_number):
    await check_LED(dut, led_number, red=0, green=0, blue=0);

async def check_LED_is_GREEN(dut, led_number):
    await check_LED(dut, led_number, red=0, green=10, blue=0);

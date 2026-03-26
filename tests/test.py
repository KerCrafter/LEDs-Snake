import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def should_start_with_black_screen(dut):
    dut._log.info("Start")

    check_LED_is_BLACK(dut, led_number=0);
    check_LED_is_BLACK(dut, led_number=255);

def check_LED(dut, led_number, red, green, blue):
    dut.current_led.value = led_number

    assert dut.led_red_intensity.value == red 
    assert dut.led_green_intensity.value == green 
    assert dut.led_blue_intensity.value == blue 

def check_LED_is_BLACK(dut, led_number):
    check_LED(dut, led_number, red=0, green=0, blue=0);

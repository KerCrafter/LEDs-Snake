import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def should_start_with_black_screen(dut):
    dut._log.info("Start")


    dut.current_led.value = 0

    assert dut.led_red_intensity.value == 0
    assert dut.led_green_intensity.value == 0
    assert dut.led_blue_intensity.value == 0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer

@cocotb.test()
async def should_check_first_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=0, x=15, y=0)
    await check_LED(dut, n=1, x=14, y=0)
    await check_LED(dut, n=2, x=13, y=0)
    await check_LED(dut, n=3, x=12, y=0)
    await check_LED(dut, n=4, x=11, y=0)
    await check_LED(dut, n=5, x=10, y=0)
    await check_LED(dut, n=6, x=9, y=0)
    await check_LED(dut, n=7, x=8, y=0)
    await check_LED(dut, n=8, x=7, y=0)
    await check_LED(dut, n=9, x=6, y=0)
    await check_LED(dut, n=10, x=5, y=0)
    await check_LED(dut, n=11, x=4, y=0)
    await check_LED(dut, n=12, x=3, y=0)
    await check_LED(dut, n=13, x=2, y=0)
    await check_LED(dut, n=14, x=1, y=0)
    await check_LED(dut, n=15, x=0, y=0)

@cocotb.test()
async def should_check_second_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=16, x=0, y=1)
    await check_LED(dut, n=17, x=1, y=1)
    await check_LED(dut, n=18, x=2, y=1)
    await check_LED(dut, n=19, x=3, y=1)
    await check_LED(dut, n=20, x=4, y=1)
    await check_LED(dut, n=21, x=5, y=1)
    await check_LED(dut, n=22, x=6, y=1)
    await check_LED(dut, n=23, x=7, y=1)
    await check_LED(dut, n=24, x=8, y=1)
    await check_LED(dut, n=25, x=9, y=1)
    await check_LED(dut, n=26, x=10, y=1)
    await check_LED(dut, n=27, x=11, y=1)
    await check_LED(dut, n=28, x=12, y=1)
    await check_LED(dut, n=29, x=13, y=1)
    await check_LED(dut, n=30, x=14, y=1)
    await check_LED(dut, n=31, x=15, y=1)

async def check_LED(dut, n, x, y):
    dut.n.value = n;

    await Timer(1, unit="ns");

    assert dut.x.value == x;
    assert dut.y.value == y;

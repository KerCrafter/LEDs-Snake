import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer

@cocotb.test()
async def should_check_first_led(dut):
    dut._log.info("Start")

    dut.n.value = 0;

    await Timer(1, unit="ns");

    assert dut.x.value == 15;
    assert dut.y.value == 0;

@cocotb.test()
async def should_check_second_led(dut):
    dut._log.info("Start")

    dut.n.value = 1;

    await Timer(1, unit="ns");

    assert dut.x.value == 14;
    assert dut.y.value == 0;

@cocotb.test()
async def should_check_3rd_led(dut):
    dut._log.info("Start")

    dut.n.value = 2;

    await Timer(1, unit="ns");

    assert dut.x.value == 13;
    assert dut.y.value == 0;

@cocotb.test()
async def should_check_led_4(dut):
    dut._log.info("Start")

    dut.n.value = 3;

    await Timer(1, unit="ns");

    assert dut.x.value == 12;
    assert dut.y.value == 0;

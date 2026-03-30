import cocotb
from cocotb.triggers import Timer
import functools

def fpga_test(_fn=None, **kwargs):
  def decorator(fn):
    @functools.wraps(fn)
    async def wrapper(dut):
      await reset(dut)
      await fn(dut)

    return cocotb.test(**kwargs)(wrapper)

  if _fn is not None:
    return decorator(_fn)

  return decorator

async def reset(dut):
    dut.reset.value = 1;
    dut.clk.value = 1;
    await Timer(10, unit="ns");

    dut.clk.value = 0;
    dut.reset.value = 0;

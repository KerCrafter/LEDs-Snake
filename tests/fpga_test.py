import cocotb
from cocotb.triggers import Timer
import functools

def fpga_test(_fn=None, **kwargs):
  def decorator(fn):
    @functools.wraps(fn)
    async def wrapper(dut):
      await reset(dut, **kwargs)
      await fn(dut)

    return cocotb.test()(wrapper)

  if _fn is not None:
    return decorator(_fn)

  return decorator

async def reset(dut, **kwargs):
    dut.bonus_random_x.value = kwargs['first_bonus_x'] if 'first_bonus_x' in kwargs.keys() else 'XXXX';
    dut.bonus_random_y.value = kwargs['first_bonus_y'] if 'first_bonus_y' in kwargs.keys() else 'XXXX';

    dut.reset.value = 1;
    dut.clk.value = 1;
    await Timer(10, unit="ns");

    dut.clk.value = 0;
    dut.reset.value = 0;

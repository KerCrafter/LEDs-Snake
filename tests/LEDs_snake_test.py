import cocotb
from cocotb.triggers import Timer
import functools
import inspect

def LEDs_snake_test(_fn=None, **kwargs):
  def decorator(fn):
    @functools.wraps(fn)
    async def wrapper(dut):
      await reset(dut, **kwargs)

      async def move_timer_PULSE(times=1):
        await _move_timer_PULSE(dut, times=times);

      sig = inspect.signature(fn)
      if "move_timer_PULSE" in sig.parameters:
        await fn(dut, move_timer_PULSE)
      else:
        await fn(dut)

    return cocotb.test()(wrapper)

  if _fn is not None:
    return decorator(_fn)

  return decorator

async def reset(dut, **kwargs):
    dut.move_timer.value = 0;

    dut.bonus_random_x.value = kwargs['first_bonus_x'] if 'first_bonus_x' in kwargs.keys() else 'XXXX';
    dut.bonus_random_y.value = kwargs['first_bonus_y'] if 'first_bonus_y' in kwargs.keys() else 'XXXX';

    dut.reset.value = 1;
    dut.clk.value = 1;
    await Timer(10, unit="ns");

    dut.clk.value = 0;
    dut.reset.value = 0;

async def _move_timer_PULSE(dut, times=1):
    for i in range(times):
      dut.move_timer.value = 1;
      await Timer(1, unit="ns");
      dut.clk.value = 1;
      await Timer(1, unit="ns");
      dut.clk.value = 0;
      await Timer(1, unit="ns");
      dut.move_timer.value = 0;
      await Timer(1, unit="ns");

      dut.clk.value = 1;
      await Timer(1, unit="ns");
      dut.clk.value = 0;
      await Timer(1, unit="ns");

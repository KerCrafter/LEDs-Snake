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

@cocotb.test()
async def should_check_3rd_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=32, x=15, y=2)
    await check_LED(dut, n=33, x=14, y=2)
    await check_LED(dut, n=34, x=13, y=2)
    await check_LED(dut, n=35, x=12, y=2)
    await check_LED(dut, n=36, x=11, y=2)
    await check_LED(dut, n=37, x=10, y=2)
    await check_LED(dut, n=38, x=9, y=2)
    await check_LED(dut, n=39, x=8, y=2)
    await check_LED(dut, n=40, x=7, y=2)
    await check_LED(dut, n=41, x=6, y=2)
    await check_LED(dut, n=42, x=5, y=2)
    await check_LED(dut, n=43, x=4, y=2)
    await check_LED(dut, n=44, x=3, y=2)
    await check_LED(dut, n=45, x=2, y=2)
    await check_LED(dut, n=46, x=1, y=2)
    await check_LED(dut, n=47, x=0, y=2)

@cocotb.test()
async def should_check_4th_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=48, x=0, y=3)
    await check_LED(dut, n=49, x=1, y=3)
    await check_LED(dut, n=50, x=2, y=3)
    await check_LED(dut, n=51, x=3, y=3)
    await check_LED(dut, n=52, x=4, y=3)
    await check_LED(dut, n=53, x=5, y=3)
    await check_LED(dut, n=54, x=6, y=3)
    await check_LED(dut, n=55, x=7, y=3)
    await check_LED(dut, n=56, x=8, y=3)
    await check_LED(dut, n=57, x=9, y=3)
    await check_LED(dut, n=58, x=10, y=3)
    await check_LED(dut, n=59, x=11, y=3)
    await check_LED(dut, n=60, x=12, y=3)
    await check_LED(dut, n=61, x=13, y=3)
    await check_LED(dut, n=62, x=14, y=3)
    await check_LED(dut, n=63, x=15, y=3)

@cocotb.test()
async def should_check_5th_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=64, x=15, y=4)
    await check_LED(dut, n=65, x=14, y=4)
    await check_LED(dut, n=66, x=13, y=4)
    await check_LED(dut, n=67, x=12, y=4)
    await check_LED(dut, n=68, x=11, y=4)
    await check_LED(dut, n=69, x=10, y=4)
    await check_LED(dut, n=70, x=9, y=4)
    await check_LED(dut, n=71, x=8, y=4)
    await check_LED(dut, n=72, x=7, y=4)
    await check_LED(dut, n=73, x=6, y=4)
    await check_LED(dut, n=74, x=5, y=4)
    await check_LED(dut, n=75, x=4, y=4)
    await check_LED(dut, n=76, x=3, y=4)
    await check_LED(dut, n=77, x=2, y=4)
    await check_LED(dut, n=78, x=1, y=4)
    await check_LED(dut, n=79, x=0, y=4)

@cocotb.test()
async def should_check_6th_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=80, x=0, y=5)
    await check_LED(dut, n=81, x=1, y=5)
    await check_LED(dut, n=82, x=2, y=5)
    await check_LED(dut, n=83, x=3, y=5)
    await check_LED(dut, n=84, x=4, y=5)
    await check_LED(dut, n=85, x=5, y=5)
    await check_LED(dut, n=86, x=6, y=5)
    await check_LED(dut, n=87, x=7, y=5)
    await check_LED(dut, n=88, x=8, y=5)
    await check_LED(dut, n=89, x=9, y=5)
    await check_LED(dut, n=90, x=10, y=5)
    await check_LED(dut, n=91, x=11, y=5)
    await check_LED(dut, n=92, x=12, y=5)
    await check_LED(dut, n=93, x=13, y=5)
    await check_LED(dut, n=94, x=14, y=5)
    await check_LED(dut, n=95, x=15, y=5)

@cocotb.test()
async def should_check_7th_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=96, x=15, y=6)
    await check_LED(dut, n=97, x=14, y=6)
    await check_LED(dut, n=98, x=13, y=6)
    await check_LED(dut, n=99, x=12, y=6)
    await check_LED(dut, n=100, x=11, y=6)
    await check_LED(dut, n=101, x=10, y=6)
    await check_LED(dut, n=102, x=9, y=6)
    await check_LED(dut, n=103, x=8, y=6)
    await check_LED(dut, n=104, x=7, y=6)
    await check_LED(dut, n=105, x=6, y=6)
    await check_LED(dut, n=106, x=5, y=6)
    await check_LED(dut, n=107, x=4, y=6)
    await check_LED(dut, n=108, x=3, y=6)
    await check_LED(dut, n=109, x=2, y=6)
    await check_LED(dut, n=110, x=1, y=6)
    await check_LED(dut, n=111, x=0, y=6)

@cocotb.test()
async def should_check_8th_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=112, x=0, y=7)
    await check_LED(dut, n=113, x=1, y=7)
    await check_LED(dut, n=114, x=2, y=7)
    await check_LED(dut, n=115, x=3, y=7)
    await check_LED(dut, n=116, x=4, y=7)
    await check_LED(dut, n=117, x=5, y=7)
    await check_LED(dut, n=118, x=6, y=7)
    await check_LED(dut, n=119, x=7, y=7)
    await check_LED(dut, n=120, x=8, y=7)
    await check_LED(dut, n=121, x=9, y=7)
    await check_LED(dut, n=122, x=10, y=7)
    await check_LED(dut, n=123, x=11, y=7)
    await check_LED(dut, n=124, x=12, y=7)
    await check_LED(dut, n=125, x=13, y=7)
    await check_LED(dut, n=126, x=14, y=7)
    await check_LED(dut, n=127, x=15, y=7)

@cocotb.test()
async def should_check_9th_led_line(dut):
    dut._log.info("Start")

    await check_LED(dut, n=128, x=15, y=8)
    await check_LED(dut, n=129, x=14, y=8)
    await check_LED(dut, n=130, x=13, y=8)
    await check_LED(dut, n=131, x=12, y=8)
    await check_LED(dut, n=132, x=11, y=8)
    await check_LED(dut, n=133, x=10, y=8)
    await check_LED(dut, n=134, x=9, y=8)
    await check_LED(dut, n=135, x=8, y=8)
    await check_LED(dut, n=136, x=7, y=8)
    await check_LED(dut, n=137, x=6, y=8)
    await check_LED(dut, n=138, x=5, y=8)
    await check_LED(dut, n=139, x=4, y=8)
    await check_LED(dut, n=140, x=3, y=8)
    await check_LED(dut, n=141, x=2, y=8)
    await check_LED(dut, n=142, x=1, y=8)
    await check_LED(dut, n=143, x=0, y=8)

@cocotb.test()
async def should_check_last_led(dut):
    dut._log.info("Start")

    await check_LED(dut, n=255, x=15, y=15)

async def check_LED(dut, n, x, y):
    dut.n.value = n;

    await Timer(1, unit="ns");

    assert dut.x.value == x;
    assert dut.y.value == y;

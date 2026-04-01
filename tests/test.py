from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer
from LEDs_snake_test import LEDs_snake_test

@LEDs_snake_test
async def should_start_with_black_screen_only_centered_LED_is_darkgreen_represent_snake_head(dut):
    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_head_should_move_left_to_right(dut, move_timer_PULSE):
    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 8 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_goes_off_screen_should_reappear_on_other_side(dut, move_timer_PULSE):
    await move_timer_PULSE(times=9); 

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 0 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);


@LEDs_snake_test
async def snake_head_should_move_right_to_left_after_left_button_press(dut, move_timer_PULSE):
    await player_press_LEFT(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 6 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_head_should_move_up_to_down_after_down_button_press(dut, move_timer_PULSE):
    await player_press_DOWN(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 8:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_head_should_move_down_to_up_after_up_button_press(dut, move_timer_PULSE):
    await player_press_UP(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 6:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_head_should_move_right_after_left_move(dut, move_timer_PULSE):
    await player_press_LEFT(dut);

    await move_timer_PULSE();

    await player_press_RIGHT(dut)

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=10,
  first_bonus_y=10
)
async def bonus_should_appear(dut):
    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x is 10 and y is 10:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def snake_should_eat_the_bonus(dut, move_timer_PULSE):
    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x is 8 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def snake_queue_should_follow_head(dut, move_timer_PULSE):
    await move_timer_PULSE(times=2);

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 8 and y is 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x is 9 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def snake_queue_should_continue_follow_head(dut, move_timer_PULSE):
    await move_timer_PULSE(times=3);

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 9 and y is 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x is 10 and y is 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=7,
  first_bonus_y=6
)
async def snake_should_eat_the_bonus_down_to_up(dut, move_timer_PULSE):

    await player_press_UP(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x is 7 and y is 6:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=7,
  first_bonus_y=6
)
async def snake_queue_should_follow_head_when_direction_is_UP(dut, move_timer_PULSE):

    await player_press_UP(dut);

    await move_timer_PULSE(times=2);

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 6:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x is 7 and y is 5:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=7,
  first_bonus_y=8
)
async def snake_should_eat_the_bonus_to_down(dut, move_timer_PULSE):

    await player_press_DOWN(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x is 7 and y is 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x is 7 and y is 8:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

async def check_LED(dut, x, y, red, green, blue):
    dut.current_led_x.value = x;
    dut.current_led_y.value = y;

    await Timer(1, unit="ns");
    dut.clk.value = 1;
    await Timer(1, unit="ns");
    dut.clk.value = 0;

    assert dut.led_red_intensity.value == red 
    assert dut.led_green_intensity.value == green 
    assert dut.led_blue_intensity.value == blue 

async def check_LED_is_BLACK(dut, x, y):
    await check_LED(dut, x, y, red=0, green=0, blue=0);

async def check_LED_is_LIGHT_GREEN(dut, x, y):
    await check_LED(dut, x, y, red=0, green=5, blue=0);

async def check_LED_is_GREEN(dut, x, y):
    await check_LED(dut, x, y, red=0, green=10, blue=0);

async def check_LED_is_RED(dut, x, y):
    await check_LED(dut, x, y, red=10, green=0, blue=0);

async def player_press_RIGHT(dut):
    dut.players_commands_right.value = 1;
    await Timer(1, unit="ns");
    dut.clk.value = 1;

    await Timer(1, unit="ns");
    dut.players_commands_right.value = 0;
    dut.clk.value = 0;
    await Timer(1, unit="ns");

async def player_press_LEFT(dut):
    dut.players_commands_left.value = 1;
    await Timer(1, unit="ns");
    dut.clk.value = 1;

    await Timer(1, unit="ns");
    dut.players_commands_left.value = 0;
    dut.clk.value = 0;
    await Timer(1, unit="ns");

async def player_press_UP(dut):
    dut.players_commands_up.value = 1;
    await Timer(1, unit="ns");
    dut.clk.value = 1;

    await Timer(1, unit="ns");
    dut.players_commands_up.value = 0;
    dut.clk.value = 0;
    await Timer(1, unit="ns");

async def player_press_DOWN(dut):
    dut.players_commands_down.value = 1;
    await Timer(1, unit="ns");
    dut.clk.value = 1;

    await Timer(1, unit="ns");
    dut.players_commands_down.value = 0;
    dut.clk.value = 0;
    await Timer(1, unit="ns");

from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer
from LEDs_snake_test import LEDs_snake_test

@LEDs_snake_test
async def should_start_with_black_screen_only_centered_LED_is_darkgreen_represent_snake_head(dut):
    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_head_should_move_left_to_right(dut, move_timer_PULSE):
    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 8 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_goes_off_screen_should_reappear_on_other_side(dut, move_timer_PULSE):
    await move_timer_PULSE(times=9); 

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 0 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);


@LEDs_snake_test
async def snake_head_should_move_right_to_left_after_left_button_press(dut, move_timer_PULSE):
    await player_press_LEFT(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 6 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_head_should_move_up_to_down_after_down_button_press(dut, move_timer_PULSE):
    await player_press_DOWN(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 8:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test
async def snake_head_should_move_down_to_up_after_up_button_press(dut, move_timer_PULSE):
    await player_press_UP(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 6:
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
        if x == 7 and y == 7:
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
        if x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 10 and y == 10:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def snake_should_eat_the_bonus_to_right_direction(dut, move_timer_PULSE):
    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 8 and y == 7:
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
        if x == 8 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 9 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def snake_queue_should_continue_follow_head(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 0; 
    dut.bonus_random_y.value = 0; 

    await move_timer_PULSE(times=3);

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 9 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 10 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 0 and y == 0:
          await check_LED_is_RED(dut, x, y);
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
        if x == 7 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 6:
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
        if x == 7 and y == 6:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 5:
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
        if x == 7 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 8:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=6,
  first_bonus_y=7
)
async def snake_should_eat_the_bonus_to_left(dut, move_timer_PULSE):

    await player_press_LEFT(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 6 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);


@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def starting_score_is_zero(dut, move_timer_PULSE):
    assert dut.score.value == 0

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def eating_the_bonus_to_right_direction_increment_score(dut, move_timer_PULSE):
    await move_timer_PULSE();

    assert dut.score.value == 1


@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def eating_the_bonus_to_right_direction_should_appear_new_bonus(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 10; 
    dut.bonus_random_y.value = 10; 

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 8 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 10 and y == 10:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def eating_the_second_bonus_should_extend_queue(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 9; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE();

    dut.bonus_random_x.value = 0; 
    dut.bonus_random_y.value = 0; 

    await move_timer_PULSE();

    assert dut.score.value == 2

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 9 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 8 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 0 and y == 0:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def eating_the_3rd_bonus_should_extend_queue(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 9; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=8 y=7

    dut.bonus_random_x.value = 10; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=9 y=7

    dut.bonus_random_x.value = 0; 
    dut.bonus_random_y.value = 0; 

    await move_timer_PULSE(); #x=10 y=7

    assert dut.score.value == 3

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 10 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 9 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 8 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 0 and y == 0:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def after_eat_one_bonus_impossible_to_press_inverse_direction_to_left(dut, move_timer_PULSE):

    await move_timer_PULSE();

    await player_press_LEFT(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 8 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 9 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=6,
  first_bonus_y=7
)
async def after_eat_one_bonus_impossible_to_press_inverse_direction_to_right(dut, move_timer_PULSE):

    await player_press_LEFT(dut);

    await move_timer_PULSE();

    await player_press_RIGHT(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 6 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 5 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=7,
  first_bonus_y=8
)
async def after_eat_one_bonus_impossible_to_press_inverse_direction_to_up(dut, move_timer_PULSE):

    await player_press_DOWN(dut);

    await move_timer_PULSE();

    await player_press_UP(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 8:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 9:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=7,
  first_bonus_y=6
)
async def after_eat_one_bonus_impossible_to_press_inverse_direction_to_down(dut, move_timer_PULSE):

    await player_press_UP(dut);

    await move_timer_PULSE();

    await player_press_DOWN(dut);

    await move_timer_PULSE();

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 6:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 5:
          await check_LED_is_GREEN(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def eating_his_own_queue_finish_game_with_red_screen_from_DOWN_direction(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 9; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=8 y=7 score=1

    dut.bonus_random_x.value = 10; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=9 y=7 score=2

    dut.bonus_random_x.value = 0; 
    dut.bonus_random_y.value = 0; 

    await move_timer_PULSE(); #x=10 y=7 score=3

    await player_press_UP(dut);

    await move_timer_PULSE(); #x=10 y=6

    await player_press_LEFT(dut);

    await move_timer_PULSE(); #x=9 y=6

    await player_press_DOWN(dut);
    await move_timer_PULSE(); #x=9 y=7 -eat his own queue

    assert dut.score.value == 3 
    for x in range(0, 15):
      for y in range(0, 15):
        await check_LED_is_RED(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def collide_only_if_queue_3_present_from_DOWN_direction(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 1; 
    dut.bonus_random_y.value = 1; 

    await move_timer_PULSE(); #x=8 y=7

    await player_press_UP(dut);

    await move_timer_PULSE(); #x=8 y=6

    await player_press_LEFT(dut);

    await move_timer_PULSE(); #x=7 y=6

    await player_press_DOWN(dut);
    await move_timer_PULSE(); #x=7 y=7 

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 6:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 1 and y == 1:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);


@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def collide_only_if_queue_3_present_from_UP_direction(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 1; 
    dut.bonus_random_y.value = 1; 

    await move_timer_PULSE(); #x=8 y=7

    await player_press_DOWN(dut);

    await move_timer_PULSE(); #x=8 y=8

    await player_press_LEFT(dut);

    await move_timer_PULSE(); #x=7 y=8

    await player_press_UP(dut);
    await move_timer_PULSE(); #x=7 y=7 

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 7 and y == 8:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 1 and y == 1:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def collide_only_if_queue_3_present_from_LEFT_direction(dut, move_timer_PULSE):

    await player_press_DOWN(dut);

    dut.bonus_random_x.value = 1; 
    dut.bonus_random_y.value = 1; 

    await move_timer_PULSE(); #x=7 y=8

    await player_press_RIGHT(dut);

    await move_timer_PULSE(); #x=8 y=8

    await player_press_UP(dut);

    await move_timer_PULSE(); #x=8 y=7

    await player_press_LEFT(dut);
    await move_timer_PULSE(); #x=7 y=7 

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 8 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 1 and y == 1:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def collide_only_if_queue_3_present_from_RIGHT_direction(dut, move_timer_PULSE):

    await player_press_DOWN(dut);

    dut.bonus_random_x.value = 1; 
    dut.bonus_random_y.value = 1; 

    await move_timer_PULSE(); #x=7 y=8

    await player_press_LEFT(dut);

    await move_timer_PULSE(); #x=6 y=8

    await player_press_UP(dut);

    await move_timer_PULSE(); #x=6 y=7

    await player_press_RIGHT(dut);
    await move_timer_PULSE(); #x=7 y=7 

    for x in range(0, 15):
      for y in range(0, 15):
        if x == 6 and y == 7:
          await check_LED_is_LIGHT_GREEN(dut, x, y);
        elif x == 7 and y == 7:
          await check_LED_is_GREEN(dut, x, y);
        elif x == 1 and y == 1:
          await check_LED_is_RED(dut, x, y);
        else:
          await check_LED_is_BLACK(dut, x, y);


@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def eating_his_own_queue_finish_game_with_red_screen_from_UP_direction(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 9; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=8 y=7

    dut.bonus_random_x.value = 10; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=9 y=7

    dut.bonus_random_x.value = 11; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=10 y=7

    dut.bonus_random_x.value = 0; 
    dut.bonus_random_y.value = 0; 

    await move_timer_PULSE(); #x=11 y=7

    await player_press_DOWN(dut);

    await move_timer_PULSE(); #x=11 y=8

    await player_press_LEFT(dut);

    await move_timer_PULSE(); #x=10 y=8

    await player_press_UP(dut);

    await move_timer_PULSE(); #eat his own queue

    for x in range(0, 15):
      for y in range(0, 15):
        await check_LED_is_RED(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=8,
  first_bonus_y=7
)
async def eating_his_own_queue_finish_game_with_red_screen_from_RIGHT_direction(dut, move_timer_PULSE):

    dut.bonus_random_x.value = 9; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=8 y=7

    dut.bonus_random_x.value = 10; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=9 y=7

    dut.bonus_random_x.value = 11; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=10 y=7

    dut.bonus_random_x.value = 0; 
    dut.bonus_random_y.value = 0; 

    await move_timer_PULSE(); #x=11 y=7

    await player_press_UP(dut);

    await move_timer_PULSE(); #x=11 y=6
    await move_timer_PULSE(); #x=11 y=5
    await move_timer_PULSE(); #x=11 y=4

    await player_press_LEFT(dut);

    await move_timer_PULSE(); #x=9 y=4

    await player_press_DOWN(dut);

    await move_timer_PULSE(); #x=9 y=5

    await player_press_RIGHT(dut);

    await move_timer_PULSE(); #eat his queue

    for x in range(0, 15):
      for y in range(0, 15):
        await check_LED_is_RED(dut, x, y);

@LEDs_snake_test(
  first_bonus_x=6,
  first_bonus_y=7
)
async def eating_his_own_queue_finish_game_with_red_screen_from_LEFT_direction(dut, move_timer_PULSE):

    await player_press_LEFT(dut);

    dut.bonus_random_x.value = 5; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=6 y=7

    dut.bonus_random_x.value = 4; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=5 y=7

    dut.bonus_random_x.value = 3; 
    dut.bonus_random_y.value = 7; 

    await move_timer_PULSE(); #x=4 y=7

    dut.bonus_random_x.value = 0; 
    dut.bonus_random_y.value = 0; 

    await move_timer_PULSE(); #x=3 y=7

    await player_press_DOWN(dut);

    await move_timer_PULSE(); #x=3 y=8
    await move_timer_PULSE(); #x=3 y=9
    await move_timer_PULSE(); #x=3 y=10

    await player_press_RIGHT(dut);

    await move_timer_PULSE(); #x=4 y=10

    await player_press_UP(dut);

    await move_timer_PULSE(); #x=3 y=10

    await player_press_LEFT(dut);

    await move_timer_PULSE(); #eat his queue

    for x in range(0, 15):
      for y in range(0, 15):
        await check_LED_is_RED(dut, x, y);

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
    await check_LED(dut, x, y, red=0, green=1, blue=0);

async def check_LED_is_GREEN(dut, x, y):
    await check_LED(dut, x, y, red=2, green=5, blue=0);

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

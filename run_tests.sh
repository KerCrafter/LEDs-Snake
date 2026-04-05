#!/bin/bash


export PROJECT_SOURCES="LEDs_snake_main.v LEDs_snake_core.v bonus_manager.v player_commands_manager.v snake_head.v snake_queue.v draw_snake_queue.v draw_snake_head.v draw_bonus.v draw_end_game.v"
./tests/cocotb-runner/run_tests.sh

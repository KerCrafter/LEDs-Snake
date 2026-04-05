# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
FST ?= -fst # Use more efficient FST format
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../../src
PROJECT_SOURCES += LEDs_snake_main.v
PROJECT_SOURCES += LEDs_snake_core.v
PROJECT_SOURCES += bonus_manager.v
PROJECT_SOURCES += player_commands_manager.v
PROJECT_SOURCES += snake_head.v
PROJECT_SOURCES += snake_queue.v
PROJECT_SOURCES += draw_snake_queue.v
PROJECT_SOURCES += draw_snake_head.v
PROJECT_SOURCES += draw_bonus.v
PROJECT_SOURCES += draw_end_game.v

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS 		+= -I$(SRC_DIR)

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/../tb.v
TOPLEVEL = tb

# List test modules to run, separated by commas and without the .py suffix:
export PYTHONPATH := $(PWD)/../:$(PYTHONPATH)
COCOTB_TEST_MODULES = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim


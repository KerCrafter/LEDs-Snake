#!/bin/bash

cd "$(dirname "$0")/../../"

sudo docker run -w /project -v `pwd`:/project --rm -it cocotb-verilog-stack

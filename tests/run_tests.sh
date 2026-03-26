#!/bin/bash

cd ..
sudo docker run -w /project -v `pwd`:/project --rm -it cocotb-verilog-stack

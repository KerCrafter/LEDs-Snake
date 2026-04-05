FROM python:3.13

ADD requirements.txt .

RUN apt update && apt-get install -y iverilog

RUN pip install -r requirements.txt

CMD ["/bin/bash", "-c", "cd tests/cocotb-runner/ && make -B"]

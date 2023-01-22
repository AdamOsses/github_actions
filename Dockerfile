FROM ubuntu:20.04

ADD simple_file.py /

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    python3.9 \
    python3-pip

CMD ["python3", "./simple_file.py" ]

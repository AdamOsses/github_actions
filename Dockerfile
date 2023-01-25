FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    python3.9 \
    python3-pip

ARG APP_DIR=/usr/src/my_app

WORKDIR /tmp
# dir where U start
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
RUN mkdir -p $APP_DIR

ADD simple_file.py $APP_DIR

#CMD ["python3", "/usr/src/my_app/simple_file.py", "/bin/bash" ]
CMD /bin/bash -c "python3 /usr/src/my_app/simple_file.py; bash"
FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    python3.9 \
    python3-pip

RUN apt-get install -y wget
# download and unpack latest geckodriver
RUN wget -q -O - "https://github.com/mozilla/geckodriver/releases/download/v0.32.0/geckodriver-v0.32.0-linux64.tar.gz" | tar -xz -C /usr/local/bin/
# install firefox
RUN apt install -y firefox

ARG APP_DIR=/home/my_app

WORKDIR $APP_DIR
# dir where U start
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
RUN mkdir -p $APP_DIR

ADD simple_file.py $APP_DIR
ADD tests/ $APP_DIR/tests/

#CMD ["python3", "/usr/src/my_app/simple_file.py", "/bin/bash" ]
CMD /bin/bash -c "python3 /home/my_app/simple_file.py; \
                  python3 /home/my_app/tests/test_w3schools.py; bash"
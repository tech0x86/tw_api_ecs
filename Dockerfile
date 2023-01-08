FROM python:3.10
USER root

WORKDIR /var/app

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

COPY ./app/tweetsomething.py ./
COPY ./requirements.txt ./

RUN apt-get install -y vim less
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools

RUN pip3 install -r requirements.txt
CMD ["/usr/bin/python3", "tweetsomething.py"]

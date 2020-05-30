FROM ubuntu

MAINTAINER adrian.podsiadlowski@gmail.com

VOLUME [ "/Source" ]

WORKDIR "/Source"

RUN apt-get update && \
    apt-get -y install make && \
    apt-get -y install gcc && \
    apt-get -y install g++ && \
    apt-get -y install gdb && \
    apt-get -y install cmake


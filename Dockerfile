FROM debian:buster

RUN apt-get update
RUN apt-get install -y git-core curl wget apt-utils python2.7
RUN cd usr/bin && \
    ln -s ./python2.7 python

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH="/depot_tools:${PATH}"

RUN gclient

RUN alias python=python3 && \
    mkdir -p v8 && \
    cd v8 && \
    fetch v8

FROM archlinux:latest

RUN pacman --noconfirm -Sy git
# RUN pacman --noconfirm -S python3
RUN pacman --noconfirm -Sy python2
RUN cd usr/bin && \
    ln -s ./python2.7 python

RUN python --version
# RUN apt update
# RUN apt upgrade

# RUN apt install -y git-core python3
# RUN apt-get install -y python3.7
# RUN cd usr/bin && \
#    ln -s ./python2.7 python
# RUN python --version

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH="/depot_tools:${PATH}"

RUN gclient

RUN mkdir -p v8 && \
    cd v8 && \
    fetch v8

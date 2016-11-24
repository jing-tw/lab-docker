FROM ubuntu:16.04

MAINTAINER jing <mqjing@gmail.com>

RUN apt-get update 
RUN apt-get install -y software-properties-common  
RUN add-apt-repository -y ppa:neovim-ppa/unstable

RUN apt-get update
RUN apt-get install -y neovim python3-dev python3-pip

RUN pip install --user neovim

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/bin/bash" ]

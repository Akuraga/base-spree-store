FROM ubuntu:vivid
MAINTAINER Lorcan O'Flynn <lorcan.oflynn@gmail.com>

RUN sudo apt-get update
RUN sudo apt-get -y install libmysqlclient-dev imagemagick

RUN cd /home/app && git clone https://github.com/lorcanoeire/base-spree-store.git store
RUN cd /home/app/store && bundle install --no-cache

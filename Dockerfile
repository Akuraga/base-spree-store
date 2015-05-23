FROM ubuntu:vivid
MAINTAINER Lorcan O'Flynn <lorcan.oflynn@gmail.com>

RUN apt-get update
RUN apt-get -y install libmysqlclient-dev imagemagick git ruby build-essential ruby2.0-dev

RUN mkdir -p /home/app
RUN cd /home/app && git clone https://github.com/lorcanoeire/base-spree-store.git store
RUN cd /home/app/store && gem install bundler && bundle install --no-cache

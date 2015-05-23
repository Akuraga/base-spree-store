FROM ubuntu:vivid
MAINTAINER Lorcan O'Flynn <lorcan.oflynn@gmail.com>

RUN apt-get update
RUN apt-get -y install libmysqlclient-dev imagemagick git

RUN mkdir -p /home/app
RUN cd /home/app && git clone https://github.com/lorcanoeire/base-spree-store.git store
RUN cd /home/app/store && gem install bundler && bundle install --no-cache

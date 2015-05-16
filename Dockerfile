FROM phusion/passenger-full:0.9.11
MAINTAINER Lorcan O'Flynn <lorcan.oflynn@gmail.com>

RUN sudo apt-get update
RUN sudo apt-get -y install libmysqlclient-dev imagemagick

RUN cd /home/app && git clone https://github.com/lorcanoeire/alpha-spree-store.git store
RUN cd /home/app/store && bundle install --no-cache

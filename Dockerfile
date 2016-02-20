FROM lorcanoeire/base-vivid
MAINTAINER Lorcan O'Flynn <lorcan.oflynn@gmail.com>

# Install the application
RUN mkdir -p /home/app
RUN cd /home/app && git clone https://github.com/lorcanoeire/base-spree-store.git --branch oringa-3-stable --single-branch store
RUN cd /home/app/store && bundle install --no-cache

ADD run.sh /home/app/store/run.sh
WORKDIR /home/app/store
EXPOSE 8080

ENTRYPOINT ["./run.sh"]

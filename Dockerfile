FROM node:7.10

MAINTAINER PunditSharp

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies and tools
RUN apt-get update; \
    apt-get install -y apt-utils apt-transport-https; \
    apt-get install -y curl wget; \
    apt-get install -y libnss-mdns avahi-discover libavahi-compat-libdnssd-dev libkrb5-dev

RUN npm install -g castv2; \
    npm install -g castv2-client; \
    npm install -g debug; \
    npm install -g http; \
    npm install -g url; \
    npm install -g minimist; \
    npm install -g mdns
    
# Get latest script from Git
# -------------------------------------------------------------------------
WORKDIR /castwebapi
RUN git clone https://github.com/vervallsweg/cast-web-api.git /castwebapi

ADD image/run.sh /root/run.sh

# Run container
EXPOSE 3000
CMD ["/root/run.sh"]

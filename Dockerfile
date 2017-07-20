FROM node:7.10

MAINTAINER PunditSharp

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install dependencies and tools
RUN apt-get update; \
    apt-get install -y apt-utils apt-transport-https; \
    apt-get install -y curl wget; \
    apt-get install -y libnss-mdns avahi-discover libavahi-compat-libdnssd-dev libkrb5-dev; \

# Get latest script from Git
# -------------------------------------------------------------------------
RUN mkdir -p /castwebapi
RUN git clone https://github.com/vervallsweg/cast-web-api.git /castwebapi

ADD image/run.sh /root/run.sh

# Run container
EXPOSE 3000
CMD ["/root/run.sh"]

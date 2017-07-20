#!/bin/bash

# Start CastWebAPI
ipaddr=$(ip route get 1 | awk '{print $NF;exit}')
node /castwebapi/castWebApi.js --hostname=$ipaddr

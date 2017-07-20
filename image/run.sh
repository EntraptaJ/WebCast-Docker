#!/bin/bash

# Start CastWebAPI
ip_addr = $(ip route get 1 | awk '{print $NF;exit}')
node /castwebapi/castWebApi.js --hostname=$ip_addr

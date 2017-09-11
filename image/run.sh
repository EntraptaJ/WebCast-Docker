#!/bin/bash

cd smartthings-cast
npm install

# Start CastWebAPI
ipaddr=$(ip route get 1 | awk '{print $NF;exit}')
node /castwebapi/cast-web-api/castWebApi.js --hostname=$ipaddr


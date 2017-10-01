#!/bin/bash
npm install

# Start CastWebAPI
ipaddr=$(ip route get 1 | awk '{print $NF;exit}')
node /castwebapi/castWeb/castWebApi.js --hostname=$ipaddr


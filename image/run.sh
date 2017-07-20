#!/bin/bash

# Start CastWebAPI
node /castwebapi/castWebApi.js --hostname=(ip route get 1 | awk '{print $NF;exit}')

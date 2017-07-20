#!/bin/bash

cd /root/.castwebapi

env_file="/root/.castwebapi/.env"
install_file="/root/.castwebapi/install.sh"
package_file="/root/.castwebapi/package.json"
plugin_folder="/root/.castwebapi/plugins"

# Install plugins via package.json
if [ -f "$package_file" ]
then
    echo "Installing plugins from $package_file."

    npm install
else
    echo "$package_file not found."
fi

# Install plugins via install.sh
if [ -f "$install_file" ]
then
    echo "Installing plugins from $install_file."

    /bin/bash $install_file
else
    echo "$install_file not found."
fi

# Start CastWebAPI
ip_addr = ip route get 1 | awk '{print $NF;exit}'
node root/castWebApi.js --hostname=ip_addr

#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi
export DEBIAN_FRONTEND=noninteractive
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

echo "we are going to download needed files:)"
GITHUB_REPOSITORY=hiddify-config
GITHUB_USER=hiddify
GITHUB_BRANCH_OR_TAG=main

# if [ ! -d "/opt/$GITHUB_REPOSITORY" ];then
        apt update
        apt upgrade -y
        apt install -y wget python3-pip dialog unzip
        pip3 install lastversion "requests<=2.29.0"
        mkdir -p /opt/$GITHUB_REPOSITORY
        cd /opt/$GITHUB_REPOSITORY
        wget https://github.com/hiddify/hiddify-config/archive/v9.4.3.zip -O hiddify-config.zip
        unzip -o hiddify-config.zip
        rm hiddify-config.zip
        mv hiddify-config-9.4.3/* .
        rm -rd hiddify-config-9.4.3
        wget https://raw.githubusercontent.com/randomguy-on-internet/hiddify-config/main/hiddify-panel/install.sh -o ./hiddify-panel/install.sh
        chmod +x ./hiddify-panel/install.sh
        bash install.sh
        # exit 0
# fi 


echo "/opt/hiddify-config/menu.sh">>~/.bashrc
echo "cd /opt/hiddify-config/">>~/.bashrc

read -p "Press any key to go  to menu" -n 1 key
cd /opt/$GITHUB_REPOSITORY
bash menu.sh

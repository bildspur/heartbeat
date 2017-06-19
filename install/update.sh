#!/bin/bash

# create update folder
rm -r /home/pi/update; mkdir /home/pi/update

# change to this folder
cd /home/pi/update

# check if github is available
if ping -c 1 github.com &> /dev/null
then
  echo "Github found! Updating..."
else
  exit 1
fi

# download last files from github
wget -qO- https://github.com/bildspur/heartbeat/archive/master.zip | jar xvf /dev/stdin
sudo rm -r /home/pi/heartbeat-master; sudo mv heartbeat-master /home/pi/heartbeat-master
#!/bin/bash

# create update folder
if [ -d /home/pi/update ]
	  then
    echo "update folder exists..."
    sudo rm -rf /home/pi/update
    echo "removed!"
fi

sudo mkdir /home/pi/update
sudo chmod 777 /home/pi/update

# change to this folder
cd /home/pi/update

# check if github is available
if ping -c 1 192.30.253.113 &> /dev/null
then
  echo "Github found! Updating..."
else
  echo "Github not reachable!"
  exit 1
fi

# download last files from github
sudo wget -qO- https://github.com/bildspur/heartbeat/archive/master.zip | jar xvf /dev/stdin

if [ -d ./heartbeat-master ]
  then
    echo "master downloaded, now replacing files..."
    sudo rm -r /home/pi/heartbeat-master; sudo mv heartbeat-master /home/pi/heartbeat-master
fi
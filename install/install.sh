#!/bin/bash

# install git
sudo apt-get install --yes git

# create folder and change to it
mkdir /home/pi/heartbeat-master
cd /home/pi/heartbeat-master

# create git repo
git clone git@github.com:bildspur/heartbeat.git
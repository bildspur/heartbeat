#!/bin/bash
cd /home/pi/heartbeat-master

# run processing
DISPLAY=:0 /usr/local/bin/processing-java --sketch=/home/pi/heartbeat-master/hbplayer --run
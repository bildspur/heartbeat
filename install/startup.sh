#!/bin/bash
cd /home/pi/heartbeat-master

# update
sh ./update.sh

# make it user changeable
chmod -R 777 /home/pi/heartbeat-master

# recreate file access
chmod +x /home/pi/heartbeat-master/*.sh
chmod +x /home/pi/heartbeat-master/install/*.sh
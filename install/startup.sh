#!/bin/bash
cd /home/pi/heartbeat-master/install

# set wallpaper
/bin/cp -rf system/desktop-items-0.conf /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf

# sudo echo "@sh /home/pi/heartbeat-master/run.sh" >> /etc/xdg/lxsession/LXDE/autostart
/bin/cp -rf system/autostart /home/pi/.config/lxsession/LXDE-pi/autostart

cd /home/pi/heartbeat-master

# update
sudo bash update.sh

# make it user changeable
sudo chmod -R 777 /home/pi/heartbeat-master

# recreate file access
sudo chmod +x /home/pi/heartbeat-master/*.sh
sudo chmod +x /home/pi/heartbeat-master/install/*.sh
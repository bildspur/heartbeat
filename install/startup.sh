#!/bin/bash
cd /home/pi/heartbeat-master/install

# set wallpaper
/bin/cp -rf system/desktop-items-0.conf /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf

# sudo echo "@sh /home/pi/heartbeat-master/run.sh" >> /etc/xdg/lxsession/LXDE/autostart
/bin/cp -rf system/autostart /home/pi/.config/lxsession/LXDE-pi/autostart

# setting panel settings
/bin/cp -rf system/panel /home/pi/.config/lxpanel/LXDE-pi/panels/panel

# update
sudo bash update.sh

cd /home/pi/heartbeat-master

# make it user changeable
sudo chmod -R 777 /home/pi/heartbeat-master

# recreate file access
sudo chmod +x /home/pi/heartbeat-master/*.sh
sudo chmod +x /home/pi/heartbeat-master/install/*.sh
#!/bin/bash
cd /home/pi/heartbeat-master/install

sudo apt-get install --yes gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-gst-plugins-bad
sudo apt-get install --yes gstreamer1.0-libav
sudo apt-get install --yes gstreamer1.0-omx
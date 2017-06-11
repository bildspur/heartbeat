#!/bin/bash
cd /home/pi/heartbeat-master/install

# install processing
curl https://processing.org/download/install-arm.sh | sudo sh

# install processing libraries
mkdir /home/pi/sketchbook
mkdir /home/pi/sketchbook/libraries
mkdir /home/pi/sketchbook/examples
mkdir /home/pi/sketchbook/modes
mkdir /home/pi/sketchbook/templates
mkdir /home/pi/sketchbook/tools

# video gstreamer 0.1
wget -qO- https://github.com/processing/processing-video/releases/download/latest/video.zip | jar xvf /dev/stdin | mv video /home/pi/sketchbook/libraries

# glvideo gstreamer 1.0
wget -qO- https://github.com/gohai/processing-glvideo/releases/download/latest/processing-glvideo.zip | jar xvf /dev/stdin | mv processing-glvideo /home/pi/sketchbook/libraries

# oscP5
wget -qO- https://github.com/sojamo/oscp5/releases/download/v2.0.4/oscP5-2.0.4.zip | jar xvf /dev/stdin | mv oscP5 /home/pi/sketchbook/libraries
import processing.video.*;

import oscP5.*;
import netP5.*;

Movie video;
OscP5 oscP5;

void setup()
{
  size(640, 480, P2D);

  video = new Movie(this, "pablonouvelle.mp4");

  setupOSC();
  setupZeroConf();

  //fullScreen(P2D);
}

void draw()
{
  background(0);
  loadAndShowVideo();
}

void loadAndShowVideo()
{
  if (video.available()) {
    video.read();
  }
  image(video, 0, 0, width, height);
}

void stop()
{
  stopZeroConf();
}
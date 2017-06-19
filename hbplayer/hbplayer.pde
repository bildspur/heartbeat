import gohai.glvideo.*;
import oscP5.*;
import netP5.*;

GLMovie video;
OscP5 oscP5;

boolean hasBeenPlayed = false;

void setup()
{
  //size(640, 480, P2D);
  fullScreen(P2D);

  textSize(30);
  textAlign(CENTER, CENTER);
  text("HeartbeatPi\nloading...", width/2, height/2);

  video = new GLMovie(this, "pablonouvelle.mp4", GLVideo.MUTE);

  setupOSC();
  setupZeroConf();

  noCursor();
}

void draw()
{
  background(0);
  loadAndShowVideo();

  if (!video.playing())
  {
    if (!hasBeenPlayed && address != null)
    {
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HeartbeatPi\n" + address.toString() + ":" + OSC_PORT, width/2, height/2);

      // credits
      textSize(20);
      textAlign(RIGHT, CENTER);
      text("bildspur.ch", width - 20, height - 20);
    }
  }
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
final int OSC_PORT = 8000;

void setupOSC()
{
  oscP5 = new OscP5(this, OSC_PORT);
}

void oscEvent(OscMessage msg) {
  switch (msg.addrPattern()) {

  case "/heartbeat/play":
    hasBeenPlayed = true;
    video.play();
    break;

  case "/heartbeat/pause":
    video.pause();
    break;

  case "/heartbeat/reset":
    video.jump(0);
    break;

  case "/heartbeat/jump":
    if (msg.get(0).floatValue() > 0)
    {
      video.jump(msg.get(0).floatValue() * video.duration());
    }
    break;
  }
}
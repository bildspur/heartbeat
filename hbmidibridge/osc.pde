final int OSC_PORT = 9000;

OscP5 oscP5;

void setupOSC()
{
  oscP5 = new OscP5(this, OSC_PORT);
}

void oscEvent(OscMessage msg) {
}

void play()
{
  OscMessage msg = new OscMessage("/heartbeat/play");
  sendOscMessage(msg);
}

void reset()
{
  jump(0);
}

void pause()
{
  OscMessage msg = new OscMessage("/heartbeat/pause");
  sendOscMessage(msg);
}

void jump(float position)
{
  OscMessage msg = new OscMessage("/heartbeat/jump");
  msg.add(position);
  sendOscMessage(msg);
}

void sendOscMessage(OscMessage msg)
{
  if (heartbeatDevice == null)
    return;

  NetAddress remote = new NetAddress(
    heartbeatDevice.getHostAddress(), 
    heartbeatDevice.getPort());
    
  oscP5.send(msg, remote);
}
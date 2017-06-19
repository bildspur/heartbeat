import javax.jmdns.JmDNS;
import javax.jmdns.ServiceEvent;
import javax.jmdns.ServiceListener;
import java.net.InetAddress;
import java.net.UnknownHostException;

import oscP5.*;
import netP5.*;

ServiceInfo heartbeatDevice = null;

void setup()
{
  size(600, 300, FX2D);
  surface.setTitle("Hearbeat Midibridge");

  setupOSC();
  setupJMDNS();
}

void draw()
{
  background(55);

  drawUI();
}

void keyPressed()
{
  float pos = random(0, 1);
  println("jumping to " + pos);
  jump(pos);
}
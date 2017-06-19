import javax.jmdns.JmDNS;
import javax.jmdns.ServiceEvent;
import javax.jmdns.ServiceListener;
import java.net.InetAddress;
import java.net.UnknownHostException;

ServiceInfo heartbeatDevice = null;

void setup()
{
  size(600, 300, FX2D);
  surface.setTitle("Hearbeat Midibridge");

  setupJMDNS();
}

void draw()
{
  background(55);

  drawUI();
}
import javax.jmdns.JmDNS;
import javax.jmdns.ServiceInfo;
import java.io.IOException;
import java.net.InetAddress;

JmDNS jmdns;
InetAddress address;

void setupZeroConf()
{
  try {
    PApplet.print("setting up zero conf...");
    address = getLocalHostLANAddress(); //InetAddress.getLocalHost();
    jmdns = JmDNS.create(address);
    jmdns.registerService(ServiceInfo.create("_osc._udp.", "HeartbeatPi", OSC_PORT, ""));
    PApplet.println("done!");
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void stopZeroConf()
{
  if (jmdns != null)
    jmdns.unregisterAllServices();
}
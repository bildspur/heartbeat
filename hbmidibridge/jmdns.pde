
JmDNS jmdns;

void setupJMDNS()
{
  // discover jmdns
  try {
    // Create a JmDNS instance
    jmdns = JmDNS.create(); //JmDNS.create(InetAddress.getLocalHost());

    // Add a service listener
    jmdns.addServiceListener("_osc._udp.local.", new SampleListener());

    println("Clients: ");
    for (ServiceInfo s : jmdns.list("_osc._udp.local."))
    {
      println(s.getName());
    }
  } 
  catch (UnknownHostException e) {
    System.out.println(e.getMessage());
  } 
  catch (IOException e) {
    System.out.println(e.getMessage());
  }
}


class SampleListener implements ServiceListener {
  @Override
    public void serviceAdded(ServiceEvent event) {
  }

  @Override
    public void serviceRemoved(ServiceEvent event) {
    ServiceInfo info = event.getInfo();
    if (info.getName().startsWith("HeartbeatPi"))
    {
      heartbeatDevice = null;
    }
  }

  @Override
    public void serviceResolved(ServiceEvent event) {
    System.out.println("Service resolved: " + event.getInfo());

    ServiceInfo info = event.getInfo();
    if (info.getName().startsWith("HeartbeatPi"))
    {
      heartbeatDevice = info;
    }
  }
}
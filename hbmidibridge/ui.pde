void drawUI()
{
  drawStatus();
}

void drawStatus()
{
  textSize(14);
  textAlign(LEFT, TOP);
  String text = "";

  if (heartbeatDevice == null)
    text = "Heartbeat Pi is not connected!";
  else
    text = "Heartbeat Pi: " + heartbeatDevice.getHostAddress() + ":" + heartbeatDevice.getPort();

  text(text, 20, 10);
}
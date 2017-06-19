final float MARGIN_H = 20;

void drawUI()
{
  drawTimeLine();
  drawStatus();
}

void drawTimeLine()
{
  stroke(51, 77, 92);
  fill(69, 178, 157);

  rect(MARGIN_H, height / 2 - 25, width - (MARGIN_H * 2), 50);
}

void drawStatus()
{
  noStroke();
  textSize(14);
  textAlign(LEFT, TOP);
  String text = "";

  if (heartbeatDevice == null)
  {
    fill(223, 90, 73);
    text = "Heartbeat Pi is not connected!";
  } else
  {
    fill(255);
    text = "Heartbeat Pi: " + heartbeatDevice.getHostAddress() + ":" + heartbeatDevice.getPort();
  }

  text(text, MARGIN_H, 10);
}
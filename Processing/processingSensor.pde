/* ============================================================
 Processing Version: 2.2.1
 Project: Display Sensor data on computer screen
 Author:  ScottC
 Created: 25th June 2011
 Description: This Processing sketch will allow you to display
 sensor data received from the Arduino via the
 serial COM port (or USB cable).
 =============================================================== */
import processing.serial.*;
Serial myPort;
int light;
Circle circle;


Line line1;
Line line2;
Line line3;
Line line4;

Line2 topLine;



void setup() {
  size(600, 600);
  String arduinoPort = "/dev/cu.usbmodem1421";
  myPort = new Serial (this, arduinoPort, 9600);
  myPort.bufferUntil('\n');


  circle = new Circle (300, 300);
  line1 = new Line (300, 300, 100, 300);
  line2 = new Line (300, 300, 300, 300);
  topLine = new Line2 (300, 300, 100, 300);
}

void draw() {


  background(0+(light*1.275));
  fill(light*2, 150, 150);

  String inString = myPort.readStringUntil( '\n' );

  if (inString != null )
  {
    inString = trim(inString);
    light = int(inString);
  }

  strokeWeight(2);
  stroke(light*4, 200,200);
  circle.run();
  line1.run();
  line2.run();
  topLine.run();
  


  println(light);
}  

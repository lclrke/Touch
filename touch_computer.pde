import codeanticode.syphon.*;
PGraphics canvas;
SyphonServer server;

import apsync.*; // Include the AP sync library
import processing.serial.*; //Include Processing Serial

String serialPort = "/dev/cu.usbmodem1441";

public float touch1;
public float touch2;
public float touch3;
public float touch4;
public float touch5;
public float touch6;
AP_Sync readVals;

//image
PImage spotImg;
PImage backgrnd;
PImage paintpop;
PImage painting;

//sound 
import processing.sound.*;
SoundFile file;

void setup()
{

  size(1956, 879, P3D);
  canvas = createGraphics(1956, 879, P3D);
  server = new SyphonServer(this, "Processing Syphon");


  background(0);
  readVals = new AP_Sync(this, serialPort, 9600);

  file = new SoundFile(this, "love what.mp3");
  file = new SoundFile(this, "PinkMore.mp3");
  file.play();
  file.loop();
  spotImg = loadImage("musicpopfiinal.png");
  paintpop = loadImage("macpaintpop.png");
  painting = loadImage("drawing.png");
  //backgrnd= loadImage("homefinal.png");
  backgrnd= loadImage("homebackup.png");
  backgrnd.resize(width, height);
  background(backgrnd);
}

void draw()
{
  canvas.beginDraw();
  println(abs(touch1));
  println(abs(touch2));
  println(abs(touch3));
  println(abs(touch4));
  println(abs(touch5));

  if (touch3 > 60) {
    canvas.imageMode(CENTER);
    canvas.image(spotImg, width/2, height/2, width, height);
    canvas.endDraw();
    image(canvas, 0, 0);
  }
  //play sound
  if (touch1 > 100) {
    file.amp(1);
  }  

  if (touch2> 100) {
    file.amp(0);
  }

  if (touch4 > 120) {
    canvas.background(backgrnd);
    canvas.endDraw();
    image(canvas, 0, 0);
  }
  if (touch5 > 100) {
    canvas.imageMode(CENTER);
    canvas.image(paintpop, width/2, height/2, width, height);
    canvas.endDraw();
    image(canvas, 0, 0);
  }

  if (touch6 > 100) {
    canvas.imageMode(CENTER);
    canvas.image(painting, width/2, height/2, width, height);
    canvas.endDraw();
    image(canvas, 0, 0);
  }

  server.sendImage(canvas);
}

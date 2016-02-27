import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class day50 extends PApplet {

/*== DAY 49 == [TUE JAN 26 2016] == */ //<>//
/*
 * "Learning to Flow II"
 * Still really into this effect
 */

int fCount = 15*30;

float noiseEffect = 0.8f;
float ringOffset = 0.002f;

public void setup() {
  
  frameRate(30);
  
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(4.0f);
  noFill();
}

public void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  println(frameCount);

  background(0);

  // green
  translate(width/2.0f, height/2.0f);
  rotate(radians(-120));

  float offset = 0;
  noiseSeed(8);
  float hue = 160;
  for (float rad = 40.0f; rad < 1200.0f; rad += 0.2f) {
    stroke(hue, 100, 100, 20);
    blobCircle(rad, offset);
    offset += ringOffset;
    hue += 0.09f;
  }

  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}

public void blobCircle(float rad, float ranOff) {
  beginShape();
  for (float i = 0; i < 360; i += 1) {
    float x = sin(radians(i));
    float y = cos(radians(i));

    x += noiseEffect*(noise(ranOff+x+frameCount/120.0f)-0.5f);
    y += noiseEffect*(noise(ranOff+y+frameCount/120.0f)-0.5f);

    x *= rad;
    y *= rad;

    vertex(x, y);
  }
  endShape(CLOSE);
}
  public void settings() {  size(640, 640);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "day50" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

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

public class day55_harmono_decay extends PApplet {

/*== DAY 55 == [WED MAR 2 2016] == */
/*
 * "Harmonograph - V"
 * Amplitude decay due to friction
 */

int fCount = 360;
int fDiv = 4;

float freqX = 1;
float freqY = 2;
float phi = 90;
float decay = 2;
float amp = 300;

public void setup() {
  
  
  frameRate(30);
  background(242, 92, 130);
}

public void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    // noLoop();
    // return;
  }
  // println(frameCount);

  fill(242, 92, 130, 20);
  noStroke();
  rect(0,0,width,height);

  float angle;
  float x0 = 0;
  float y0 = 0;
  boolean first = true;
  int points = width*2; // precision
  translate(width/2, height/2);

  // for (int revs = 0; revs < 12; revs++) {
    for (int i = 0; i < points; i++) {
      angle = map(i, 0, points, 0, TWO_PI);

      float x = amp * sin(angle * freqX + radians(phi));
      float y = amp * sin(angle * freqY);

      // modulate line width to approximate hand drawn lines
      float dist = dist(x0, y0, x, y);
      // if (dist > 0 && dist < 14) {
        // float weight = map(dist, 0, 3, 2.4, 1.0);
        // strokeWeight(weight);
        // stroke(
        //   map(weight, 1.0, 2.0, 0, 0),
        //   map(weight, 1.0, 2.0, 40, 60),
        //   map(weight, 1.0, 2.0, 90, 120));
      // } else {
        stroke(0,40,90);
      // }

      if (first) {
        first = false;
      } else {
        line(x0, y0, x, y);
      }

      x0 = x;
      y0 = y;
    }

    // amp -= decay;
    freqX += 0.01f * (random(1.0f) - 0.5f);
    freqY += 0.01f * (random(1.0f) - 0.5f);

    // freqX = 1+4*sin(radians(frameCount));
    // freqY = 1+3*sin(radians(frameCount));

  // video
  // saveFrame("output/frame########.png");
  // gif
  // if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
  public void settings() {  size(640, 640);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "day55_harmono_decay" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

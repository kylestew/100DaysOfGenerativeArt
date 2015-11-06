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

public class image_scan extends PApplet {

int num = 500;
float[] x = new float[num];
float[] y = new float[num];
PImage img1;
PImage img2;
float r = random(10);

public void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  background(0);

  img1 = loadImage("upclose1a.jpg");
  img2 = loadImage("dsc_7870.jpg");

  for (int i = 0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

public void draw() {
  // for (int i = 0; i < num; i++) {
  //   color c = img2.get(int(x[i]), int(y[i]));
  //   float b = brightness(c) / 255.0;
  //   float speed = random(2) * pow(b, 3) + 0.2;
  //   x[i] += speed;
  //   if (x[i] > width) {
  //     x[i] = random(width);
  //     y[i] = random(height);
  //   }
  //   // ellipse(x[i], y[i], 5, 5);
  // }

  for (int i = 0; i < num; i++) {
    int c = img2.get(PApplet.parseInt(x[i]), PApplet.parseInt(y[i]));
    float b = brightness(c) / 255.0f;
    float speed = 2* (random(10) * pow(b, 3) + 0.2f);
    y[i] += speed;
    speed = 2*( random(10) * pow(b, 3) + 0.2f);
    x[i] += speed;
    if (y[i] > height) {
      y[i] = random(width);
      x[i] = random(height);
    }
    stroke(random(255), 50);
    point(x[i], y[i]);
  }

  // saveFrame("frame-#####.png");
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "image_scan" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

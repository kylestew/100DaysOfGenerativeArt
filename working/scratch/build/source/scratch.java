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

public class scratch extends PApplet {

Ball ball;

public void setup() {
  size(600, 600);
  smooth();

  ball = new Ball();
}

public void draw() {
  background(0);

  ball.display();
}
class Ball {
  float x = 0;
  float y = 0;

  Ball() {

  }

  public void display() {
    ellipse(200, 200, 20, 20);
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "scratch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

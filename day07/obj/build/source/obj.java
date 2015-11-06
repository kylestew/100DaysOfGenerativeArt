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

public class obj extends PApplet {

PShape s;
float yRot;
float zRot;

public void setup() {
  size(900, 900, P3D);
  frameRate(30);

  // s = loadShape("cube.obj");
  s = loadShape("satrun2.obj");

  yRot = 0f;
  zRot = 0f;

}

public void draw() {
  background(0);

  ambientLight(0, 0, 255);
  spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);

  // camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  translate(width/2, height/2, -100);

  rotateY(yRot);
  yRot = yRot + 0.05f;
  rotateZ(zRot);
  zRot = zRot + 0.01f;

  // geometry is unitized
  // scale(width*0.2f, width*0.2f, width*0.2f);

  shape(s, 0, 0);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "obj" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

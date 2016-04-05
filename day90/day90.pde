/*== DAY 90 == [FRI APR 8 2016] == */
/*
 * "Happy Spinny Things"
 * On a minimal kick, inspired by FLRN GIF (http://gif.flrn.nl).
 */
int fCount = 3*30+8;
int fDiv = 1;

color backColor = #222222;
color foreColor = #eeeeee;
float rad = 48.0;
float space = 12.0;
float thick = 6.0;
float count = 7;

PImage back;

void setup() {
  size(640, 640);
  smooth(3);
  frameRate(30);
  
  back = loadImage("back.png");

  noStroke();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  //println(frameCount);
  
  background(backColor);
  pushMatrix();

  translate(width/2, height/2);
  float offset = space + rad;
  translate(-offset*(int)(count / 2), -offset*(int)(count / 2));
  
  float swing = map(frameCount, 0, fCount, 0, TWO_PI);
  
  for (int i = 0; i < count; i++) {
    pushMatrix();
    float off1 = map(i, 0, count, 0, PI/2);
    for (int j = 0; j < count; j++) {
      float off2 = map(j, 0, count, 0, PI/4.0);
      
      fill(foreColor);
      ellipse(0, 0, rad, rad);
      
      fill(backColor);
     arc(0, 0, rad-thick, rad-thick, 0+swing+off2+off1, PI+swing+off2+off1);
    
      translate(offset, 0);
    }
    popMatrix();
    translate(0, offset);
  }


  popMatrix();
  blendMode(SCREEN);
  blendMode(LIGHTEST);
  image(back, 0, 0);
  

  // video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
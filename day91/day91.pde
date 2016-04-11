/*== DAY 92 == [SUN APR 10 2016] == */
/*
 * "This is not Real"
 * On a minimal kick, inspired by FLRN GIF (http://gif.flrn.nl).
 */
int fCount = 3*30;
int fDiv = 1;

PImage back, back2;
color backColor = #eeeeee;
color foreColor = #000000;
int lines = 12;
float weight = 42;

void setup() {
  size(640, 640);
  smooth(3);
  frameRate(30);
  
  back = loadImage("back.png");
  back2 = loadImage("back2.png");
  noStroke();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  // draw backgrounds
  image(back, 0, height/2);
  image(back2, 0, -height/2);

  // draw lines
  translate(width/2, height/2);
  translate(-weight*((lines-1)/2.0)+weight/4.0, 0);
  fill(backColor);
  blendMode(EXCLUSION);
  float yOff = map(frameCount, 0, fCount, 0, TWO_PI);
  for (int i = 0; i < lines; i++) {
    float y = 200*sin(yOff+map(i,0,lines,0,PI/1.0));
    rect(-weight/2, -80+y, weight/2, 160-y*2.0); 
    translate(weight, 0);
  }
  

  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
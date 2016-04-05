/*== DAY 91 == [SAT APR 9 2016] == */
/*
 * "???"
 * On a minimal kick, inspired by FLRN GIF (http://gif.flrn.nl).
 */
int fCount = 3*30;
int fDiv = 1;

PImage back, back2;
color backColor = #eeeeee;
color foreColor = #000000;
float rad;
//float space = 12.0;
//float thick = 6.0;
//float count = 7;

void setup() {
  size(640, 640);
  smooth(3);
  frameRate(30);
  
  back = loadImage("back.png");
  back2 = loadImage("back2.png");
  noStroke();
  
  rad = width*0.6;
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

  // backdrop circle
  fill(foreColor);
  ellipse(0, 0, rad, rad);
  
  noFill();
  stroke(backColor);
  strokeWeight(12);
  
  
  // ???
  float r = map(frameCount, 0, fCount, 0, rad);
  
  ellipse(0, 0, r, r);


  // give it some texture
  popMatrix();
  blendMode(LIGHTEST);
  image(back, 0, 0);
  blendMode(MULTIPLY);
  image(back2, 0, 0);
  

  // video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
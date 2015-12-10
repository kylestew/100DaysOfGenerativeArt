/*== DAY 36 == [WED DEC 8 2015] == */ //<>//
/*
 * "A Study In Ellipses - I"
 * Non-square ellipses look like 3d rings sometimes
 */

int fCount = 180*2;
int fDiv = 4;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30);  
  background(0);
}

float count = 9;
float radius = 400;

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  println(frameCount);
  
  //background(0);
  fill(0, 80);
  noStroke();
  rect(0,0,width,height);
  
  noFill();
  stroke(255);
  strokeWeight(2);
  
  translate(width/2, height/2);
  
  for (int i = 0; i < count; i++) {
    float dim = (i*50*sin(radians(frameCount)));
    
    rotate(sin(radians(frameCount)));
    
    ellipse(0, 0, radius - dim, radius);
  }
  


  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
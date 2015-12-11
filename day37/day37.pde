/*== DAY 37 == [THR DEC 8 2015] == */ //<>//
/*
 * "A Study In Ellipses - II"
 * Nucleur revolutions
 */

int fCount = 82;
int fDiv = 2;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30);  
  background(0);
}

float count = 5;
float radius = 500;
float spread = 0;

void draw() {
  if (frameCount > fCount) {
   frameCount = 0;
   noLoop();
  }
  println(frameCount);
  
  colorMode(RGB);
  //background(0);
  fill(0, 90);
  noStroke();
  rect(0,0,width,height);
  
  noFill();
  stroke(255);
  strokeWeight(12);
  
  colorMode(HSB);
  translate(width/2, height/2);
  rotate(radians(frameCount*4.4/2.0));
  for (int i = 0; i < count; i++) {
    float dim = frameCount*12;
    float rad = radius - i*spread;
    
    float hue = frameCount;
    if (hue > fCount/2.0)
      hue = fCount - hue;
    hue = hue/2.0 + 190.0;
    stroke(hue, 255, 255);
    
    rotate(PI/4.0*i);
    ellipse(0, 0, rad-dim, rad);
  }
  

  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
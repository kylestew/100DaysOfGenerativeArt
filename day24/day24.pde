/*== DAY 24 == [WED NOV 25 2015] == */ //<>//
/*
 * "Spec Tunnel"
 * ...
 */

int fStart = 0;
int fCount = 60*4;
int fDiv = 2;

float innerRadius = 60.0f;

void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);
  
  colorMode(RGB);
  background(40);
}

void draw() {
  //if (frameCount == fStart) { frameCount = 0; fStart = -1; }; // video capture
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  println(frameCount);
  
  colorMode(RGB);
  fill(40, 60);
  noStroke();
  rect(0, 0, width, height);
  
  int fc = frameCount;
  if (fc > (fCount/2.0))
    fc = fCount-frameCount;
  println(fc);
  
  colorMode(HSB);
  stroke(255);
  strokeWeight(12);  
  translate(width/2, height/2);
  for (float angle = 0; angle < 360.0; angle += 4.0) {
    float rad = innerRadius + noise(fc/12.0+angle) * 320.0;
    stroke(rad, 255, 255);

    float x = rad*sin(radians(angle));
    float y = rad*cos(radians(angle));
    
    point(x, y);
  }


  //// video
  //if (frameCount >= fStart) saveFrame("output/frame########.png");
  // gif
  //if (frameCount >= fStart && frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
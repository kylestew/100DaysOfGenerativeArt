/*== DAY 26 == [FRIE NOV 27 2015] == */ //<>//
/*
 * "..."
 * 
 */

int fStart = 0;
int fCount = 50*4+4;
int fDiv = 1;

void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);

  //colorMode(RGB);
  stroke(0);
  strokeWeight(10);
  noFill();
}

void draw() {
  //if (frameCount == fStart) { frameCount = 0; fStart = -1; }; // video capture
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  //println(frameCount);

  background(255);
  strokeWeight(10);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  
  float tall = 32.0;
  float spread = 64.0;
  float walk = frameCount/8.0;

  // draw lines
  pushMatrix();
  translate(width/2.0, 0);
  for (float yOff = 130.0; yOff < height-120; yOff+=spread) {
    for (float i = -width*0.35; i < width*0.35; i+=1.0) {
      float y = tall * sin(i/tall*1.8+walk) + yOff;
      
      point(i, y);
    }
  }
  popMatrix();
  
  // mask output
  strokeWeight(32);
  stroke(0);
  rect(0, 0, width, height);

  //// video
  if (frameCount >= fStart) saveFrame("output/frame########.png");
  // gif
  //if (frameCount >= fStart && frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
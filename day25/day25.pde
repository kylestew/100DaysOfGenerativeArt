/*== DAY 25 == [THURS NOV 26 2015] == */ //<>//
/*
 * "???"
 * ...
 */

int fStart = 0;
int fCount = 60*4;
int fDiv = 2;


void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);
  
  colorMode(RGB);
  background(40);
}

void draw() {
  //if (frameCount == fStart) { frameCount = 0; fStart = -1; }; // video capture
  //if (frameCount > fCount) {
    //frameCount = 0;
    //noLoop();
  //}
  //println(frameCount);
  



  //// video
  //if (frameCount >= fStart) saveFrame("output/frame########.png");
  // gif
  //if (frameCount >= fStart && frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
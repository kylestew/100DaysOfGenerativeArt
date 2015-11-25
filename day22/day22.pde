/*== DAY 22 == [MON NOV 23 2015] == */ //<>//
/*
 * "Harmonic Colors"
 * Harmonic motion plus color shifting
 * http://www.openprocessing.org/sketch/202028
 */

int fStart = 60;
//int fCount = 60*2; // gif
int fCount = 60+(60*4); // vid
int fDiv = 2; // ~56 frames for GIF

float angle = 0;
float sweep = 9.5;
float sweepTime = 30; // 1FPS per half rad
float colorSweep = 5.0;
float rad = 230;
float size = 30;

void setup() {
  size(640, 640);
  frameRate(30);
  
  strokeWeight(6);
  background(30);
}

void draw() {
  if (frameCount == fStart) { frameCount = 0; fStart = -1; }; // video capture
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  //println(frameCount);
  
  noStroke();
  colorMode(RGB);
  fill(30, 30);
  rect(0,0,width,height);
  
  stroke(30);
  colorMode(HSB);
  fill(angle*colorSweep + 120, 255, 255, 255);
  
  translate(width/2, height/2);
  rotate(radians(sweep*angle));
  angle += sin(radians(frameCount*180.0/30));
  
  rect(-rad, -size/2.0, rad*2, size);

  rotate(radians(-90));
  rect(-rad, -size/2.0, rad*2, size);
  
  colorMode(RGB);
  fill(0);
  ellipse(0, 0, 8, 8);

  //// video
  //if (frameCount >= fStart) saveFrame("output/frame########.png");
  // gif
  //if (frameCount >= fStart && frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
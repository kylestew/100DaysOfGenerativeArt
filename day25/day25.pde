/*== DAY 25 == [THURS NOV 26 2015] == */ //<>//
/*
 * "Not a Turkey"
 * It was going to be though, but oh well
 */

int fStart = 0;
int fCount = 359;
int fDiv = 5;


void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);

  colorMode(RGB);
  stroke(0);
  strokeWeight(4);
}

void feather(float angle, float sweep, float radius) {
  float x0 = radius*sin(radians(angle));
  float y0 = radius*cos(radians(angle));
  float x1 = radius*sin(radians(angle+sweep));
  float y1= radius*cos(radians(angle+sweep));
  float cX = 1.1*radius*sin(radians(angle+sweep/2));
  float cY= 1.1*radius*cos(radians(angle+sweep/2));

  beginShape();
  vertex(0, 0);
  vertex(x0, y0);
  bezierVertex(x0, y0, cX, cY, x1, y1);

  endShape(CLOSE);
}

void draw() {
  //if (frameCount == fStart) { frameCount = 0; fStart = -1; }; // video capture
  if (frameCount > fCount) {
  //frameCount = 0;
    noLoop();
  }
  println(frameCount);

  background(255);

  translate(width/2.0, height/2.0);  
  
  float sweep = 90-frameCount*2;
  float angle;
  float radius = 20+frameCount*2;

  fill(0, 190);
  angle = 0-sweep/2.0;
  feather(angle, sweep, radius);
  angle = 180-sweep/2.0;
  feather(angle, sweep, radius);

  fill(#FF586E, 190);
  angle = 90-sweep/2.0;
  feather(angle, sweep, radius);
  angle = 270-sweep/2.0;
  feather(angle, sweep, radius);


  //// video
  //if (frameCount >= fStart) saveFrame("output/frame########.png");
  // gif
  if (frameCount >= fStart && frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
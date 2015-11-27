/*== DAY 27 == [SAT NOV 28 2015] == */ //<>//
/*
 * "Trust Your Instincts"
 * Unless your instincts are terrible
 */

int fStart = 0;
int fCount = 44*4+4;
int fDiv = 1;

void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);

  background(60);
  noStroke();
  colorMode(HSB);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  println(frameCount);

  background(60);
  
  float cellSize = width/16.0;
  float step = frameCount*8.0;
  
  for (int y = 0; y < height; y+=cellSize) {
    for (int x = 0; x < width; x+=cellSize) {
      float x0 = x + cellSize/2.0;
      float y0 = y + cellSize/2.0;
      
      // determine val based on distance from center
      float dist = dist(x0, y0, width/2.0, height/2.0);
      
      float hue = map(dist, 0, width*0.9, 0, 360);
      fill(hue, 255, 255, 255);
      
      dist += step;
      float val = sin(radians(dist));
      val = map(val, -1, 1, 0, 1);
      float rad = map(val, 0, 1, 0, 24.0);
      
      ellipse(x0, y0, rad, rad);
    }
  }

  //// video
  if (frameCount >= fStart) saveFrame("output/frame########.png");
  // gif
  //if (frameCount >= fStart && frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
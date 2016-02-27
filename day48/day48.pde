/*== DAY 48 == [MON JAN 24 2016] == */ //<>//
/*
 * "Study in Blending"
 * Rediscovering the joy of blend modes
 */
 
int fCount = 180;
int fDiv = 3;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30); 
  
  noStroke();
  colorMode(RGB, 255, 255, 255, 100);
  
  blendMode(SUBTRACT);
}

int count = 8;
int rings = 2;
float spread = 160.0;
float size = 220.0;
float speed = 2;
float rot = 0;
float tick;

void drawTriangleInRect(boolean reverse, float angle, float cx, float cy, float w, float h) {
  float x0 = cx;
  float y0 = cy-w/2.0;
  float x1 = cx+w/2.0;
  float y1 = cy+h/2.0;
  float x2 = cx-w/2.0;
  float y2 = cy+h/2.0;
  
  pushMatrix();
  translate(cx,cy);
  rotate(radians(reverse ? -tick : tick));
  translate(-cx,-cy);

  triangle(x0, y0, x1, y1, x2, y2);
  
  popMatrix();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
  noLoop();
  }
  println(frameCount);
  
  background(255);
  
  float radDel = 360.0/count;
  translate(width/2.0, height/2.0);
  for (int r = 0; r < rings; r++) {
    for (int i = 0; i < count*(r+1); i++) {
      float rad = i*radDel;
      
      if ((i+r) % 2 == 0) 
        fill(60,255,60, 100);
      else
        fill(255,60,60, 100);
      
      rectMode(CENTER);
      drawTriangleInRect(r%2 != 0, rad+90, (r+1)*spread, 0, size, size);
      rotate(radians(radDel));
    }
  }
  tick = frameCount * speed;

  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
/*== DAY 43 == [FRI DEC 18 2015] == */
/*
 * "A Study in Triangles - IV"
 * Now you're thinking with portals
 */

int fCount = 180;
int fDiv = 2;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30); 
  
  noStroke();
  colorMode(HSB);
}

int count = 8;
int rings = 1;
float spread = 160.0;
float size = 160.0;
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
  
  background(0);
  
  float radDel = 360.0/count;
  translate(width/2.0, height/2.0);
  for (int r = 0; r < rings; r++) {
    for (int i = 0; i < count*(r+1); i++) {
      float rad = i*radDel;
      
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
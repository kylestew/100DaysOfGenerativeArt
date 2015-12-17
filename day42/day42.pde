/*== DAY 42 == [THR DEC 17 2015] == */
/*
 * "A Study in Triangles - III"
 * ...
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

int grid = 8;
float speed = 2;
float rot = 0;

void drawTriangleInRect(boolean flip, float x, float y, float w, float h) {
  float x0 = x+w/2.0;
  float y0 = y;
  float x1 = x+w;
  float y1 = y+h;
  float x2 = x;
  float y2 = y+h;
  
  if (flip) {
    x0 = x;
    y0 = y;
    x1 = x+w;
    y1 = y;
    x2 = x+w/2.0;
    y2 = y+h;
  }
  
  pushMatrix();
  translate(x+w/2.0,y+h/2.0);
  rotate(flip ? rot : -rot);
  translate(-(x+w/2.0),-(y+h/2.0));

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
  
  float size = width/grid;
  for (int row = -1; row <= grid; row++) {
    for (int col = -1; col <= grid; col++) {
      drawTriangleInRect(col%2==0, col*size, row*size, size, size);
    }
  } 
  rot += sin(radians(frameCount))/18.22;


  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
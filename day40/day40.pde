/*== DAY 40 == [MON DEC 14 2015] == */
/*
 * "A Study in Triangles - I"
 * Recursive triangles - recursion is slow
 */

int fCount = 180;
int fDiv = 2;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30); 
  
  noStroke();
  fill(44);
}

int maxDepth = 4;

void drawTriangle(int depth, float x, float y, float width, float height) {
  if (depth > maxDepth)
    return;
    
  // top point, clockwise
  float x0 = x+width/2.0;
  float y0 = y;
  float x1 = x+width;
  float y1 = y+height;
  float x2 = x;
  float y2 = y+height;
  
  // only draw on deepest recurse
  if (depth == maxDepth)
    triangle(x0, y0, x1, y1, x2, y2);
 
  // top
  drawTriangle(depth+1, x+width/4.0, y, width/2.0, height/2.0);
  // bottom left
  drawTriangle(depth+1, x, y+height/2.0, width/2.0, height/2.0);
  // bottom right
  drawTriangle(depth+1, x+width/2.0, y+height/2.0, width/2.0, height/2.0);
}

void draw() {
  if (frameCount > fCount) {
  frameCount = 0;
    noLoop();
  }
  println(frameCount);
  
  background(255);
  
  maxDepth = (int)abs(round(12.0*sin(radians(frameCount))));
  drawTriangle(0, 40, 80, width-80, height-160);


  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
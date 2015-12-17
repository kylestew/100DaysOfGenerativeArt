/*== DAY 40 == [MON DEC 14 2015] == */
/*
 * "A Study in Triangles - II"
 * Recursion to the next level
 */

int fCount = 180;
int fDiv = 1;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30); 
  
  noStroke();
  colorMode(HSB);
}

int walk = 0;
int maxDepth = 0;

void drawTriangle(int depth, float x, float y, float width, float height) {
  // top point, clockwise
  float x0 = x+width/2.0;
  float y0 = y;
  float x1 = x+width;
  float y1 = y+height;
  float x2 = x;
  float y2 = y+height;

  // roll the dice and see if this is where we end the recursion
  float n = noise(walk++);
  if ((depth > 2 && n > 0.6) || depth > maxDepth) {
    
    fill(n * 190.0, 255, 255);
    
    triangle(x0, y0, x1, y1, x2, y2);
    return;
  }
 
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
  
  background(0,0,0);
  
  maxDepth = (int)abs(round(7.0*sin(radians(frameCount))));
  
  walk = 0;
  noiseSeed(0);
  drawTriangle(0, 60, 60, width-120, height-120);
  
  translate(width/2.0, height/2.0);
  rotate(radians(180));
  translate(-width/2.0, -height/2.0);
  drawTriangle(0, 60, 60, width-120, height-120);
    
  //noLoop();

  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
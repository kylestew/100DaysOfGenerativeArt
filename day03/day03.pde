/*== DAY 03 == [TUE NOV 3 2015] == */
/*
 * "Auto Deco"
 * Multiple squares running rotate/shrink cycles in their grid space.
 */

boolean running = true;

float cells = 4;
float cellWidth;
float rotSpeed = 0.801;
float shrinkSpeed = 6.79;
float size;
int clr = 0;
int maxFrame = 48*4;

void setup() {
  size(640, 640);
  smooth();
  background(255);
  rectMode(CENTER);
  
  frameRate(30);
  
  cellWidth = width/cells;
  size = cellWidth;
}

void draw() {
  if (frameCount > maxFrame)
    return;
  //if (!running)
   //return;
    
  // shrink sized based on frame count * shrink constant
  size -= shrinkSpeed;
  if (abs(size) >= cellWidth)
    size = cellWidth;
    
  // stop when we are back to our original size
  //if (abs(size) >= cellWidth) {
    //running = false;
    //print(frameCount);
    //return;
  //}
  
  strokeWeight(2);
  stroke(color(#7874A6));
  //fill(255,255,255,33);
  strokeJoin(ROUND);
  
  for(int col = 0; col < cells; col++) {
    for(int row = 0; row < cells; row++) {
      float x = cellWidth*col + cellWidth/2;
      float y = cellWidth*row + cellWidth/2;
      
      pushMatrix();
      translate(x,y);
      rotate(frameCount * rotSpeed);
      rect(0, 0, size, size);
      popMatrix();
    }
  }
  
  //// video
  saveFrame("output/frame########.png");
  //// gif
  //if (frameCount % 2 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
/*== DAY 31 == [THR DEC 3 2015] == */ //<>//
/*
 * ""
 * ...
 */

int fCount = 160;
int fDiv = 4;

void setup() {
  size(640, 640);
  //smooth(8);
  frameRate(30);  
  
  noStroke();
}

//float easeOutQuad(float t, float b, float c, float d) {
//  t /= d;
//  return -c * t*(t-2) + b;
//}
//float easeInQuad(float t, float b, float c, float d) {
//  t /= d;
//  return c*t*t + b;
//} 
//float easeInOutQuad(float t, float b, float c, float d) {
//  t /= d/2;
//  if (t < 1) return c/2*t*t + b;
//  t--;
//  return -c/2 * (t*(t-2) - 1) + b;
//} 

void draw() {
  //if (frameCount > fCount) {
    //frameCount = 0; 
  //noLoop();
  //}
  //println(frameCount);

  background(255);
  
  float cell = width/8.0;
  for (int col = 0; col < 8; col++) {
    for (int row = 0; row < 8; row++) {
      float x = row*cell + cell/2.0;
      float y = col*cell + cell/2.0;
      
      drawLiftedCircle(x, y, width*0.5, 12.0);
    }
  }
  
  //drawLiftedCircle(width/2.0 - 100, height/2.0, 80.0, 6.0);
  
  float dist = sin(radians(frameCount*4.0)) * 64.0;
  
  drawLiftedCircle(width/2.0, height/2.0, 80.0, dist);
  //drawLiftedCircle(width/2.0 + 100, height/2.0, 80.0, 24.0);
  

  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

void drawLiftedCircle(float x, float y, float radius, float height) {
  if (height < 0)
    height = 0;
  
  x = x-height;
  y = y-height;
  
  for (float i = height; i > 0; i--) {
    fill(20+i*2.5, 40+i*4, 40+i*4, 255);
    ellipse(x+i, y+i, radius-0.5, radius-0.5);
  }
  
  fill(255);
  ellipse(x, y, radius, radius);
}
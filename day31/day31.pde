/*== DAY 31 == [THR DEC 3 2015] == */ //<>//
/*
 * "Extrusions"
 * Inspired by a gif loop coder post
 */

int fCount = 60;
int fDiv = 2;

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
  if (frameCount > fCount) {
    frameCount = 0; 
  noLoop();
  }
  println(frameCount);

  background(255);
  
  float count = 8;
  float inset = 0;
  float cell = (width-inset)/count;
  for (int col = 0; col < count; col++) {
    for (int row = 0; row < count; row++) {
      float x = inset/2.0 + row*cell + cell/2.0;
      float y = inset/2.0 + col*cell + cell/2.0;
      
      //float dist = sin(radians(step + frameCount*4.0)) * 32.0 + 24.0;
      
      float dist = dist(width/2.0, height/2.0, x, y);
      dist = sin(radians(dist-frameCount*6.0)) * 18.0 + 16.0;

      drawLiftedCircle(x, y, cell*0.6, dist);
    }
  }
  

  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
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
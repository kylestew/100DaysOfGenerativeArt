/*== DAY 29 == [TUE DEC 1 2015] == */ //<>//
/*
 * "Raindrops"
 * Rain drop inspired design
 * https://www.instagram.com/p/-kbkA2zdVK/
 */

int fCount = 160;
int fDiv = 4;

void setup() {
  size(640, 640);
  //smooth(8);
  frameRate(30);  
  
  strokeWeight(2);
  noFill();
}

float easeOutQuad(float t, float b, float c, float d) {
  t /= d;
  return -c * t*(t-2) + b;
}
float easeInQuad(float t, float b, float c, float d) {
  t /= d;
  return c*t*t + b;
} 
float easeInOutQuad(float t, float b, float c, float d) {
  t /= d/2;
  if (t < 1) return c/2*t*t + b;
  t--;
  return -c/2 * (t*(t-2) - 1) + b;
} 

void draw() {
  if (frameCount > fCount) {
    frameCount = 0; 
  noLoop();
  }
  //println(frameCount);

  background(#2b2b2b);
  
  translate(width/2.0, height/2.0+20);
  
  float starting = 24.0;
  float spread = 6.0;
  float delay = 12.0;
  
  for (int n = 0; n < 4; n++) {
    pushMatrix();
    rotate(radians(-90*n-45));
    translate(140.0, 0);
    
    float del = delay*n;
    if (frameCount > del) {
      float step = easeOutQuad(frameCount-del, 0, 55, 300-del);
      float rad0 = starting * step/2.0;
      
      // fade out quicker at the end
      float opaKill = 0;
      if (frameCount > 100)
        opaKill = frameCount - 100;
      
      println(opaKill);
      
      for (int i = 0; i < 8; i++) {
        float rad = rad0 + i * step * spread;
        float opa = 255.0 - map(rad, 0, width, 0, 255);
        stroke(#eeeeee, opa-opaKill*2);
        ellipse(0, 0, rad, rad);  
      }
    }
      
    popMatrix();
  }

  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
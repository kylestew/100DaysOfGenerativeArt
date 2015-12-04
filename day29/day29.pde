/*== DAY 28 == [SUN NOV 29 2015] == */ //<>//
/*
 * "Circular Tranquility"
 * Inspired by an IG piece, multiple rippled circles
 * https://www.instagram.com/p/-kbkA2zdVK/
 */

int fCount = 220;
int fDiv = 5;

float starting = 24.0;
float spread = 6.0;

void setup() {
  size(640, 640);
  //smooth(8);
  frameRate(30);  
  
  strokeWeight(2);
  noFill();
}

float easeInExpo(float t, float b, float c, float d) {
  return c * pow( 2, 10 * (t/d - 1) ) + b;
}

void draw() {
  if (frameCount > fCount) {
  frameCount = 0;
  noLoop();
  }
  //println(frameCount);

  background(#2b2b2b);
  
  // first 100 frames out
  
  // next 200 frames in
  float step;
  if (frameCount < 40) 
    step = easeInExpo(frameCount, 0, 30, 40);
  else
    step = 20 - easeInExpo(frameCount, 0, 30, 180);
  println(step);
  
  float rad0 = starting * step/2.0;
  for (int n = 0; n < 3; n++) {
    pushMatrix();
    
    translate(width/2.0, height/2.0+20);
    rotate(radians(-90*n));
    translate(120.0, 0);
    
    for (int i = 0; i < 8; i++) {
      float rad = rad0 + i * step * spread;
      float opa = 255.0 - map(rad, 0, width, 0, 255);
      stroke(#eeeeee, opa);
      ellipse(0, 0, rad, rad);  
    }
    
    popMatrix();
  }
  
  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
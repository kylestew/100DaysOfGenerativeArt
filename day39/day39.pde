/*== DAY 39 == [SAT DEC 12 2015] == */ //<>//
/*
 * "A Study In Ellipses - IV"
 * Color wheel with mixing
 */

int fCount = 120-1;
int fDiv = 2;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30); 
  
  background(44);
  colorMode(HSB);
  stroke(255);
  strokeWeight(3);
}

float count = 6;
float rad = 128;
float baseRad = 260;

void draw() {
  if (frameCount > fCount) {
   frameCount = 0;
     noLoop();
  }
  println(frameCount);
  
  background(44);

  float angleStep = 360/count;
  translate(width/2, height/2);
  
  // TODO: rot period
  rotate(1.1*sin(radians(frameCount*3)));
  
  float hue = -90;
  for (int i = 0; i < count; i++) {
    rotate(radians(angleStep));
    
    float size = baseRad + 164*sin(radians(frameCount*3));
    
    hue += angleStep;
    fill(hue, 255, 255, 290-size/2);
    
    ellipse(rad, 0, size, size);
  }
  

  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
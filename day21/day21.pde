/*== DAY 21 == [SUN NOV 22 2015] == */ //<>//
/*
 * "Lite Bright Nightmare"
 * Circular rad growth animation
 */

int fCount = 360;
int fDiv = 6; // ~56 frames for GIF

float radStart = 0.0f;
float radEnd = 300.0f;
float angleStep = 29.0;
float angleStepBase = 29.0;
float radGrowth = 0.6f;

void setup() {
  size(640, 640);
  //smooth(8);
  
  frameRate(30);
  
  noStroke();
}

void draw() {
  if (frameCount > fCount) {
   frameCount = 0;
   noLoop();
  }
  println(frameCount);
  
  colorMode(RGB);
  background(50);
    
  float angle = 0;
  
  // sweep clockwise until we fill the screen
  colorMode(HSB, radEnd-radStart, 255, 255, 255);
  translate(width/2.0, height/2.0);
  for (float radius = radStart; radius < radEnd; radius += radGrowth) {
    angle += angleStep;
    
    fill(radEnd - radius, 255, 255, 255);

    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));
    
    float circleRad = 10.0 + radius/14.0;
    ellipse(x, y, circleRad, circleRad);
  }
  
  angleStep = angleStepBase + sin(radians(frameCount))/2.0;


  //// video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
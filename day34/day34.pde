/*== DAY 34 == [MON DEC 7 2015] == */ //<>//
/*
 * "Breathing Gradients"
 * Filled circles trailing sine growth
 */

int fCount = 300;
int fDiv = 6;

float hue = 360.0;

void setup() {
  size(640, 640);
  smooth(8);
  frameRate(30);  
  
  colorMode(HSB, 300, 255, 255, 255);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0; 
    noLoop();
  }

  background(40);
  
  noStroke();
  
  translate(width/2.0, height/2.0);
  for (int i = 0; i < 12; i++) {
    float hue = frameCount+(i*14);
    if (hue > 300)
      hue -= 300;
    fill(hue, 255, 255, 100);    
    
    float rad = width*0.9*sin(radians(frameCount*1.2+i*6));
    ellipse(0, 0, rad, rad);
  }

  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
/*== DAY 20 == [SAT NOV 21 2015] == */ //<>//
/*
 * "Back to Basics"
 * Sin/Cos movement
 * http://www.openprocessing.org/sketch/159462
 */

int fCount = 90*4;

float xoff;

void setup() {
  size(640, 640);
  smooth(4);
  
  frameRate(30);
  
  noStroke();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  
  background(255);
  
  float rad1 = sin(radians(frameCount*2))*200;
  float rad2 = rad1/3;
  
  fill(255, 0, 0, 128);
  translate(width/2.0, height/2.0);
  rotate(radians(frameCount*3));
  for (int i = 0; i < 360; i+=45) {
    float x = sin(radians(i)) * rad1;
    float y = cos(radians(i)) * rad1;
    ellipse(x,y,rad2*2,rad2*2);
  }
  
  fill(0, 255, 0, 128);
  rad1 = abs(sin(radians(frameCount*2-10)))*200;
  rad2 = rad1/3;
  for (int i = 0; i < 360; i+=45) {
   float x = sin(radians(i)) * rad1;
   float y = cos(radians(i)) * rad1;
   ellipse(x,y,rad2*2,rad2*2);
  }
  
  fill(0, 0, 255, 128);
  rad1 = abs(sin(radians(frameCount*2-20)))*200;
  rad2 = rad1/3;
  for (int i = 0; i < 360; i+=45) {
  float x = sin(radians(i)) * rad1;
  float y = cos(radians(i)) * rad1;
  ellipse(x,y,rad2*2,rad2*2);
  }


  //// video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
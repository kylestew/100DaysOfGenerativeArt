/*== DAY 20 == [SAT NOV 21 2015] == */ //<>//
/*
 * ""
 * ???
 */

int fCount = 340;
int fRate = 30;

int segmentCount;
float radius;

void setup() {
  size(640, 640);
  //smooth(0);
  
  frameRate(2);
  
  radius = width*0.4;
  segmentCount = 3;
  
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  //if (frameCount > fCount) 
  //  return;
  //println("frame: " + frameCount);


  background(360);
  
  float angleStep = 360/segmentCount;
  
  beginShape(TRIANGLE_FAN);
  vertex(width/2, height/2);
  for (float angle = 0; angle <= 360; angle += angleStep) {
    //float vx = width/2 + cos(radians(angle))*radius;
    //float vy = height/2 + sin(radians(angle))*radius;
    //vertex(vx, vy);
    //fill(angle, 100, 100);
  }
  endShape();

  //rectMode(CENTER);
  //noStroke();
  //background(mouseY/2, 100, 100);
  
  //fill(360-mouseY/2, 100, 100);
  //rect(360, 360, mouseX+1, mouseX+1);


  //// video
  //saveFrame("output/frame########.png");
  //// gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
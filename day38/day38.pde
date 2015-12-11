/*== DAY 38 == [FRI DEC 8 2015] == */ //<>//
/*
 * "A Study In Ellipses - III"
 * 
 */

int fCount = 60;
int fPreLoop = 4;
int fDiv = 1;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  frameRate(30); 
  
  background(0);
}

float radius = 500;
float spread = 64;

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    if (fPreLoop == 0)
      noLoop();
    fPreLoop--;
  }
  
  fill(0, 50);
  //background(33, 66, 66);  // gif
  noStroke();
  rect(0,0,width,height);
  
  noFill();
  stroke(255);
  
  for (float rad = 0; rad < radius; rad += spread) {
    float dim = sin(radians(rad-frameCount*6));
    float weight = map(dim, -1, 1, 4, spread/3.0);
    strokeWeight(weight);
    stroke(map(weight, 2, spread/2.0, 255, 255), 255);
    
    ellipse(width/4.0, height/4.0, rad, rad);
    ellipse(3*width/4.0, height/4.0, rad, rad);
    ellipse(3*width/4.0, 3*height/4.0, rad, rad);
    ellipse(width/4.0, 3*height/4.0, rad, rad);
  }
  

  //// video
  //if (frameCount >= 0 && fPreLoop == 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
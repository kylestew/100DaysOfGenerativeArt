/*== DAY 72 == [SUN MAR 20 2016] == */
/*
 * "Wobbly"
 * Practicing my GIF loop-fu
 */
int fCount = 4*30;
int fDiv = 2;

int generations = 3;
float genRot = TWO_PI/24.0;
float genShrink = 0.9;
float rad = 128.0;
float offCenter = 32.0;
float radStep = TWO_PI/12.0;

void setup() {
  size(640, 640);
  smooth();
  frameRate(30);
  
  stroke(222,222,222);
  strokeWeight(1.4);
  noFill();
}

void draw() {
  if (frameCount > fCount) {
   frameCount = 0;
   noLoop();
   return;
  }
  //println(frameCount);
  
  colorMode(RGB, 255, 255, 255);
  
  background(14,14,14);
  
  colorMode(HSB, 360, 1, 1, 1);
  float hue = 240;

  float angle = map(frameCount, 0, fCount, 0, TWO_PI);
  translate(width/2, height/2);
  for (int j = 0; j < generations; j++) {
    rotate(genRot);
    scale(genShrink, genShrink);
    
    hue += degrees(genRot*1.2);
    stroke(hue, 1, 1, 1.0);
    
    pushMatrix();
    for (float i = 0; i < 360; i += radStep) {
      rotate(radStep);
      
      pushMatrix();
      
      translate(offCenter+rad,0);
      if (j % 2 == 0)
        rotate(angle);
      else
        rotate(-angle);
      
      ellipse(0,0,rad*2,rad);
      
      popMatrix();
    }
    popMatrix();
  }


  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
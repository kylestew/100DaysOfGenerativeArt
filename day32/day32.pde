/*== DAY 32 == [FRI DEC 4 2015] == */ //<>//
/*
 * "Extrusions II"
 * More crazy drawing iterations
 
 */

int fCount = 240;
int fDiv = 4;

void setup() {
  size(640, 640);
  smooth(8);
  frameRate(30);  
  
  noStroke();
}

void drawPlus() {
  float thick = 64.0;
  rect(-width*0.4, -thick, width*0.8, thick*2.0);
  rect(-thick, -height*0.4, thick*2.0, height*0.8);
}

boolean forward = true;

void draw() {
  if (frameCount > fCount) {
   frameCount = 0; 
   forward = true;
  noLoop();
  return;
  }
  println(frameCount);

  background(255);
  
  translate(width/2.0, height/2.0);
  
  float height = sin(radians((frameCount-24.0)*3.0)) * 32.0 + 24.0;
  if (height < 0) { height = 0; forward = !forward; }
  
  for (float i = height; i > 0; i--) {
    scale(0.97, 0.97);
    
    if (forward)
      rotate(0.008);
    else
      rotate(-0.008);
      
    fill(20+i*2.5, 40+i*4, 40+i*4, 255);
    drawPlus();
  }
  
  fill(255);
  drawPlus();
  

  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
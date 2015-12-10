/*== DAY 35 == [TUE DEC 8 2015] == */ //<>//
/*
 * "Polar Waves"
 * Sine wave synced arc drawing with offsets
 */

int fCount = 112;
int fDiv = 1;

void setup() {
  size(640, 640);
  smooth(8);
  frameRate(30);  
  
  strokeWeight(19);
  noFill();
  colorMode(HSB);
}

int lineCount = 12;
float step = 34;
float theta = 0;

void draw() {
  if (frameCount > fCount) {
   frameCount = 0; 
   theta = 0;
   noLoop();
  }
  //println(frameCount);
  
  background(90, 0, 44);
  
  translate(width/2, height/2);
  for (int i = 3; i < lineCount+4; i++) {
    float rad = i*step;
    float offSet = PI/3/lineCount*i;
    float arcEnd = map(sin(theta+offSet),-1,1, -PI/2, PI+PI/2);
    
    stroke(180+arcEnd*4,255,255);
    
    arc(0, 0, rad, rad, -PI/2, arcEnd);
  }
  theta += .0555;


  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
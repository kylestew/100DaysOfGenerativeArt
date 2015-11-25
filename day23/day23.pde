/*== DAY 23 == [MON NOV 23 2015] == */ //<>//
/*
 * "Colored Straws"
 * Sine wave motion, based on processing sin doc example
 */

int fStart = 0;
int fCount = 160*3;
int fDiv = 3; // 80 frames for GIF

float stepSize = 24.0;
float thickness = 12.0;
float curveFollow = 4.0;
float wobbleMult = 20.0;
float maxHeight = 240.0;
float speed = 4.0;

void setup() {
  size(640, 640);
  frameRate(30);
  
  colorMode(RGB);
  background(80);
}

void draw() {
  //if (frameCount == fStart) { frameCount = 0; fStart = -1; }; // video capture
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  println(frameCount);
  
  
  colorMode(RGB);
  noStroke();
  background(80);
  //fill(80, 120);
  //rect(0, 0, width, height);
  
  colorMode(HSB);
  stroke(255);
  
  strokeWeight(thickness);
  translate(0, height/2.0); // go to baseline
  for (float x = 0; x < width; x=x+stepSize) {
    // current angle determined by x position
    float angle = TWO_PI*((x+frameCount*speed)/width);
    float y = maxHeight*sin(angle);
    
    // line color based on height
    stroke(abs(y/1.6)+60, 240, 240);
    
    //float wobble = wobbleMult*sin(angle*24);
    
    line(x + 12.0*sin(angle*2.0), y/curveFollow, x, y);
  }


  //// video
  if (frameCount >= fStart) saveFrame("output/frame########.png");
  // gif
  //if (frameCount >= fStart && frameCount % fDiv == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
/*== DAY 80 == [MON MAR 28 2016] == */
/*
 * "Simple Forms - II"
 * 
 */

int fCount = 8*30;
int fDiv = 2;

color back = color(12,12,12);
color fore = color(255, 255, 255);
float rad = 300;

void setup() {
  size(640, 640);
  smooth();
  frameRate(30);
}

void draw() {
  if (frameCount >= fCount) {
   frameCount = 0;
   noLoop();
   return;
  }
  
  
  
  float h = sin(map(frameCount, 0, fCount, TWO_PI/2.0, 0));
  h = height - height*h;
  
  float bg = map(h, height, 0, 0, 255);
  background(bg);
  
  
  // mountains
  pushMatrix();
  float hOff = 120.0; // height offset
  translate(0, height);
  fill(fore);
  noStroke();
  beginShape();
  vertex(0,height/2.0);
  int points = (int)(width/2.0);
  int spread = (int)(width/(float)points);
  for (int i = 0; i <= points; i++) {
    float y = noise(24.0 + i/98.0);
    y *= -220.0;
    y -= hOff;
    vertex(i * spread, y);
  }
  vertex(width, height);
  endShape(CLOSE);
  popMatrix();

  // sun
  translate(width/2.0,h);
  ellipse(0,0,rad,rad);
  
  
  
  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
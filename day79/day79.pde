/*== DAY 79 == [SUN MAR 27 2016] == */
/*
 * "Simple Forms"
 * 
 */

//int fCount = 15*30;
int fCount = 98;
int fDiv = 1;

color back = color(12,12,24);
color fore = color(130, 192, 192);

void setup() {
  size(640, 640);
  smooth();
  frameRate(15);
}

void draw() {
  if (frameCount >= fCount) {
   frameCount = 0;
   noLoop();
   return;
  }
  

  background(back);
  
  translate(width/2.0, height/2.0+40);
  
  // draw shape
  
  float rad = 260;
  fill(fore);
  noStroke();
  ellipse(0,0,rad,rad);
  
  noFill();
  stroke(fore);
  strokeWeight(2.0);
  for (int i = 0; i < 6; i++) {
    float r = rad + i*40;
    ellipse(0,0,r,r);
  }
  
  translate(-width/2.0, 0);
  
  
  // subtract via fill
  translate(0, 40);
  fill(back);
  noStroke();
  beginShape();
  vertex(0,height/2.0);
  vertex(0,0);
  
  int points = 28;
  int spread = (int)(width/(float)points);
  for (int i = 0; i < points; i++) {
    float y = noise(frameCount/18.0 + i*0.65);
    y *= 48.0;
    vertex(i * spread, y);
  }
  
  vertex(width,0);
  vertex(width,height/2.0);
  endShape(CLOSE);
  
  
  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
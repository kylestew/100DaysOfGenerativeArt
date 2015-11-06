/*== DAY 04 == [WED NOV 4 2015] == */
/*
 * "Spirograph"
 * 
 */

float radius;

void setup() {
  size(640, 640);
  smooth();
  noStroke();
  
  radius = width / 4;
  
  frameRate(30);
}

void draw() {
  background(0x00A897);
  fill(255,180,190);
  stroke(6,54,100);
  strokeWeight(2);
  
  translate(width/2, height/2);
  
  beginShape();
  for (int i = 0; i < frameCount; i++) {
    float x = cos(2 * i) * width/2;
    float y = sin(2 * i) * height/2;
    vertex(x, y);
  }
  endShape(CLOSE);


  //// video
  saveFrame("output/frame########.png");
  //// gif
  //if (frameCount % 4 == 0 && frameCount < 400) saveFrame("output/frame####.gif");
}
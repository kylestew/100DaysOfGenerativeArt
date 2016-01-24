/*== DAY 47 == [SUN JAN 24 2016] == */ //<>//
/*
 * "Blind Spot"
 * This is what it looks like when you stare at the sun kids
 */

int fCount = 15*30;

void setup() {
  size(640, 640);  
  frameRate(30);
  smooth(4);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  //println(frameCount);
  
  background(360);
  
  translate(width/2.0, height/2.0);
  float rad = width*0.35;
  
  blendMode(SUBTRACT);

  fill(360, 100, 100, 100); // red
  noiseSeed(1);
  blobCircle(rad);
  
  fill(135, 100, 100, 100); // green
  noiseSeed(2);
  blobCircle(rad);

  fill(225, 100, 100, 100); // blue
  noiseSeed(3);
  blobCircle(rad);


  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}

void blobCircle(float rad) {
  beginShape();
  for (float i = 0; i < 360; i += 1) {
    float x = sin(radians(i));
    float y = cos(radians(i));
    
    x += 0.45*(noise(x+frameCount/120.0)-0.5);
    y += 0.45*(noise(y+frameCount/120.0)-0.5);
    
    x *= rad;
    y *= rad;
    
    vertex(x, y);
  }
  endShape(CLOSE);
}
/*== DAY 50 == [TUE JAN 26 2016] == */ //<>//
/*
 * "Learning to Flow II"
 * Still really into this effect
 */

int fCount = 15*30;

float noiseEffect = 0.8;
float ringOffset = 0.002;

void setup() {
  size(640, 640);
  frameRate(30);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  strokeWeight(4.0);
  noFill();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  println(frameCount);

  background(0);

  // green
  translate(width/2.0, height/2.0);
  rotate(radians(-120));

  float offset = 0;
  noiseSeed(8);
  float hue = 160;
  for (float rad = 40.0; rad < 1200.0; rad += 0.2) {
    stroke(hue, 100, 100, 20);
    blobCircle(rad, offset);
    offset += ringOffset;
    hue += 0.09;
  }

  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}

void blobCircle(float rad, float ranOff) {
  beginShape();
  for (float i = 0; i < 360; i += 1) {
    float x = sin(radians(i));
    float y = cos(radians(i));

    x += noiseEffect*(noise(ranOff+x+frameCount/120.0)-0.5);
    y += noiseEffect*(noise(ranOff+y+frameCount/120.0)-0.5);

    x *= rad;
    y *= rad;

    vertex(x, y);
  }
  endShape(CLOSE);
}

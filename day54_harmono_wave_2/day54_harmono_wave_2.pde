/*== DAY 54 == [TUE FEB 30 2016] == */
/*
 * "Harmonograph - IV"
 * One more animation
 */

int fCount = 360;
int fDiv = 4;

float freqX = 1;
float freqY = 1;
float phi = 90;

void setup() {
  size(640, 640);
  smooth();
  frameRate(30);
  background(242, 92, 130);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    // noLoop();
    // return;
  }
  // println(frameCount);

  fill(242, 92, 130, 20);
  noStroke();
  rect(0,0,width,height);

  float angle;
  float x0 = 0;
  float y0 = 0;
  float amp = width*0.4;
  boolean first = true;
  int points = width*2; // precision
  translate(width/2, height/2);

  // for (int revs = 0; revs < 12; revs++) {
    for (int i = 0; i < points; i++) {
      angle = map(i, 0, points, 0, TWO_PI);

      float x = amp * sin(angle * freqX + radians(phi));
      float y = amp * sin(angle * freqY);

      // modulate line width to approximate hand drawn lines
      float dist = dist(x0, y0, x, y);
      // if (dist > 0 && dist < 14) {
        // float weight = map(dist, 0, 3, 2.4, 1.0);
        // strokeWeight(weight);
        // stroke(
        //   map(weight, 1.0, 2.0, 0, 0),
        //   map(weight, 1.0, 2.0, 40, 60),
        //   map(weight, 1.0, 2.0, 90, 120));
      // } else {
        stroke(0,40,90);
      // }

      if (first) {
        first = false;
      } else {
        line(x0, y0, x, y);
      }

      x0 = x;
      y0 = y;
    }

    freqX = 1+4*sin(radians(frameCount));
    freqY = 1+3*sin(radians(frameCount));

  // video
  saveFrame("output/frame########.png");
  // gif
  // if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
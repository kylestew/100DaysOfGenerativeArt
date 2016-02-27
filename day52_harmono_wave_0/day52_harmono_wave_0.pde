/*== DAY 52 == [MON FEB 29 2016] == */
/*
 * "Harmonograph - II"
 * Two sine waves used to generate Lissajous figures
 */

int fCount = 12*30;
int fDiv = 3;

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
    noLoop();
    return;
  }
  println(frameCount);

  fill(242, 92, 130, 220);
  noStroke();
  rect(0,0,width,height);

  translate(width/2, height/2);

  float angle;
  float x0 = 0;
  float y0 = 0;
  float amp = width*0.4;
  boolean first = true;
  int points = width*2; // precision
  for (int i = 0; i < points; i++) {
    angle = map(i, 0, points, 0, TWO_PI);

    float x = amp * sin(angle * freqX + radians(phi));
    float y = amp * sin(angle * freqY);

    // modulate line width to approximate hand drawn lines
    float dist = dist(x0, y0, x, y);
    if (dist > 0 && dist < 14) {
      float weight = map(dist, 0, 14, 4.0, 0.3);
      strokeWeight(weight);
      stroke(
        map(weight, 0.2, 3.0, 60, 21),
        map(weight, 0.2, 3.0, 147, 56),
        map(weight, 0.2, 3.0, 200, 103));
    }

    if (first) {
      first = false;
    } else {
      line(x0, y0, x, y);
    }

    x0 = x;
    y0 = y;
  }

  freqX = 2+2*sin(radians(frameCount));
  freqY = 1+4*sin(radians(frameCount));


  // video
  // saveFrame("output/frame########.png");
  // gif
  // if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

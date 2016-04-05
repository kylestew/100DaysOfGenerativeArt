/*== DAY 85 == [SUN APR 3 2015] == */
/*
 * "???"
 * ???
 */

int fCount = 60;
int fDiv = 2;

int cols = 16;
float rad = 18;

ArrayList<Dot> dots = new ArrayList<Dot>();

void setup() {
  size(640, 640);
  smooth();
  frameRate(30);

  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  float cell = width/cols;
  float c2 = cell/2;
  for (int r = 0; r < cols; r++) {
    for (int c = 0; c < cols; c++) {
      Dot dot = new Dot(c*cell + c2, r*cell + c2, rad);
      dots.add(dot);
    }
  }
}

//float easeOutQuad(float t, float b, float c, float d) {
//  t /= d;
//  return -c * t*(t-2) + b;
//}
//float easeInQuad(float t, float b, float c, float d) {
//  t /= d;
//  return c*t*t + b;
//}
//float easeInOutQuad(float t, float b, float c, float d) {
//  t /= d/2;
//  if (t < 1) return c/2*t*t + b;
//  t--;
//  return -c/2 * (t*(t-2) - 1) + b;
//}

void draw() {
  // if (frameCount > fCount) {
  //   frameCount = 0;
  // noLoop();
  // }
  println(frameCount);

  background(360, 0, 88);

  for (Dot dot : dots) {
    dot.draw();
  }


  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

class Dot {
  float x, y;
  float x1, y1;
  float rad;

  public Dot(float x, float y, float rad) {
    this.x = x;
    this.y = y;
    this.rad = rad;
  }

  public void draw() {
    fill(360, 100, 100);
    ellipse(x, y, rad, rad);
  }
}

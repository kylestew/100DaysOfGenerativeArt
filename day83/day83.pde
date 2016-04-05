/*== DAY 83 == [MON MAR 28 2016] == */
/*
 * "Arc Revenge"
 * Really busy week, haven't been able to dig in to any deep concepts. Here are some animations instead.
 * Really inspired by FLRN GIF (gif.flrn.nl) right now.
 */

int fCount = 10*30;
int fDiv = 3;

int layers = 9;
float start = 20;
float weight = 12;
float step = weight*3.4;
float[] starts;
float[] sweeps;

void setup() {
  size(640, 640);
  smooth();
  frameRate(30);
  
  colorMode(HSB, 360, 100, 100, 100);
  
  starts = new float[layers];
  sweeps = new float[layers];
  for (int i = 0; i < layers-1; i++) {
    starts[i] = map(noise(i), 0, 1, 0, TWO_PI);
    sweeps[i] = map(noise(i), 0, 1, 0, 1.4*PI);
  }
  // last is full
  starts[layers-1] = 0;
  sweeps[layers-1] = TWO_PI;
  // first is small
  starts[0] = 0;
  sweeps[0] = 0.18;
}

void draw() {
  if (frameCount >= fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  
  translate(width/2, height/2);
  
  background(264, 10, 19);
  
  noFill();
  strokeWeight(weight);
  
  float rad = start;
  float delta = 24*sin(map(frameCount, 0, fCount, 0+PI/2.0, TWO_PI+PI/2.0));
  for (int i = 0; i < layers; i++) {
    if (i % 2 == 0)
      stroke(279, 45, 94);
    else
      stroke(181, 87, 93);
  
    float off = i % 2 == 0 ? delta : -delta;
    arc(0, 0, rad, rad, off+starts[i], off+starts[i]+sweeps[i]);
    rad += step;
  }
    
  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
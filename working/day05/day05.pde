/*== DAY 05 == [THUR NOV 5 2015] == */
/*
 * "???"
 * ...
 * Code ashamedly copied mostly from http://www.openprocessing.org/sketch/138713#
 */
 
float fRate = 30;
float fCount = 304; // carefully selected looping frame rate :)
float fDiv = 7; // 150 frames

PImage canvas;
MetaBall balls[];
MetaBall activeBall;
int numBalls = 5; // 4 + 1 moving
float minSize = 8.0f;
float maxSize = 20.0f;
float hW, hH;

void setup() {
  size(640, 640);
  smooth();

  frameRate(fRate);

  // drawing pixels into a canvas on this one
  canvas = createImage(width, height, ALPHA);
  canvas.loadPixels();
  
  hW = width/2;
  hH = height/2;
  
  balls = new MetaBall[numBalls];
  
  balls[0] = new MetaBall(new PVector(-width/4, -height/4), 24);
  balls[1] = new MetaBall(new PVector(width/4, -height/4), 24);
  balls[2] = new MetaBall(new PVector(-width/4, height/4), 24);
  balls[3] = new MetaBall(new PVector(width/4, height/4), 24);
  balls[4] = new MetaBall(new PVector(0, 0), 12);
  activeBall = balls[4];
}

color colorLookup(float i) {
  // input should be 0 to 1
  // these conditions set the banding ranges for colors and cause different looks
  return color((abs(floor(i*40.0)) + 10) * 8);
}

void draw() {
  if (frameCount > fCount)
    noLoop();
  println(frameCount);
  background(0);
  
  activeBall.radius = sin(frameCount / 48.0) * 60 + 10;
  
  for (int i = 0; i < numBalls; i++) {
    balls[i].update();
  }
  
  for (int i = 0; i < height * width; i++) {
   float col = 0.0f;
 
   for (int m = 0; m < numBalls; m++) {
     int y = floor(i / width); // faster than using int
     int x = i % width;
 
     float xx = (balls[m].pos.x + hW) - x;
     float yy = (balls[m].pos.y + hH) - y;
 
     col += balls[m].radius / sqrt( xx * xx + yy * yy);
   }
    
   canvas.pixels[i] = colorLookup(col);
  }
  
  canvas.updatePixels();
  image(canvas, 0, 0);
  
  //// video
  //saveFrame("output/frame########.png");
  //// gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
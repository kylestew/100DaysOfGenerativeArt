/*== DAY 92 == [SUN APR 10 2016] == */
/*
 * "Excited Cubicles"
 * Escape the cube farm!
 */
int fCount = 4*30;
int fDiv = 2;

PImage back;

int rows = 12;
float side = 42;
float space = 2;
float thick = 12;

void setup() {
  size(640, 640);
  smooth(3);
  frameRate(30);
  
  back = loadImage("back.png");
  colorMode(RGB, 100, 100, 100, 1);
  //strokeWeight(4);
  //stroke(99,22,22);
  noStroke();  
  fill(22,22,22);
  rectMode(CENTER);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  image(back, 0, 0);
  
  float cell = side+space;
  float offset = width - ((rows-1)*side + (rows-1)*space);
  translate(offset/2, offset/2);
  
  float off = map(frameCount, 0, fCount, 0, TWO_PI);
  for (int row = 0; row < rows; row++) {
    float off2 = cos(off + row*PI/rows);
    for (int col = 0; col < rows; col++) {
      
      float step = map(col, 0, rows, 0, PI);
      float mult = sin(off2+step);
      
      fill(22,22,22);
      rect(cell*row, cell*col, side*mult, side*mult, 24-22*abs(mult));
      
    }
  }


  // video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
/*== DAY 95 == [WED APR ?? 2016] == */
/*
 * "Technicolor Wombat"
 * Let that colored flag fly
 */
int fCount = 6*30;
int fDiv = 6;

float rad = 8;
float dist = 1.0;
float spread = 0.01;
float multX = 12;
float multY = 12;

void setup() {
  size(640, 640);
  smooth(8);
  frameRate(30);
  
  colorMode(HSB, TWO_PI, 100, 100, 100);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  background(0,0,14);
  
  noStroke();
  for (int x = 0; x < width; x += rad*dist*1.2) {
    for (int y = (int)(8*rad*dist); y < height - 8*rad*dist; y += rad*dist*2) {
      float x0 = x;
      float y0 = y + 12*sin(radians(x)+map(frameCount, 0, fCount, 0, TWO_PI));
      
      // hue rotation value
      float r = atan2(x0-width/2, y0-height/2) + PI;
      r -= map(frameCount, 0, fCount, 0, TWO_PI);
      while (r < 0)
        r += TWO_PI;
      fill(r, 100, 100, 90);
      
      // clip far
      float dist = abs(dist(width/2, height/2, x0, y0));
      //if (dist < width*0.4 && dist > width*0.14)
        ellipse(x0, y0, rad, rad);
    }
  }

  for (int x = (int)(rad*dist/2); x < width; x += rad*dist*1.2) {
   for (int y = (int)(rad*dist+8*rad*dist); y < height - 8*rad*dist; y += rad*dist*2) {
      float x0 = x;
      float y0 = y + 12*sin(radians(x)+map(frameCount, 0, fCount, 0, TWO_PI));
      
      // hue rotation value
      float r = atan2(x0-width/2, y0-height/2) + TWO_PI;
      r += map(frameCount, 0, fCount, 0, TWO_PI);
      while (r > TWO_PI)
        r -= TWO_PI;
      fill(r, 100, 100, 90);
      
      // clip far
      float dist = abs(dist(width/2, height/2, x0, y0));
      //if (dist < width*0.4 && dist > width*0.14)
        ellipse(x0, y0, rad, rad);
    }
  }
  

  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
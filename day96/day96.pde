/*== DAY 96 == [THR APR ?? 2016] == */
/*
 * "..."
 * ...
 */
int fCount = 4*30;
int fDiv = 1;

PImage back;
PGraphics mask;
PGraphics g;

int steps = 8;

void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);
  
  back = loadImage("back.png");
  noStroke();
  
  mask = createGraphics(640, 640, P2D);
  g = createGraphics(640, 640, P2D);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  background(0);

  int steps = 24;
  float angStep = 4*sin(map(frameCount, 0, fCount, 0, TWO_PI)) / steps;
  float ang = 0;
  int i = 0;
  for (int r = 550; r > 0; r-= 550/steps) {
    translate(width/2.0, height/2.0);
    rotate(i % 2 == 0 ? ang : -ang);
    translate(-width/2.0, -height/2.0);
    drawWithRad(r);
    
    ang += angStep;
    i++;
  }
  
  //translate(width/2.0, height/2.0);
  //rotate(frameCount/12.0);
  //translate(-width/2.0, -height/2.0);
  //drawStep(100, 200);
  

  //float maxRad = 300;
  //float step = 300/(float)steps;
  //for (float rad = maxRad; rad > 0; rad -= step) {
    
    
    
  //}
  
  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

void drawWithRad(float rad) {
  prepareMask(rad);
  g.beginDraw();
  g.background(0,0,0,0);
  g.image(back, 0, 0);
  g.mask(mask);
  g.endDraw();
  image(g, 0, 0);
}

void prepareMask(float rad) {
  mask.beginDraw();
  
  mask.background(0,0,0,0);
  
  mask.translate(width/2.0, height/2.0);
  mask.noStroke();
  mask.fill(255);
  mask.ellipse(0, 0, rad, rad);
 
  mask.endDraw();
}
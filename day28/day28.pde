/*== DAY 28 == [SUN NOV 29 2015] == */ //<>//
/*
 * "Prune"
 * Inspired by Prune - iOS game
 * http://www.openprocessing.org/sketch/8752
 */

int fCount = 180*2;
int fDiv = 1;

PImage background;
float branchHeight;
float branchDepth = 0;
float flowerStart = 7;
float growth = 0;

void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);
  
  background = loadImage("background.jpg");
  branchHeight = width/10.0;
}

void draw() {
  if (frameCount > fCount) {
   frameCount = 0;
   noLoop();
  }
  //println(frameCount);

  // draw background
  image(background, 0, 0);
  
  // draw sun
  noStroke();
  float x = width/2.0;
  float y = -height*.2;
  float baseRad = 520.0;
  // shadow is fake - drawn by graduating circles
  for (int i = 28; i > 0; i--) {
    fill(200, 200, 200, i);
    baseRad += 3.0;
    ellipse(x, y, baseRad, baseRad);
  }
  fill(#fc0d1b);
  ellipse(x, y, 520, 520);
  
  // draw terrain
  fill(0);
  beginShape();
  vertex(0,height);
  curveVertex(0, height-18.0);
  curveVertex(0, height-18.0);
  curveVertex(180, height-44.0);
  curveVertex(420, height-18.0);
  curveVertex(width, height-24.0);
  curveVertex(width, height-24.0);
  vertex(width,height);
  endShape(CLOSE);
  
  // draw tree line
  float drift = sin(radians(frameCount/2.0)) / 3.0;
  int count = 3;
  int stride = (int)(width/3.0);
  translate(stride/2.0, height);
  branchDepth = 19.0;
  for (int i = 0; i < count; i++) {
    pushMatrix();
    branch(0, drift);
    popMatrix();
    translate(stride, 0);
  }

  
  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  //saveFrame("output/frame####.gif");
}

void branch(int depth, float drift) {
  if (depth < branchDepth) {
    // draw branch and move to new end point
    if (depth < flowerStart) { // start flowers
      strokeWeight(10);
      stroke(0);
      line(0, 0, 0, -branchHeight-(drift*80));
      translate(0, -branchHeight-(drift*80));
    } else {
      fill(240);
      float rad = map(drift, 0, 0.5, 0, 120);
      ellipse(0,0,rad,rad);
    }
    
    // joints where branches meet
    fill(0);
    noStroke();
    rect(-5,-5,10,10);

    if (depth > flowerStart) { // draw flowers
      branch(depth+1, drift);
    } else {
      // fork branching
      scale(0.8);
      // right
      pushMatrix();
      rotate(drift);
      branch(depth + 1, drift);
      popMatrix();
      // left
      pushMatrix();
      rotate(-drift);
      branch(depth + 1, drift);
      popMatrix();
    }
  }
}
/*== DAY 07 == [SAT NOV 7 2015] == */
/*
 * "Staring at the Sun"
 * Collision detection and positional adjustment around a simple circle
 */
import generativedesign.*;

float fRate = 30;
float fCount = 500;
float fDiv = 12;

// walker drawing settings
Walker[] walkers = new Walker[10000];
int walkerCount = 6000;
float walkerAlpha = 33;
float strokeWidth = 0.6;

// noise settings
float fadeOutSpeed = 4;
float noiseScale = 333; // bendiness-ish
float noiseStrength = 60; // flowy or curliness

// negative circle boundary
PVector cirCenter = new PVector(320, 320);
float cirRad = 100;
float cirAlpha = 0;

void setup() {
  size(640, 640, P2D);
  smooth();

  frameRate(fRate);
  
  background(0);
  
  for (int i = 0; i < walkers.length; i++) { 
    walkers[i] = new Walker(new PVector(random(width),random(height)), strokeWidth, noiseScale, noiseStrength);
    //walkers[i] = new Walker(new PVector(0, 330), strokeWidth);
  }
}

void draw() {
  if (frameCount > fCount)
    noLoop();
  //println(frameCount);
  
  // fade background
  noStroke();
  fill(0,0,0,fadeOutSpeed);
  rect(0, 0, width, height);
  
  // draw circle
  fill(255,0,0,cirAlpha);
  ellipse(cirCenter.x, cirCenter.y, cirRad*2, cirRad*2);
  
  // update walkers, decide collision
  for (int i = 0; i < walkerCount; i++) {
    Walker walk = walkers[i];
    walk.update();
    
    if (pointCircle(walk.pos.x, walk.pos.y, cirCenter.x, cirCenter.y, cirRad)) {
      float a = atan2(walk.pos.y-cirCenter.y, walk.pos.x-cirCenter.x);
      PVector pos = PVector.fromAngle(a);
      pos.mult(cirRad); //<>//
      pos.add(cirCenter);
      walk.pos = pos;
    }
    
    // kick out previous pos if its in boundaries (happens less)
    if (pointCircle(walk.posLast.x, walk.posLast.y, cirCenter.x, cirCenter.y, cirRad)) {
      float a = atan2(walk.posLast.y-cirCenter.y, walk.posLast.x-cirCenter.x);
      PVector pos = PVector.fromAngle(a);
      pos.mult(cirRad);
      pos.add(cirCenter);
      walk.posLast = pos;
    }
  }
  
  // draw walkers
  stroke(255, walkerAlpha);
  for (int i = 0; i < walkerCount; i++) {
    walkers[i].draw();
  }
  
  //// video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

boolean pointCircle(float px, float py, float cx, float cy, float r) {
  // get distance between the point and circle's center
  // using the Pythagorean Theorem
  float distX = px - cx;
  float distY = py - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the circle's
  // radius the point is inside!
  if (distance <= r) {
    return true;
  }
  return false;
}
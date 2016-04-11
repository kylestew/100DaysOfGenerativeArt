/*== DAY 93 == [MON APR 11 2016] == */
/*
 * "Geometric Hypnosis"
 * Why haven't I been animating these!?
 */
int fCount = 4*30;
int fDiv = 1;

float baseSize;
PImage back;
ArrayList<Circle> centers;

PGraphics canvas;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  baseSize = width > height ? height : width;

  canvas = createGraphics(640, 640, P2D);
  back = loadImage("back.png");
}


color backColor = #121818;
float rotation = 180.0;
int count = 6;
float radius = 0.1;
float offset = 0.01;
int genStart = 1;
int genEnd = 2;
float scaleGeneration = 0.99;
float offsetGeneration = 0.4;
float circleWeight = 3;
color circleColor = #dfdfdf;
float circleOpacity = 1.0;
color circleFillColor = #222222;
float circleFillOpacity = 0;
float dotWeight = 8;
color dotColor = #ffffff;
float dotOpacity = 1;
float lineWeight = 1;
color lineColor = #2ef9fb;
float lineOpacity = 0.1;

boolean showCenters = true;
boolean showNetwork = true;
boolean showIntersects = false;

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  offset = 0.5*sin(map(frameCount, 0, fCount, 0, PI));
  radius = 0.8*cos(map(frameCount, 0, fCount, 0, PI));
  
  // prepare canvas
  canvas.beginDraw();
  canvas.colorMode(RGB, 255, 255, 255, 1);
  canvas.background(0,0,0,0);
  canvas.translate(width/2, height/2);
  
  // blurred (no gif)
  //circleWeight *= 2.5;
  //drawFrame();
  //canvas.filter(BLUR, 5);
  //circleWeight /= 2.5;
  
  drawFrame();
  canvas.endDraw();
  
  // draw composite
  //image(back, 0, 0);
  background(backColor);
  image(canvas, 0, 0);
  
  
  
  
  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

void drawFrame() {
  canvas.pushMatrix();
  canvas.rotate(radians(rotation)); // base rotation
  centers = new ArrayList<Circle>();
  drawGeneration(0, 0, 0, 1.0);
  
  // CENTER / INTERSECTS
  ArrayList<PVector> points = new ArrayList<PVector>();
    
  if (showCenters) {
    for (int i = 0; i < centers.size(); i++) {
      Circle c0 = centers.get(i);
      points.add(new PVector(c0.x, c0.y));
    }
  }
  if (showIntersects) {
   for (int i = 0; i < centers.size(); i++) {
     Circle c0 = centers.get(i);
     for (int j = 0; j < centers.size(); j++) {
       if (i == j)
         continue;
       Circle c1 = centers.get(j);
        
       PVector[] pts = c0.circleIntersection(c1);
        
       // de-duplicate points
       for (int pI = 0; pts != null && pI < pts.length; pI++) {
        PVector p = pts[pI];
        boolean found = false;
        for (int a = 0; a < points.size(); a++) {
          PVector p1 = points.get(a);
          if (p1.x == p.x && p1.y == p.y) {
            found = true;
            break;
          }
        }
        if (found == false) {
          points.add(p);
        }
       }
     }
   }
  }
  
  // draw lines
  if (showNetwork) {
   // for each point, draw a line to all other points 
   setStroke(lineColor, lineOpacity, lineWeight);
   for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    // start past myself
    for (int j = i+1; j < points.size(); j++) {
      PVector p1 = points.get(j);
      canvas.line(p.x, p.y, p1.x, p1.y);
    }
   }
  }
  
  // draw points
  setStroke(dotColor, dotOpacity, dotWeight);
  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    canvas.point(p.x, p.y);
  }
  
  canvas.popMatrix();
}

void drawGeneration(int generation, float centerX, float centerY, float scale) {
  for (int i = 0; i < count; i++) {
    // determine rotation
    float rot = radians(i*360.0/count);
    
    // determine offset from center
    float off = baseSize * offset;
    off *= offsetGeneration * generation;
    
    // determine center
    float cX = centerX + off*sin(rot);
    float cY = centerY + off*cos(rot);
    
    // determine radius of circle - based on generational scaling
    float rad = baseSize * radius * scale;
    
    // hide culled generations
    if (generation >= genStart) {
      // log shape details connections
      centers.add(new Circle(cX, cY, rad/2.0));
      
      // draw
      setStroke(circleColor, circleOpacity, circleWeight);
      setFill(circleFillColor, circleFillOpacity);
      canvas.ellipse(cX, cY, rad, rad);
    }
    
   // draw generation from this shape
    if (generation < genEnd - 1) {
      drawGeneration(generation + 1, cX, cY, scale * scaleGeneration);
    }
  }
}

void setStroke(color col, float opacity, float weight) {
  canvas.stroke(red(col), green(col), blue(col), opacity);
  canvas.strokeWeight(weight);
  canvas.noFill();
}

void setFill(color col, float opacity) {
  canvas.fill(red(col), green(col), blue(col), opacity);
}
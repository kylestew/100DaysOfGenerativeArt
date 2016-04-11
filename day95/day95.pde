/*== DAY 95 == [WED APR 13 2016] == */
/*
 * "Geometric Hypnosis II"
 * I find myself staring at these things for too long.
 */
int fCount = 6*30-12;
int fDiv = 6;

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
int count = 5;
float radius = 0.55;
float offset = 0.26;
int genStart = 0;
int genEnd = 2;
float scaleGeneration = 1;
float offsetGeneration = 1.31;
float circleWeight = 1;
color circleColor = #222222;
float circleOpacity = 0;
color circleFillColor = #ffffff;
float circleFillOpacity = 0.0;
float dotWeight = 1;
color dotColor = #ffffff;
float dotOpacity = 1;
float lineWeight = 2.0;
color lineColor = #ffffff;
float lineOpacity = 0.2;

boolean showCenters = true;
boolean showNetwork = true;
boolean showIntersects = true;

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  offsetGeneration = sin(map(frameCount, 0, fCount, 0, TWO_PI));
  //offset = 0.1*cos(map(frameCount, 0, fCount, 0, TWO_PI));
  //offset = 0.1*cos(map(frameCount, 0, fCount, 0, PI));
  //radius = 0.6+0.5*cos(map(frameCount, 0, fCount, 0, TWO_PI));
  
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
  background(#222222);
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
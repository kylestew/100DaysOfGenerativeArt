/*== DAY 59 == [MON MAR 7 2016] == */
/*
 * "Souperformula"
 * Andy Warhol meets Gielis
 */
int fCount = 12*30;
int fDiv = 3;

float m = 0;

void setup() {
  size(640, 640);
  noStroke();
  frameRate(30);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }

  background(0);

  float scale = width/8.0;

  float rad = map(frameCount, 0, fCount, -TWO_PI/2.0, TWO_PI/2.0);
  m = 6 + 6*sin(rad);

  // draw backdrops
  noStroke();
  fill(31, 42, 124);
  rect(0, 0, width/2, height/2);

  fill(238, 104, 31);
  rect(width/2, 0, width/2, height/2);

  fill(119, 189, 54);
  rect(width/2, height/2, width/2, height/2);

  fill(246, 235, 29);
  rect(0, height/2, width/2, height/2);

  // draw shapes
  translate(width/4, height/4);
  fill(229, 0, 31);
  drawSuperformula(m, 3, 14, 2, scale);

  translate(width/2, 0);
  fill(255, 243, 161);
  drawSuperformula(m, 1, 1, 8, scale);

  translate(0, height/2);
  fill(229, 0, 117);
  drawSuperformula(m, 15, 20, 3, scale);

  translate(-width/2, 0);
  fill(32, 41, 134);
  drawSuperformula(m, 1, 4, 8, scale/3.0);

  // video
  // saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

void drawSuperformula(float m, float n1, float n2, float n3, float scale) {
  beginShape();
  PVector[] points = superformula(m, n1, n2, n3);
  curveVertex(points[0].x * scale, points[0].y * scale);
  for (int i = 0; i < points.length; i++) {
    curveVertex(points[i].x * scale, points[i].y * scale);
  }
  curveVertex(points[points.length-1].x * scale, points[points.length-1].y * scale);
  endShape(CLOSE);
}

PVector[] superformula(float m, float n1, float n2, float n3) {
  int numPoints = 360;
  float phi = TWO_PI / numPoints;
  PVector[] points = new PVector[numPoints];
  for (int i = 0; i < numPoints; i++) {
    points[i] = superformulaPoint(m, n1, n2, n3, phi * i);
  }
  return points;
}

PVector superformulaPoint(float m, float n1, float n2, float n3, float phi) {
  float r;
  float t1, t2;
  float a = 1;
  float b = 1;

  t1 = cos(m * phi / 4.0) / a;
  t1 = abs(t1);
  t1 = pow(t1, n2);

  t2 = sin(m * phi / 4.0) / b;
  t2 = abs(t2);
  t2 = pow(t2, n3);

  r = pow(t1+t2, 1/n1);
  if (abs(r) == 0) {
    return new PVector(0, 0);
  } else {
    r = 1 / r;
    return new PVector(r*cos(phi), r*sin(phi));
  }
}
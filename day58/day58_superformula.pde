/*== DAY 58 == [SUN MAR 6 2016] == */
/*
 * "Superformula"
 * Inspired by example on P5.JS class on Kadenze
 */
int fCount = 12*30;
int fDiv = 8;

float m = 0;

void setup() {
  size(640, 640);
  noFill();
  frameRate(30);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }

  background(0);

  float scale = width/4.0+40;

  translate(width/2, height/2);
  stroke(255, 243, 220);
  strokeWeight(1);


  drawSuperformula(m, 3, 14, 2, scale);
  m += 0.08;


  // video
  // saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

void drawSuperformula(float m, float n1, float n2, float n3, float scale) {
  float newScaler = scale;
  for (int s = 16; s > 0; --s) {
    beginShape();

    // float mm = m + s + 4*noise(s);
    // float nn1 = n1 + s;
    // float nn2 = n2 + s;
    // float nn3 = n3 + s;

    float mm = m;
    float nn1 = n1 + 3*noise(s + frameCount/30.0);
    float nn2 = n2 + 3*noise(s + frameCount/30.0);
    float nn3 = n3 + 3*noise(s + frameCount/30.0);
    newScaler *= 0.94;
    float sScaler = newScaler;

    PVector[] points = superformula(mm, nn1, nn2, nn3);
    curveVertex(points[points.length-1].x * sScaler, points[points.length-1].y * sScaler);
    for (int i = 0; i < points.length; i++) {
      curveVertex(points[i].x * sScaler, points[i].y * sScaler);
    }
    curveVertex(points[0].x * sScaler, points[0].y * sScaler);

    endShape(CLOSE);
  }
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

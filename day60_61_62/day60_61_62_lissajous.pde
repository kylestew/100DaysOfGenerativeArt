/*== DAY 60/61/62 == [TUE MAR 8 2016] == */
/*
 * "Lissajous Fig 1 | 2 | 3"
 * All points connected to all others - inspired by the book Generative Design
 */
int fCount = 15*30;
int fDiv = 4;

/*
// DAY 60:
float freqX = 4;
float freqY = 7;
float phi = 15;
float modFreqX = 3;
float modFreqY = 2;
*/

/*
// DAY 61:
float freqX = 1;
float freqY = 4;
float phi = 150;
float modFreqX = 2;
float modFreqY = 4;
*/

// DAY 62:
float freqX = 1;
float freqY = 3;
float phi = 75;
float modFreqX = 12;
float modFreqY = 4;

int resolution = 1800;
float connRadius = 120;
float connRamp = 8;

float lineWeight = 2;
// color lineColor = color(0);
color lineColor = color(38, 64, 72);
float lineAlpha = 50;
color backColor = color(197, 101, 103);

PVector[] points;

void setup() {
  size(1200, 1200);
  smooth();

  background(backColor);
  stroke(lineColor);
  strokeWeight(lineWeight);
  strokeCap(ROUND);
  noFill();

  createPoints();
  drawPoints();

  saveFrame("output.png");
}

void createPoints() {
  points = new PVector[resolution];
  for (int i = 0; i < resolution; i++) {
    float angle = map(i, 0, resolution, 0, TWO_PI);

    float x = sin(angle * freqX + radians(phi)) * cos(angle * modFreqX);
    float y = sin(angle * freqY) * cos(angle * modFreqY);

    x *= width/2-30;
    y *= height/2-30;

    points[i] = new PVector(x, y);
  }
}

void drawPoints() {
  float d, a, h;

  translate(width/2, height/2);
  for (int i = 0; i < resolution; i++) {
    for (int j = 0; j < resolution; j++) {
      PVector p1 = points[i];
      PVector p2 = points[j];

      d = PVector.dist(p1, p2);
      a = pow(1/(d/connRadius+1), 6);

      if (d <= connRadius) {
        stroke(lineColor, a*lineAlpha);
        line(p1.x, p1.y, p2.x, p2.y);
      }
    }
  }
}

/*== DAY 63|64 == [FRI MAR 11 2016] == */
/*
 * "Lissajous Mod 1 | 2"
 * Add modulation to previous figures
 */
int fCount = 15*30;
int fDiv = 4;

// DAY 63:
// float freqX = 4;
// float freqY = 7;
// float phi = 15;
// float modFreqX = 3;
// float modFreqY = 2;
// float modFreq2X = 8;
// float modFreq2Y = 3;
// float modFreq2Strength = 0.1;

// DAY 64:
float freqX = 1;
float freqY = 4;
float phi = 150;
float modFreqX = 3;
float modFreqY = 2;
float modFreq2X = 3;
float modFreq2Y = 2;
float modFreq2Strength = 0.2;


int resolution = 1600;
float connRadius = 120;
float connRamp = 12;

float lineWeight = 1.2;
color lineColor = color(0);
float lineAlpha = 80;
color backColor = color(255);

PVector[] points;

void setup() {
  size(1280, 1280);
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

    float fmx = sin(angle * modFreq2X) * modFreq2Strength + 1;
    float fmy = sin(angle * modFreq2Y) * modFreq2Strength + 1;

    float x = sin(angle * freqX * fmx + radians(phi)) * cos(angle * modFreqX);
    float y = sin(angle * freqY * fmy) * cos(angle * modFreqY);

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

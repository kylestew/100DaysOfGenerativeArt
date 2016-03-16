
/* BRAILLE SPACING SPECS:
  dot: 1.4mm diam
  dot horiz spacing: 2.29mm (center to center)
  dot vert spacing: 2.54mm
  char horiz spacing: 6.0mm (center to center - first position dot)
  char vert spacing: 10.41mm
  This is cool and all, but I'm going for a design asthetic?
*/

float dotRad = 6; // fudged for looks
float hDotSpace = 12;
float vDotSpace = 16;
float hCharSpace = hDotSpace * 2;
float vCharSpace = 54;

PGraphics g;
PImage imgMask;

void setup() {
  size(640, 640);
  smooth();
  noStroke();

  imgMask = loadImage("mask.png");
  g = createGraphics(640, 640);
}

void draw() {

  // fill(49, 50, 52, 100);
  // rect(0,0,width,height);
  background(49,50,52);

  g.beginDraw();
  g.background(244);
  g.background(49,50,52,100);
  g.fill(224, 224, 221);
  g.noStroke();

  float stride = frameCount/64.0;
  float walk = round(frameCount/12.0);

  g.translate(-4,-4);
  for (int i = 0; i <= height / vCharSpace; i++) {
    g.pushMatrix();
    // translate(-walk, 0);
    for (int j = 0; j <= (width/hCharSpace)+hCharSpace; j++) {
      drawChar(stride);
      g.translate(hCharSpace, 0);
      stride += 1;
    }
    g.popMatrix();

    g.translate(0, vCharSpace);
  }

  g.endDraw();

  // g.mask(imgMask);
  image(g, 0, 0, width, height);
  blend(imgMask,0,0, width,height, 0,0,width,height,DARKEST);







}

void drawChar(float stride) {
  // 0 | 0
  if (noise(stride) < 0.6)
    g.ellipse(0, 0, dotRad, dotRad);
  // 0 | 1
  if (noise(stride) > 0.4)
    g.ellipse(hDotSpace, 0, dotRad, dotRad);
  // 1 | 0
  if (noise(stride * 2.0) < 0.4)
    g.ellipse(0, vDotSpace, dotRad, dotRad);
  // 1 | 1
  if (noise(stride * 2.0) > 0.6)
    g.ellipse(hDotSpace, vDotSpace, dotRad, dotRad);
  // 2 | 0
  if (noise(stride * 3.4) < 0.4)
    g.ellipse(0, vDotSpace*2, dotRad, dotRad);
  // 2 | 1
  if (noise(stride * 1.2) > 0.6)
    g.ellipse(hDotSpace, vDotSpace*2, dotRad, dotRad);
}

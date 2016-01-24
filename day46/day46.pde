/*== DAY 46 == [SAT JAN 23 2016] == */ //<>//
/*
 * "Trianglular Universe"
 * Finally setup a triangular grid, ready for more tomorrow
 */

int fCount = 10*30;

int count = 20;
int stride = 40;
ArrayList<Glyph> glyphs = new ArrayList<Glyph>();


void setup() {
  size(640, 640);
  smooth(4);
  
  frameRate(30);
  
  colorMode(HSB, 300, 100, 100, 100);
  //stroke(100,0,100,100);
  //strokeWeight(1);
  
  // build glyphs
  float space = width/(float)count;
  for (int col = 0; col < count; col++) {
    for (int i = -stride; i < height+stride; i += stride) {
      float x0 = col * space;
      float x1 = (col + 1) * space;
      float y0 = i;
      float y1 = i + stride;
      
      // alternate rows
      if (col % 2 != 0) {
        y0 += stride/2.0;
        y1 += stride/2.0;
      }
      
      // left
      Glyph glyph = new Glyph();
      glyph.x0 = x0;
      glyph.y0 = y0;
      glyph.x1 = x1;
      glyph.y1 = y0+stride/2.0;
      glyph.x2 = x0;
      glyph.y2 = y1;
      glyphs.add(glyph);
      
      // right
      glyph = new Glyph();
      glyph.x0 = x1;
      glyph.y0 = y0-stride/2.0;
      glyph.x1 = x1;
      glyph.y1 = y0+stride/2.0;
      glyph.x2 = x0;
      glyph.y2 = y0;
      glyphs.add(glyph);
    }
  }
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  println(frameCount);
  
  background(0);

  for (Glyph glyph : glyphs) {
    glyph.draw((float)frameCount, 1);
  }

  //// video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
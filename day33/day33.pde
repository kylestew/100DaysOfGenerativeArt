/*== DAY 33 == [SAT DEC 5 2015] == */ //<>//
/*
 * "I'd Rather be Quilting"
 * Inspired by @libselliott
 * https://www.instagram.com/p/-7I52bvB28/?taken-by=libselliott
 */

int fCount = 360/2;
int fDiv = 4;

float hue = 360.0;

void setup() {
  size(640, 640);
  smooth(8);
  frameRate(30);  
  
  noStroke();
  colorMode(HSB, 360, 255, 255);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0; 
    hue = 360;
    noLoop();
  }
  println(frameCount);

  // background fill
  background(#34353c);
  fill(#adbccf);
  noStroke();
  float stripHeight = 60.0;
  int stripCount = (int)(height/stripHeight);
  for (int i = 0; i < stripCount; i++) {
   // skip odd
   if (i%2 == 0)
     rect(0, i*stripHeight+50.0, width, stripHeight-2.0);
  }
  
  translate(width/2.0, height/2.0);

  strokeWeight(1.0);
  
  hue -= 2.0;
  
  
  float segs = 4;
  float wT = width/(2*segs);
  float w = wT*0.58;
  float h = atan(radians(90.0))*(wT-w);

  for (int leaf = 0; leaf < 8; leaf++) {
    pushMatrix();
    
    // 1 leaf in star
    for (int row = 0; row < segs; row++) {
      float rHue = hue+(float)row*18.0;

      pushMatrix();
      for (int col = 0; col < segs; col++) {
        float hu = rHue+(float)col*12.0;
        if (hu > 360)
          hu -= 360.0;
        if (hu < 0)
          hu = 360.0;
        fill(hu, 200, 200);
        stroke(hu, 200, 200);
        
        // draw in leaf mode
        if (leaf%2 == 0) {
          quad(0, 0, w, 0, wT, h, wT-w, h);
          translate(w, 0);
        } else {
          quad(0, 0, wT-w, h, wT-w, wT, 0, w);
          translate(0, w);
        }

      }
      popMatrix();
      translate(wT-w, h);
    }
    popMatrix();
    
    if (leaf%2 == 0)
      rotate(radians(90));
  }


  //// video
  if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
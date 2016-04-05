/*== DAY 85 == [MON MAR 28 2016] == */
/*
 * "Shifting Perspective"
 * I can't get enough of FLRN GIF (http://gif.flrn.nl) right now.
 */

int fCount = 4*30; // double for IG
int fDiv = 1;

int strips = 9;
float gap = 24;

void setup() {
  size(640, 640);
  smooth();
  frameRate(30);
  
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  if (frameCount >= fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  
  translate(width/2, height/2);
  scale(0.6,0.5);
  translate(-width/2, -height/2);
  
  background(264, 10, 19);
  
  float stripHeight = (height-gap*(strips-1))/strips;
  
  float offset = -100;
  float rad = map(frameCount, 0, fCount, 0, TWO_PI);
  for (int i = 0; i < strips; i++) {
    noStroke();
    fill(264, 0, 98);
    beginShape();
    vertex(0,0);
    
    float centerXOff = 128.0*sin(rad+i/3.0);
    
    // strip
    vertex(centerXOff+width/2, offset);
        
    vertex(width,12);
    vertex(width,stripHeight+12);
    
    // strip return
    vertex(centerXOff+width/2, offset+stripHeight+24);
    
    vertex(0,stripHeight);
    
    endShape(CLOSE);
    
    // try line over corner
    stroke(264, 10, 19);
    noFill();
    strokeWeight(10);
    line(centerXOff+width/2, offset, centerXOff+width/2, offset+stripHeight+24);    
    
    offset += 24.0;
    translate(0, stripHeight+gap);
  }

    
  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
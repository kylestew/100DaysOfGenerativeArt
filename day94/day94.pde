/*== DAY 96 == [THR APR ?? 2016] == */
/*
 * "Please break my heart"
 * Had the chance to collab with @soulflowcreations on today's post. Artistically speaking, she may be the complete opposite of me. Great experience.  
 * 
 */
import ddf.minim.*;
import ddf.minim.analysis.*;
 
int fCount = 1*30;
int fDiv = 1;

Minim       minim;
AudioPlayer src;
FFT fft;

PImage back;
PGraphics mask;
PGraphics g;

float rotation = 0;

void setup() {
  size(650, 650, P3D);
  smooth(8);
  frameRate(15);
  
  back = loadImage("back.png");
  noStroke();
  
  mask = createGraphics(640, 640, P2D);
  g = createGraphics(640, 640, P2D);
  
  minim = new Minim(this);
  //src = minim.getLineIn();
  
  src = minim.loadFile("loop2.wav", 1024);
  
  src.play();
  
  fft = new FFT(src.bufferSize(), src.sampleRate());
  fft.logAverages( 64, 3 );
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    //noLoop();
    //return;
  }
  //println(frameCount);
  
  fft.forward(src.mix);
  
  background(0);
  
  stroke(0);
  strokeWeight(8);
  noFill();
  beginShape();
  for(int i = 0; i < src.bufferSize() - 1; i++) {
    vertex(i+60, height/2.0 + src.right.get(i+1)*100);
  }
  endShape();

  int steps = 64;
  rotation = lerp(rotation, 0.0055*(fft.getAvg(3)-110), 0.22);
  float ang = 0;
  float angStep = rotation/steps;
  int i = 0;
  for (int r = 500; r > 0; r-= 500/steps) {
    
    pushMatrix();
    translate(width/2.0, height/2.0);
    rotate(i % 2 == 0 ? ang : -ang);
    translate(-width/2.0, -height/2.0);
    drawWithRad(r);
    popMatrix();
    
    ang += angStep;
    //i++;
  }
}

void drawWithRad(float rad) {
  prepareMask(rad);
  g.beginDraw();
  g.background(0,0,0,0);
  g.image(back, 0, 0);
  g.mask(mask);
  g.endDraw();
  image(g, 0, 0);
}

void prepareMask(float rad) {
  mask.beginDraw();
  
  mask.background(0,0,0,0);
  
  mask.translate(width/2.0, height/2.0);
  mask.noStroke();
  mask.fill(255);
  mask.ellipse(0, 0, rad, rad);
 
  mask.endDraw();
}
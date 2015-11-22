/*== DAY 16 == [TUE NOV 17 2015] == */ //<>//
/*
 * ""
 * First audio reactive design
 */
import ddf.minim.analysis.*;
import ddf.minim.*;

int fCount = 340;
int fRate = 30; // 4 sec

Minim minim;
AudioPlayer audio;
FFT fft;
int w;

PImage fade;
float rWidth, rHeight;
float hVal;

float heightMult = 3.4;

void setup() {
  size(1290, 1290, P3D);
  smooth(0);
  
  frameRate(30);
  
  minim = new Minim(this);
  audio = minim.loadFile("Run.mp3", 1024);
  audio.loop();
  fft = new FFT(audio.bufferSize(), audio.sampleRate());
  fft.logAverages(60, 7);

  stroke(0);
  w = (int)(width/fft.avgSize()/1.0);
  strokeWeight(w);
  strokeCap(SQUARE);
  
  background(0);
  fade = get(0, 0, width, height);
  
  rWidth = width * 0.995;
  rHeight = height * 0.98;
  hVal = 0.0;
}

void draw() {
  //if (frameCount > fCount) 
  //  return;
  //println("frame: " + frameCount);
  
  background(0);

  //tint(255, 255, 255, 254);
  image(fade, -2, -4, width, height);
  //noTint();
  
  fft.forward(audio.mix);
  
  colorMode(HSB);
  stroke(hVal, 255, 255);  
  colorMode(RGB);
  
  // left
  for(int i = fft.avgSize() - 1; i > 0; i--) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( width/1.8 - (i * w) + (w/2), height, width/1.8 - (i * w)+(w/2), height - fft.getAvg(i) * heightMult);
  }
  // right
  for(int i = 0; i < fft.avgSize(); i++) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( width/2.2 + (i * w) + (w/2), height, width/2.2 + (i * w)+(w/2), height - fft.getAvg(i) * heightMult);
  }
  
  fade = get(0, 0, width, height);
  hVal += 1.0;
  if (hVal > 260) hVal = 0.0;

  stroke(255);
  
  // left
  for(int i = fft.avgSize() - 1; i > 0; i--) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( width/1.8 - (i * w) + (w/2), height, width/1.8 - (i * w)+(w/2), height - fft.getAvg(i) * heightMult);
  }
  // right
  for(int i = 0; i < fft.avgSize(); i++) {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( width/2.2 + (i * w) + (w/2), height, width/2.2 + (i * w)+(w/2), height - fft.getAvg(i) * heightMult);
  }


  //// video
  //saveFrame("output/frame########.png");
  //// gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
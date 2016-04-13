/*== DAY 55 == [THR MAR 3 2016] == */
/*
 * "Freq Out"
 * FFT analysis translated to harmonographs in real time
 */
import ddf.minim.*;
import ddf.minim.analysis.*;

int fCount = 15*30;
int fDiv = 4;

Minim minim;
AudioPlayer out;
// AudioInput out;
FFT fft;

float freq0;
float freq1;
float lerpResponse = 0.5;
float freqDiv = 1*TWO_PI;

void setup() {
  size(800, 800);
  smooth();
  background(0);
  frameRate(30);

  minim = new Minim(this);
  out = minim.loadFile("loop.wav", 1024);
  // out = minim.getLineIn();

  fft = new FFT(out.bufferSize(), out.sampleRate());
  fft.window( FFT.COSINE );
  // fft.window( FFT.TRIANGULAR );
  // fft.linAverages( 32 );
  
  noLoop();
}

void keyPressed() {
  out.play();
  loop();
}

void draw() {
  if (frameCount > fCount) {
    out.rewind();
    out.play();
    frameCount = 0;
    
    //noLoop();
    //return;
  }
  // println(frameCount);

  fft.forward(out.mix);

  // clear
  background(0);
  // fill(0,0,0,80);
  // noStroke();
  // rect(0,0,width,height);

  // draw FFT
  // stroke(255, 0, 0, 128);
  // strokeWeight(1);
  // for(int i = 0; i < fft.specSize(); i++)
  // {
  //   line(i, height, i, height - fft.getBand(i)*4);
  // }
  // draw waveform
  // stroke(255);
  // for(int i = 0; i < out.left.size() - 1; i++)
  // {
  //   line(i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50);
  //   line(i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50);
  // }

  // find 2 peak freqs
  float peak0 = 0;
  float amp0 = 0;
  float peak1 = 0;
  float amp1 = 0;
  for (int i = 0; i < fft.specSize(); i++) {
    float sample = fft.getBand(i);

    if (amp0 < sample) {
      // demote prev value to 2nd
      amp1 = amp0;
      peak1 = peak0;

      // new largest value
      amp0 = sample;
      peak0 = i*fft.getBandWidth(); // convert band to freq
    } else if (amp1 < sample) {
      // new second largest value
      amp1 = sample;
      peak1 = i*fft.getBandWidth(); // convert band to freq
    }
  }
  // println(peak0 + " :: " + peak1);
  // println(amp0 + " :: " + amp1);
  // println(peak0);

  // lerp current value - hard curve
  freq0 = lerp(freq0, peak0, lerpResponse);
  freq1 = lerp(freq1, peak1, lerpResponse);

  // draw harmonograph
  // TODO: weighted strokes
  stroke(240, 60, 60);
  strokeWeight(2);
  noFill();
  beginShape();
  float x = width;
  float y = height;
  float angle;
  int resolution = 1280;
  translate(width/2.0, height/2.0);
  for (int i = 0; i < resolution; ++i) {
    angle = map(i, 0, resolution, -TWO_PI/2.0, TWO_PI/2.0);

    x = sin(angle * freq0/freqDiv) * (width-30)/2.0;
    y = sin(angle * freq1/freqDiv) * (height-30)/2.0;

    vertex(x, y);
  }
  endShape();



  // video
  //saveFrame("output/frame########.png");
  // gif
  // if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class dayXX_harmono_tone_0 extends PApplet {

/*== DAY XX == [WED MAR 2 2016] == */
/*
 * "Tone Graph ???"
 * ???
 */



int fCount = 360;
int fDiv = 4;

Minim minim;
AudioPlayer out;
// AudioInput out;
FFT fft;

public void setup() {
  
  
  background(0);

  minim = new Minim(this);
  out = minim.loadFile("saturn.mp3", 1024);
  out.play();
  // out = minim.getLineIn();

  fft = new FFT(out.bufferSize(), out.sampleRate());
}

public void draw() {
  // if (frameCount > fCount) {
    // recorder.endRecord();
    // out = null;
  //   frameCount = 0;
  //   noLoop();
  //   return;
  // }
  // println(frameCount);

  fft.forward(out.mix);

  // clear
  background(0);
  // fill(0,0,0,80);
  // noStroke();
  // rect(0,0,width,height);

  // draw FFT
  stroke(255, 0, 0, 128);
  strokeWeight(1);
  for(int i = 0; i < fft.specSize(); i++)
  {
    line(i, height, i, height - fft.getBand(i)*4);
  }
  // draw waveform
  stroke(255);
  for(int i = 0; i < out.left.size() - 1; i++)
  {
    line(i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50);
    line(i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50);
  }

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


  stroke(240, 60, 60);
  strokeWeight(1);
  noFill();
  beginShape();
  float x = width;
  float y = height;
  float angle;
  int resolution = 1280;
  float freqDiv = 4*TWO_PI;
  translate(width/2.0f, height/2.0f);
  for (int i = 0; i < resolution; ++i) {
    angle = map(i, 0, resolution, -TWO_PI/2.0f, TWO_PI/2.0f);

    x = sin(angle * peak0/freqDiv) * width/2.0f;
    y = sin(angle * peak1/freqDiv) * height/2.0f;

    vertex(x, y);
  }
  endShape();



  // video
  // saveFrame("output/frame########.png");
  // gif
  // if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
  public void settings() {  size(640, 640);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dayXX_harmono_tone_0" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

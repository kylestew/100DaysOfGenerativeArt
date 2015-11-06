import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sandbox extends PApplet {





Minim minim;
AudioInput input;

// AudioPlayer out;
AudioOutput out;

Oscil wave;
FFT fft;

public void setup() {
  size(512, 200, P3D);

  minim = new Minim(this);

  // NOTE: switch below outputs
  // WAVE
  out = minim.getLineOut();
  wave = new Oscil(440, 0.5f, Waves.SINE);
  wave.patch(out);

  // MP3
  // out = minim.loadFile("caribou_silver.mp3", 512);
  // out.play();

  // FFT
  fft = new FFT(out.bufferSize(), out.sampleRate());
}

public void draw() {
  background(0);

  stroke(255);
  strokeWeight(1);
  // OSC
  for(int i = 0; i < out.bufferSize() - 1; i++) {
    line(i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50);
    line(i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50);
  }

  // FFT visual
  stroke(255, 0, 0, 128);
  fft.forward(out.mix);
  for (int i = 0; i < fft.specSize(); i++) {
    line(i, height, i, height - fft.getBand(i)*4);
  }

  // OSC visual
  if (wave != null) {
    stroke( 128, 0, 0 );
    strokeWeight(4);
    for( int i = 0; i < width-1; ++i ) {
      point( i, height/2 - (height*0.49f) * wave.getWaveform().value( (float)i / width ) );
    }
  }
}

public void mouseMoved() {
  if (wave != null) {
    float amp = map( mouseY, 0, height, 1, 0 );
    wave.setAmplitude( amp );

    float freq = map( mouseX, 0, width, 110, 880 );
    wave.setFrequency( freq );
  }
}

public void keyPressed() {
  switch( key )
  {
    case '1':
      wave.setWaveform( Waves.SINE );
      break;

    case '2':
      wave.setWaveform( Waves.TRIANGLE );
      break;

    case '3':
      wave.setWaveform( Waves.SAW );
      break;

    case '4':
      wave.setWaveform( Waves.SQUARE );
      break;

    case '5':
      wave.setWaveform( Waves.QUARTERPULSE );
      break;

    default: break;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sandbox" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

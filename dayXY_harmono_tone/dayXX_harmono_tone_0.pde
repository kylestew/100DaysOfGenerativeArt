/*== DAY XX == [WED MAR 2 2016] == */
/*
 * "Tone Graph ???"
 * ???
 */
import ddf.minim.*;
// import ddf.minim.ugens.*;

int fCount = 360;
int fDiv = 4;

Minim minim;
AudioPlayer player;
AudioOutput out;
// AudioRecorder recorder;

// Oscil wave0;
// Oscil wave1;

float freq0 = 440;
float freq1 = 440;

void setup() {
  size(640, 640);
  smooth();
  background(0);

  minim = new Minim(this);
  out = minim.getLineOut();
  // out.setGain(-20);
  player = minim.loadFile("sine.wav");
  player.play();

  // wave0 = new Oscil(freq0, 1.0f, Waves.SINE);
  // wave0.patch(out);
  // wave1 = new Oscil(freq1, 1.0f, Waves.SINE);
  // wave1.patch(out);

  // recorder = minim.createRecorder(out, "audio.wav");
}

void draw() {
  // if (frameCount > fCount) {
    // recorder.endRecord();
    // out = null;
  //   frameCount = 0;
  //   noLoop();
  //   return;
  // }
  // println(frameCount);

  // if (!recorder.isRecording()) // skip audio pop
  //   recorder.beginRecord();

  background(0);
  // fill(0,0,0,80);
  // noStroke();
  // rect(0,0,width,height);

  stroke(255);
  strokeWeight(4);
  stroke(90,90,90);
  float hH = height/2.0;
  for (int i = 0; i < player.bufferSize() - 1; i++) {
    line(i, hH - player.left.get(i)*hH, i+1, hH - player.left.get(i+1)*hH);
  }

  noLoop();

  // stroke(240, 60, 60);
  // strokeWeight(2);
  // noFill();
  // beginShape();
  // float x = width;
  // float y = height;
  // float angle;
  // int resolution = 1280;
  // translate(width/2.0, height/2.0);
  // for (int i = 0; i < resolution; ++i) {
  //   angle = map(i, 0, resolution, -TWO_PI/2.0, TWO_PI/2.0);
  //
  //   x = sin(angle * freq0/(PI*18)) * width/2.0;
  //   y = sin(angle * freq1/(PI*18)) * height/2.0;
  //
  //   vertex(x, y);
  // }
  // endShape();

  // wave0.setFrequency(freq0);
  // freq1 += 1.0;
  // freq1 += 10.0 * (noise(frameCount) - 0.5);
  // freq1 += random(10) - 5;


  // iterate frequencies
  // freq0 = 220 + 220 * sin(frameCount/120.0);
  // wave0.setFrequency(freq0);
  // freq1 = 220 + 220 * cos(frameCount/120.0);
  // wave1.setFrequency(freq1);

  // video
  // saveFrame("output/frame########.png");
  // gif
  // if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

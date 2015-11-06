import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer out;
FFT fft;
PShape s;

float scaleMult;
float scaleDelt;
float xRot;
float yRot;
float zRot;

void setup() {
  size(900, 900, P3D);
  smooth();
  frameRate(30);

  s = loadShape("bucky.obj");
  scaleMult = 1.0f;
  scaleDelt = 0f;
  xRot = 0f;
  yRot = 0f;
  zRot = 0f;

  minim = new Minim(this);

  // MP3
  out = minim.loadFile("Circles.mp3", 512);
  out.play();

  // FFT
  fft = new FFT(out.bufferSize(), out.sampleRate());
}

void draw() {
  background(#202020);

  // FFT visual
  stroke(255, 0, 0, 128);
  fft.forward(out.mix);

  for (int i = 0; i < fft.specSize(); i++) {
    line(i, height, i, height - fft.getBand(i)*40);
  }
  // Waveform
  stroke(255);
  strokeWeight(1);
  for(int i = 0; i < out.bufferSize() - 1; i++) {
    line(i, height - (50 + out.left.get(i)*50), i+1, height - (50 + out.left.get(i+1)*50));
  }

//  ambientLight(0, 0, 255);
  ambientLight(0, 0, 230+(noise(frameCount)-0.5)*50);
  spotLight(255, 120, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 1);

  translate(width/2, height/2, -100);

  // map FFT to sound
  xRot = xRot + fft.getBand(60) * 0.04f;
  rotateX(xRot);
  yRot = yRot + fft.getBand(20) * 0.01f;
  rotateY(yRot);
  zRot = zRot + fft.getBand(50) * 0.01f;
  rotateZ(zRot);

  // scale
  scaleDelt += fft.getBand(40) * 0.01f; // push outwards
//  scaleDelt -= 0.05f; // always be shrinking
//  if (scaleDelt > 0.1f) scaleDelt = 0.1f; // cap growth
//  scaleMult *= 1f + scaleDelt;
//  if (scaleMult < 1f) scaleMult = 1f; // cap min size
//if (fft.getBand(40) > 3f)
//  scaleMult = 1f + fft.getBand(40) * 0.04f;
println(out.left.get(1));
if (abs(out.left.get(1)) > 0.3)
scaleMult = 1f + out.left.get(1) * 0.2f;
else
scaleMult = 1f;

  // geometry is unitized
  scale(width*0.3f*scaleMult, width*0.3f*scaleMult, width*0.3f*scaleMult);

  shape(s, 0, 0);
}

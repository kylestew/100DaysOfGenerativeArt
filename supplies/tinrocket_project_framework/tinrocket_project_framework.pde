import java.util.*;
import processing.pdf.*;


final String KEY_RANDOM_SEED = "RANDOM_SEED";


/* CONFIG */
final boolean RECORD_FRAMES = false;
//final boolean RECORD_FRAMES = true;
final boolean RECORD_VIDEO = false;
//final boolean RECORD_VIDEO = true;
/* CONFIG */


TRRecorder recorder;
TRParameters params;

void setup() {
  //pixelDensity(2);
  smooth(4);
  frameRate(30);

  size(768, 768, P2D);

  newConfiguration();
}


void newConfiguration() {
  recorder = new TRRecorder(this);
  recorder.recordFrames = RECORD_FRAMES;
  recorder.recordVideo = RECORD_VIDEO;
  recorder.setupEvent();

  params = new TRParameters();
  Date d = new Date();
  params.put(KEY_RANDOM_SEED, d.getTime());
  randomSeed(params.getLong(KEY_RANDOM_SEED));
  
  params.debugDumpParams();
}


void draw() {
  recorder.drawEventEnter(); // Call before drawing

  background(0);
  rectMode(CENTER);
  noStroke();
  
  for (int i = 1; i < 2000; i++) {
    float x = random(0,1);  
    float y = noise(x, i*100000);  
    ellipse(x*width,y*height,4,4); 
  }
  
  recorder.drawEventExit(); // Call after drawing
}


void mousePressed() {
  recorder.captureOneStill();
  recorder.captureOnePDF();

// Save params with PDF
  String path = recorder.recordPDFSavePath + recorder.recordName() + ".txt";
  params.save(path);
}
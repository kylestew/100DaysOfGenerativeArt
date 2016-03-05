/*== DAY 57 == [SAT MAR 5 2016] == */
/*
 * "AM Radio"
 * Visualzation of AM radio (amplitude modulated) waves
 */
int fCount = 10*30;
int fDiv = 6;

float infoFreq = 2;
float carrierFreq = 18;

void setup() {
  size(640, 640);
  smooth();
  background(255);
  frameRate(30);
}

void drawSignal(int mode) {
  noFill();
  beginShape();
  float x = width;
  float y = height;
  float amp = height*0.2;
  float angle;
  for (int i = 0; i < width; ++i) {
    angle = map(i, 0, width, -TWO_PI/2.0, TWO_PI/2.0);

    float info = sin(angle * infoFreq);
    float carrier = cos(angle * carrierFreq);

    if (mode == 0) {
      y = amp * info;
    } else if (mode == 1) {
      y = amp * carrier;
    } else {
      y = amp * info * carrier;
    }

    vertex(i, y);
  }
  endShape();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  // println(frameCount);

  // oscillate info frequency
  float rad = map(frameCount, 0, fCount, 0, TWO_PI);
  infoFreq = 3 + 3*sin(rad);

  background(255);
  strokeWeight(1);
  translate(0, height/2.0);

  // info
  stroke(0, 130, 164);
  drawSignal(0);

  // carrier
  stroke(0, 130, 164, 128);
  drawSignal(1);

  // modulated signal
  stroke(0, 0, 0);
  strokeWeight(2);
  drawSignal(2);


  // text overlay
  stroke(153);
  textSize(32);
  fill(0,0,0);
  textAlign(RIGHT);
  String freq = String.format("%.2f", infoFreq);
  text("info: " + freq + " Hz", 0, height/3.0, width-24, 100);
  text("carrier: 24 Hz", 0, height/3.0 + 48, width-24, 100);


  // video
  saveFrame("output/frame########.png");
  // gif
  // if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

/*== DAY 69 == [THUR MAR 17 2016] == */
/*
 * "Kaleidoscope"
 * Inspired by Lauren McCarthy of P5.JS fame.
 */
int fCount = 6*30;
int fDiv = 2;

float rad = 98.0;
float angle = 0.0;

color col2 = color(45, 108, 188);
color col1 = color(236, 54, 50);

void setup() {
  size(640, 640);
  frameRate(30);
}

void draw() {
  if (frameCount >= fCount) {
    frameCount = 0;
    angle = 0;
    noLoop();
    return;
  }
  println(frameCount);


  float tick = map(frameCount, 0, fCount, 0, TWO_PI);
  float l0 = map(sin(tick), -1, 1, 124, 300);
  float l1 = map(sin(tick), -1, 1, 64, 200);
  angle = map(frameCount, 0, fCount, 0, TWO_PI/5.0);

  noStroke();
  background(0);
  // background(255);
  blendMode(DIFFERENCE);

  translate(width/2, height/2);
  rotate(angle);
  for (int i = 0; i<5; i++) {
    pushMatrix();

    fill(col2);
    rotate(i*TWO_PI/5);
    translate(0, l0);
    ellipse(0, 0, rad*1.4, rad*1.4);

    rotate(angle);
    for (int j = 0; j<5; j++) {
      pushMatrix();

      fill(col1);
      rotate(j*TWO_PI/5);
      translate(0, l1);
      ellipse(0, 0, rad, rad);

      rotate(angle);
      // for (int k = 0; k < 5; k++) {
      //   pushMatrix();
      //
      //   rotate(k*TWO_PI/5);
      //   translate(0, 50);
      //   ellipse(0, 0, rad, rad);
      //
      //   popMatrix();
      // }

      popMatrix();
    }

    popMatrix();
  }


  // video
  // if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

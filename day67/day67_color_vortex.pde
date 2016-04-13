/*== DAY 67/68/69 == [TUE-THUR MAR 15 2016] == */
/*
 * "Hue Don't Even Know"
 * A vortex of color in every bite
 */

int fCount = 15*30;
int fDiv = 1;

float hue;
float hueOpa = 0.03;
float hueFreq = 0.009;

float rotSpeed = 0.01;
float modX = 0;
float modY = 0;
float shrinkX = 0.001;
float shrinkY = 0.001;

void setup() {
  size(1280, 1280);
  noStroke();
  smooth();
  colorMode(HSB, TWO_PI, 1, 1, 1); // rotate around hue with full sat/bri
  background(0);
  frameRate(30);
}

void draw() {
  //if (frameCount > fCount) {
  // //frameCount = 0;
  // noLoop();
  //}
  //println(frameCount);

  hue = map(sin(hueFreq * frameCount), -1, 1, 0, TWO_PI);
  float sX = 0.2 + map(modX*sin(radians(frameCount)), -1, 1, 0.2, 0.8) - frameCount*shrinkX;
  float sY = 0.2 + map(modY*sin(radians(frameCount)), -1, 1, 0.2, 0.8) - frameCount*shrinkY;

  fill(color(hue, 1, 1, hueOpa));
  translate(width/2, height/2);
  //translate(120*noise(frameCount), 120*noise(frameCount));
  rectMode(CENTER);
  rotate(frameCount*rotSpeed);
  scale(sX + 0.5*noise(frameCount/32.0), sY + 0.5*noise(frameCount/32.0+12));
  //triangle(0,height,width/2,0,width,height);
  //rect(0,0,width,height);
  ellipse(0,0,width,height);
  scale(0.4+0.8*noise(frameCount/64.0+12), 0.8+0.1*noise(frameCount/64.0));
  fill(0,0,0, hueOpa*4.0);
  ellipse(0,0,width,height);
  

  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
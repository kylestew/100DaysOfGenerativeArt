/*== DAY 35 == [TUE DEC 8 2015] == */ //<>//
/*
 * "..."
 * https://www.instagram.com/p/_AAHhXKUQL/?taken-by=tychomusic
 */

int fCount = 300;
int fDiv = 6;

float hue = 360.0;

void setup() {
  size(640, 640);
  smooth(8);
  frameRate(30);  
  
  
  noStroke();
  //strokeWeight(32);
  //colorMode(HSB, 300, 255, 255, 255);
}


//int num =20;
//float step = 22;
//float sz, offSet, theta, angle;


void draw() {
  //if (frameCount > fCount) {
  //  frameCount = 0; 
  //  noLoop();
  //}
  
  background(#e3e4de);
  
  fill(#343436);
  
  translate(width/2.0, height/2.0);
  rotate(radians(45));
  translate(-width/2.0, -height/2.0);
  
  float bandHeight = 48.0;
  for (float i = -height/2.0; i < height+height/2.0; i+=bandHeight) {
    rect(-height/2.0, i, height*2.0, bandHeight/2.0);
  }
  
  
  
  
  
  
  

  //background(20);
  //translate(width/2, height*.75);
  //angle=0;
  //for (int i=0; i<num; i++) {
  //  stroke(255);
  //  noFill();
  //  sz = i*step;
  //  float offSet = TWO_PI/num*i;
  //  float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
  //  arc(0, 0, sz, sz, PI, arcEnd);
  //}
  //colorMode(RGB);
  //resetMatrix();
  //theta += .0523;

  



  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
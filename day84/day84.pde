/*== DAY 84 == [MON MAR 28 2016] == */
/*
 * "Dot Shuffle"
 * Really busy week, haven't been able to dig in to any deep concepts. Here are some animations instead.
 * Really inspired by FLRN GIF (gif.flrn.nl) right now.
 */

int fCount = 30*3;
int fDiv = 1;

float weight = 18;
int count = 8;

void setup() {
  size(640, 640);
  smooth(3);
  frameRate(30);
  
  colorMode(HSB, 360, 100, 100, 100);
  background(264, 10, 19);
}

void draw() {
  if (frameCount >= fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  
  fill(264, 10, 19, 70);
  noStroke();
  rect(0,0,width,height);
  
  translate(width/2, height/2);
  
  strokeWeight(weight); 
  
  float rot = PI/count;
  float offset = fCount/count;
  for (int i = 0; i < count; i++) {
    rotate(rot);
    
    stroke(map(i, 0, count, 0, 360), 100, 100);
    
    // pairs
    float radX = width*0.3*sin(map(offset*i+frameCount, 0, fCount, 0, TWO_PI));
    float radY = width*0.05*cos(map(offset*i+frameCount, 0, fCount, 0, TWO_PI));
    point(radX, radY);
    
    radX = width*0.3*sin(map(fCount-(offset*i+frameCount), 0, fCount, 0, TWO_PI));
    radY = width*-0.05*cos(map(fCount-(offset*i+frameCount), 0, fCount, 0, TWO_PI));
    point(radX, radY);
  }

    
  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
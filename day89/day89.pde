/*== DAY 90 == [FRI APR 8 2016]x == */
/*
 * "Many Moons"
 * The Moon is my muse.
 */
int fCount = 3*30;
int fDiv = 1;

color backColor = #222222;
color foreColor = #eeeeee;
float rad = 60.0;
float space = 32.0;
float thick = 3.0;
float count = 5;

PImage back;

void setup() {
  size(640, 640);
  smooth(3);
  frameRate(30);
  
  back = loadImage("back.png");

  noStroke();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  //println(frameCount);
  
  background(backColor);
  pushMatrix();

  translate(width/2, height/2);
  float offset = space + rad;
  translate(-offset*(int)(count/2), -offset*(int)(count / 2.0));
  
  //float swing = map(frameCount, 0, fCount, 0, rad);
  float step = rad/count;
  float off = rad-map(frameCount, 0, fCount, 0, 2*rad);
  
  for (int i = 0; i < count; i++) {
    pushMatrix();
    
    float off2 = off;
    for (int j = 0; j < count; j++) {
      
      // back
      noStroke();
      fill(foreColor);
      ellipse(0, 0, rad, rad);

      // inner
      fill(backColor);
      float of = off2;
      while (of < -rad)
        of += rad*2;      
      //ellipse(of, 0, rad, rad);
      float reduce = map(of, 0, -rad, 0, PI/2.0);
      arc(of, 0, rad, rad, -PI+reduce, PI-reduce);
      if (of < 0)
        ellipse(of, 0, of+rad, of+rad);
      
      // outline
      stroke(foreColor);
      strokeWeight(thick);
      noFill();
      ellipse(0, 0, rad, rad);
    
      translate(offset, 0);
      off2 -= step;
      //if (off2 <= 0)
        //off2 = rad;
    }
    popMatrix();
    translate(0, offset);
    off -= step;
  }


  popMatrix();
  blendMode(SCREEN);
  blendMode(LIGHTEST);
  image(back, 0, 0);
  

  // video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
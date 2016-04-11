/*== DAY 91 == [SAT APR 9 2016] == */
/*
 * "Converge to Nothing"
 * On a minimal kick, inspired by FLRN GIF (http://gif.flrn.nl).
 */
int fCount = 5*30;
int fDiv = 2;

PImage back, back2;
color backColor = #eeeeee;
color foreColor = #000000;
float rad;

void setup() {
  size(640, 640);
  smooth(3);
  frameRate(30);
  
  back = loadImage("back.png");
  back2 = loadImage("back2.png");
  noStroke();
  
  rad = width*0.6;
}
  float r = 0;
  

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    r = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  background(backColor);
  pushMatrix();

  translate(width/2, height/2);

  // backdrop circle
  noStroke();
  fill(foreColor);
  ellipse(0, 0, rad, rad);
  
  
  // inner ring cutouts
  
  rotate(map(frameCount, 0, fCount, 0, TWO_PI));
  for (int i = 0; i < 4; i++) {
    rotate(TWO_PI/4.0);
    
    //float r = map(frameCount, 0, fCount-30, 0, rad);
    r = lerp(r, rad+rad*0.1, 0.005);
    
    
    stroke(backColor);
    noFill();
    float weight = map(frameCount, 0, fCount, 0, 36);
    strokeWeight(weight);
    ellipse(rad/2-r/2, 0, r+weight+0.5, r+weight+0.5);
  }


  // give it some texture
  popMatrix();
  blendMode(LIGHTEST);
  image(back, 0, 0);
  blendMode(MULTIPLY);
  image(back2, 0, 0);
  

  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
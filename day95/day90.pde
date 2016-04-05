/*== DAY XX == [XX 2016] == */
/*
 * "???"
 * ???
 */

int fCount = 30*3;
int fDiv = 1;

float weight = 18;
int count = 8;

color back = #18dde6;
color c1 = #0556b2;
color c2 = #fde31b;
color c3 = #f351c0;

void setup() {
  size(800, 800);
  smooth();
  frameRate(30);
  
  //colorMode(HSB, 360, 100, 100, 100);
  background(back);
  noStroke();
  
  noLoop();
}

void draw() {
  if (frameCount >= fCount) {
    frameCount = 0;
    noLoop();
    return;
  }

  
  translate(width/2, height/2);
  
  // anchor canvas with large ellipse
  fill(c1);
  ellipse(0, 0, width*0.4, width*0.4);
  
  // random paint splatter
  for (int i = 0; i < 200; i++) {
    float rad = 64.0*noise(i);
    // randomly choose a large splatter
    if (random(1) > 0.93)
      rad *= 3;
    float ang = TWO_PI*1.5*noise(i+random(1));
    float dist = random(width*0.5)+random(ang);
    
    color c;
    if (random(1) > 0.5)
      c = c2;
    else
      c = c3;
    c = lerpColor(c, color(0,0,0,220), random(1)*0.15);
    fill(c);
    
    pushMatrix();
    rotate(ang);
    translate(dist, 0);
    
    ellipse(0, 0, rad, rad);
    
    popMatrix();
  }

    
  // video
  saveFrame("output.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
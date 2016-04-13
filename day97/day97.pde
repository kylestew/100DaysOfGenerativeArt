/*== DAY 97 == [THR APR 14 2016] == */
/*
 * "Perlin Made Me"
 * Chances are you've encountered Perlin noise multiple times today and didn’t even realize it.
 */

PImage stars;

int count = 40000;
Walker[] walkers = new Walker[count];
float circRad;

void setup() {
  size(1200, 960, P2D);
  smooth(8);
  
  circRad = height*0.2;
  
  // setup walkers
  for (int i = 0; i < count; i++) {
    float x = map(i, 0, count, -100, width+100);
    float ang = map(i, 0, count, 0, TWO_PI);
    walkers[i] = new Walker(new PVector(x, 0), new PVector(0, 1), ang);
  }
  
  //stars = loadImage("stars.jpg");
  //image(stars,0,0);
  background(0);
  
  colorMode(HSB, TWO_PI, 100, 100, 100);
  noFill();
  

  // dail in noise pattern
  //noiseSeed(22);
  //noiseDetail(10, 0.44);
}

void draw() {

  translate(0, height/4.0);
  for (int i = 0; i < count; i++) {
    walkers[i].update();
    walkers[i].draw();
  }
  
  // mirror
  translate(width, height/2.0);
  rotate(PI);
  for (int i = 0; i < count; i++) {
    walkers[i].draw();
  }
  

  // video
  saveFrame("output/frame########.png");
}

class Walker {
  PVector loc;
  PVector vel;
  float hue;
  
  public Walker(PVector loc, PVector vel, float hue) {
    this.loc = loc;
    this.vel = vel;
    this.hue = hue;
  }
  
  public void update() {
    loc.x += vel.x;
    loc.y += vel.y;
    
    vel.x = lerp(vel.x, 15*(noise(loc.x/10.0, loc.y/10.0)-0.455), 0.06);
    vel.y = lerp(vel.y, 15*(noise(loc.y/10.0, loc.x/10.0)-0.45), 0.04);
    
    hue += 0.003;
    if (hue > TWO_PI)
      hue -= TWO_PI;
  }
  
  public void draw() {
    strokeWeight(0.6);
    stroke(hue, 100, 100, 14);
    
    point(loc.x, loc.y);
  }
}
/*== DAY 96 == [THR APR 14 2016] == */
/*
 * "Dyson Planet"
 * 12k walkers doing their random thing on a Dyson ring. 
 * Inspired by @echophon
 * http://echophon.tumblr.com/
 */
int fCount = 12*30;
int fDiv = 1;

PImage stars;

int count = 12000;
Walker[] walkers = new Walker[count];
float circRad;

void setup() {
  size(1200, 960, P2D);
  smooth(8);
  
  circRad = height*0.2;
  
  // setup walkers
  for (int i = 0; i < count; i++) {
    float ang = map(i, 0, count, 0, TWO_PI);
    float x = circRad*sin(ang);
    float y = circRad*cos(ang);
    walkers[i] = new Walker(new PVector(x, y), new PVector(sin(ang), cos(ang)), ang);
  }
  
  stars = loadImage("stars.jpg");
  image(stars,0,0);
  
  colorMode(HSB, TWO_PI, 100, 100, 100);
  noFill();
  

  // dail in noise pattern
  //noiseSeed(22);
  //noiseDetail(8, 0.8);
}

void draw() {

  translate(width/2, height/2);
  for (int i = 0; i < count; i++) {
    walkers[i].update();
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
    
    vel.x = lerp(vel.x, 45*(noise(loc.x, loc.y)-0.465), 0.06);
    vel.y = lerp(vel.y, 45*(noise(loc.y, loc.x)-0.465), 0.04);
  }
  
  public void draw() {
    strokeWeight(0.6);
    stroke(hue, 100, 100, 80);
    
    float rad = abs(dist(0,0,loc.x,loc.y));
    if (abs(circRad-rad) > 9)
      point(loc.x, loc.y);
  }
}
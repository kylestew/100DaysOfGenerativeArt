/*== DAY 81 == [TUE MAR 29 2016] == */
/*
 * "Simple Forms - III"
 * 
 */

int fCount = 15*30;
int fDiv = 4;

color fore = color(24,32,32);
color back = color(255, 255, 255);

ArrayList<Blob> blobs;

void setup() {
  size(640, 640);
  smooth();
  frameRate(30);
  
  // make some blobs
  blobs = new ArrayList<Blob>();
  for (int i = 0; i < 10; i++) {
    float x = random(width);
    float y = random(height);
    PVector vec = new PVector(random(2) - 1.0, random(2) - 1.0);
    float rad = random(200) + 40.0;
    int seed = (int)random(120);
    
    Blob blob = new Blob(x, y, vec, rad, seed);
    blobs.add(blob);
  }
}

void draw() {
  if (frameCount >= fCount) {
   frameCount = 0;
   noLoop();
   return;
  }
  
  
  background(back);
  
  fill(fore);
  noStroke();
  for (Blob blob : blobs) {
    blob.update();
    blob.draw();
  }  
  
  
  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

class Blob {
  float x, y;
  PVector wander;
  float rad;
  int seed;
  
  public Blob(float x, float y, PVector wander, float rad, int seed) {
    this.x = x;
    this.y = y;
    this.wander = wander;
    this.rad = rad;
    this.seed = seed;
  }
  
  public void update() {
    // wander somewhere
    this.x += wander.x;
    this.y += wander.y;
  }
  
  public void draw() {
    pushMatrix();
    
    translate(x, y);
    
    beginShape();
    noiseSeed(seed);
    for (float ang = 0; ang < 360; ang++) {
      float x = sin(radians(ang));
      float y = cos(radians(ang));
      
      x += 0.95*(noise(x*0.5+frameCount/120.0)-0.5);
      y += 1.05*(noise(y*0.5+frameCount/120.0)-0.5);
      
      x *= rad;
      y *= rad;
      
      vertex(x, y);
    }
    endShape();
    
    popMatrix(); 
  }
}
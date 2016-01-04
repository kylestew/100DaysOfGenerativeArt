/*== DAY 44 == [SUN JAN 3 2015] == */
/*
 * "Super Collider - I"
 * Code adapted from Levitated.net Bubble Chamber
 * http://www.levitated.net/p5/chamber/chamber.pde
 */

int fCount = 450;
int fDiv = 4;

int dim = 640;

// rusted desert metal. winter, new mexico
color[] palette = {#3a242b, #3b2426, #352325, #836454, #7d5533, #8b7352, #b1a181, #a4632e, #bb6b33, #b47249, #ca7239, #d29057, #e0b87e, #d9b166, #f5eabe, #fcfadf, #d9d1b0, #fcfadf, #d1d1ca, #a7b1ac, #879a8c, #9186ad, #776a8e};

// style
float strokeWeight = 1.0;
float alphaMult = 4.0;

// particle proportions
int maxMuon = 100;
int maxQuark = 81;
int maxHadron = 60;
int maxAxion = 9;

Muon[] muon = new Muon[maxMuon];
Quark[] quark = new Quark[maxQuark];
Hadron[] hadron = new Hadron[maxHadron];
Axion[] axion = new Axion[maxAxion];

// angle of collision (usually calculated with mouse position)
float collisionTheta;

boolean boom = false;

void setup() {
  size(640, 640);
  background(255);
  noStroke();

  for (int i = 0; i < maxMuon; i++) {
    muon[i] = new Muon(dim/2, dim/2);
  }  
  for (int i = 0; i < maxQuark; i++) {
    quark[i] = new Quark(dim/2, dim/2);
  }
  for (int i = 0; i < maxHadron; i++) {
    hadron[i] = new Hadron(dim/2, dim/2);
  }
  for (int i = 0; i < maxAxion; i++) {
    axion[i] = new Axion(dim/2, dim/2);
  }
  
  collideOne();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  
  if (boom) {
    // initial collision event has occured, ok to move particles...
    for (int i=0; i<hadron.length; i++) {
      hadron[i].move();
    }
    //for (int i = 0; i < muon.length; i++) {
    //  muon[i].move();
    //}
    //for (int i = 0; i < quark.length; i++) {
    //  quark[i].move();
    //}
    //for (int i=0; i<axion.length; i++) {
    //  axion[i].move();
    //}
  }
  
  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

void mousePressed() {
  boom = true;
  // fire 11 of each particle type
  for (int k = 0; k < 11; k++) {
    collideOne();
  }
}

void keyReleased() {
  // reset key
  if (key == ' ') {
    // reset and fire all particles
    boom = true;
    background(255);
    collideAll();
  }
  // capture
  if (key=='s' || key=='S') saveFrame("######.png");
}
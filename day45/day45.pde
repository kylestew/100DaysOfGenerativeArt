/*== DAY 45 == [SUN JAN 4 2015] == */
/*
 * "Super Collider - II"
 * Code adapted from Levitated.net Bubble Chamber
 * http://www.levitated.net/p5/chamber/chamber.pde
 */

int fCount = 300;
int fDiv = 4;

int dim = 640;
int xOrg = dim/2;
int yOrg = dim;
float collisionAngle = radians(-90.0);

// display style
color background = color(0);
float strokeWeight = 1.0;
float alphaMult = 4.0;
// rusted desert metal. winter, new mexico
color[] palette = {#3a242b, #3b2426, #352325, #836454, #7d5533, #8b7352, #b1a181, #a4632e, #bb6b33, #b47249, #ca7239, #d29057, #e0b87e, #d9b166, #f5eabe, #fcfadf, #d9d1b0, #fcfadf, #d1d1ca, #a7b1ac, #879a8c, #9186ad, #776a8e};

// particle proportions
int maxMuon = 100;
int maxQuark = 81;
int maxHadron = 45;
int maxAxion = 9;

Muon[] muon = new Muon[maxMuon];
Quark[] quark = new Quark[maxQuark];
Hadron[] hadron = new Hadron[maxHadron];
Axion[] axion = new Axion[maxAxion];

void setup() {
  size(640, 640);
  background(background);
  noStroke();
  frameRate(30);

  // fill up available particles ready for collision
  //for (int i = 0; i < maxMuon; i++) {
  //  muon[i] = new Muon(xOrg, dim/2);
  //}  
  //for (int i = 0; i < maxQuark; i++) {
  //  quark[i] = new Quark(dim/2, dim/2);
  //}
  for (int i = 0; i < maxHadron; i++) {
    hadron[i] = new Hadron(xOrg, yOrg);
  }
  //for (int i = 0; i < maxAxion; i++) {
  //  axion[i] = new Axion(dim/2, dim/2);
  //}
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
  }
  //println(frameCount);
  
  // random collision events
  if (random(0, 10) > 8) {
    for (int i = 0; i < hadron.length; i++) {
      if (!hadron[i].hasCollided) {
        hadron[i].collide();
        break;
      }
    }
  }
  
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
  
  //// video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  //gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}

void keyReleased() {
  // reset key
  if (key == ' ') {
    // reset and fire all particles
    //boom = true;
    //background(255);
    //collideAll();
  }
  // capture
  if (key=='s' || key=='S') saveFrame("######.png");
}
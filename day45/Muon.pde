// Muon particle
//   the muon is a colorful particle with an entangled friend.
//   draws both itself and its horizontally symmetric partner.
//   a high range of speed and almost no speed decay allow the
//   muon to reach the extents of the window, often forming rings
//   where theta has decayed but speed remains stable.  result
//   is color almost everywhere in the general direction of collision,
//   stabilized into fuzzy rings.

class Muon {
  float x, y;
  float speed;
  float orbitTheta;
  
  
  float speedDecay; 
  float orbitThetaDecay;
  float orbitThetaDecayDecay;
  
  color colP; // particle color
  color colA; // anit-particle
  
  Muon(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void collide() {
    x = dim/2;
    y = dim/2;
    speed = random(2, 32);
    speedDecay = random(0.0001, 0.001);
    
    //orbitTheta = collisionTheta+random(-0.1, 0.1);
    orbitThetaDecay = 0;
    orbitThetaDecayDecay = 0;
    
    // ensure there is decay
    while (abs(orbitThetaDecayDecay) < 0.001) {
      // rate of orbit decay
      orbitThetaDecayDecay = random(-0.1, 0.1);
    }
    
    // color is determined by direction of movement
    int idx = int((palette.length-1)*(orbitTheta+PI)/TWO_PI);
    idx = min(palette.length-1, idx);
    colP = palette[idx];
    colA = palette[palette.length-idx-1];
  }
  
  void move() {
    // draw particle
    tpoint(int(x), int(y), colP, 0.15);
    // draw antiparticle
    tpoint(int(dim-x), int(dim-y), colA, 0.15);
    
    // move
    x += speed*sin(orbitTheta);
    y += speed*cos(orbitTheta);
    // rotate
    orbitTheta += orbitThetaDecay;
    
    // modify spin
    orbitThetaDecay += orbitThetaDecayDecay;
    // modify speed
    speed -= speedDecay;
    
    // don't allow particle to enter extreme offscreen areas
    if ((x<-dim) || (x>dim*2) || (y<-dim) || (y>dim*2)) {
     collide();
    }
  }
}
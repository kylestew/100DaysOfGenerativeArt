// Quark particle
//   the quark draws as a translucent black.  their large numbers
//   create fields of blackness overwritten only by the glowing shadows of Hadrons.
//   quarks are allowed to accelerate away with speed decay values above 1.0
//   each quark has an entangled friend.  both particles are drawn identically,
//   mirrored along the y-axis.

class Quark {
  // position
  float x, y;
  float vx, vy;
  // orbit
  float speed;
  float orbitTheta;
  // decay
  float speedDecay; 
  float orbitThetaDecay;
  float orbitThetaDecayDecay;
  // color
  color col = #000000;
  
  Quark(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void collide() {
    x = dim/2;
    y = dim/2;
    
    speed = random(0.5, 3.0);
    speedDecay = random(0.996, 1.001);
    
    orbitTheta = collisionTheta+random(-0.11, 0.11);
    orbitThetaDecay = 0;
    orbitThetaDecayDecay = 0;
    
    // ensure there is decay
    while (abs(orbitThetaDecayDecay) < 0.00001) {
      // rate of orbit decay
      orbitThetaDecayDecay = random(-0.001, 0.001);
    }
  }
  
  void move() {
    return;
    
    
    //// draw particle
    //tpoint(int(x), int(y), col, 0.12);
    //// draw antiparticle
    //tpoint(int(dim-x), int(y), col, 0.12);
    
    //// move
    //x += vx;
    //y += vy;
    //// turn
    //vx = speed*sin(orbitTheta);
    //vy = speed*cos(orbitTheta);
    
    //orbitTheta += orbitThetaDecay;
    
    //// modify spin
    //orbitThetaDecay += orbitThetaDecayDecay;
    //// modify speed
    //speed *= speedDecay;
    //if (random(1000) > 997) {
    //  speed *= -1;
    //  speedDecay = 2 - speedDecay;
    //}
    
    //// don't allow particle to enter extreme offscreen areas
    //if ((x<-dim) || (x>dim*2) || (y<-dim) || (y>dim*2)) {
    //  collide();
    //}
  }
}
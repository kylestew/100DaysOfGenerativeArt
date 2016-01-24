// Hadron particle
//   hadrons collide from totally random directions.
//   those hadrons that do not exit the drawing area,
//   tend to stabilize into perfect circular orbits.
//   each hadron draws with a slight glowing emboss.
//   the hadron itself is not drawn.
class Hadron {
  public boolean hasCollided = false;
  int startFrame;
  
  PVector pos;
  float startVel;
  float vel;
  float angle;
  
  float velDecayMult;
  float angDecayMult;
  float angDecayDecay;
  
  // TODO: baseline thickness, variability, some lines are more promonent
  
  Hadron(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void collide() {
    hasCollided = true;
    startFrame = frameCount-1; // no div by zero please
    
    // collide particle in random direction and velocity (within tuned range)
    angle = collisionAngle + radians(random(-8,8));
    startVel = random(60, 180);
    
    velDecayMult = random(0.5, 1.2);
    angDecayMult = random(0.0001, 0.005);
    angDecayDecay = 0.00000001;
  }

  void move() {
    if (!hasCollided)
      return;

    // calc movement
    // velocity decay follows inverse asymptote - starts of fast but takes forever to reach 0
    int tick = frameCount - startFrame;
    float vel = startVel * velDecayMult * 1/tick;
    vel = max(0, vel); // don't reverse direction
    
    //float shift = map(vel, 0, 180, 0, 1);
    //color col = color(255, 255-vel*2, 255-vel*2);
    drawBubble(pos, color(255,255,255));
   
    // move
    pos.add(PVector.fromAngle(angle).setMag(vel));
    
    // velocity angle adjusts over time following quadratic curve
    float decay = angDecayMult * tick;
    angle += (angle < collisionAngle) ? -decay : decay;
    angDecayMult -= angDecayDecay;
    if (angDecayMult <= 0) {
      angDecayDecay = -0.0001;
    }
        
    //// random chance of subcollision event
    //if (random(1000)>997) {
    //  // stablize orbit
    //  speedD=1.0;
    //  thetaDD=0.00001;
    //  if (random(100)>70) {
    //    // recollide
    //    x = dim/2;
    //    y = dim/2;
    //    collide();
    //  }
    //}
    
    //// do not allow particle to enter extreme offscreen areas
    //if ((x<-dim) || (x>dim*2) || (y<-dim) || (y>dim*2)) {
    //  collide();
    //}
  }
}
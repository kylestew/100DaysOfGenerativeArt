// Hadron particle
//   hadrons collide from totally random directions.
//   those hadrons that do not exit the drawing area,
//   tend to stabilize into perfect circular orbits.
//   each hadron draws with a slight glowing emboss.
//   the hadron itself is not drawn.
class Hadron {
  // position
  float x, y;
  float prevX, prevY;
  // velocity
  float vx, vy;
  // orbit
  float theta;
  float speed;
  // decay
  float speedD;
  float thetaD;
  float thetaDD;
  color col;
  
  Hadron(float x, float y) {
    this.x = x;
    this.y = y;
    prevX = x;
    prevY = y;
  }
  
  void collide() {
    // initialize all parameters with random collision
    x = dim/2;
    y = dim/2;
    prevX = x;
    prevY = y;
    theta = random(TWO_PI);
    speed = random(0.5, 3.5);

    // decay
    speedD = random(0.996, 1.001);
    thetaD = 0;
    thetaDD = 0;

    // rate of orbit decay
    while (abs(thetaDD) < 0.00001) {
      thetaDD = random(-0.001,0.001);
    }
    col = #00FF00;
  }

  void move() {
    // particle not drawn, instead draw shadow emboss:
    // lighten pixel above hadron
    lpoint(prevX, prevY, x, y, #FFFFFF, 0.11);
    // darken pixel below hadron
    lpoint(prevX, prevY, x, y, #000000, 0.11);

    // move
    prevX = x;
    prevY = y;
    x += vx;
    y += vy;
    
    // turn
    vx = speed*sin(theta);
    vy = speed*cos(theta);
    
    // modify spin
    theta+=thetaD;
    thetaD+=thetaDD;
    
    // modify speed
    speed*=speedD;
    
    // random chance of subcollision event
    if (random(1000)>997) {
      // stablize orbit
      speedD=1.0;
      thetaDD=0.00001;
      if (random(100)>70) {
        // recollide
        x = dim/2;
        y = dim/2;
        collide();
      }
    }
    
    // do not allow particle to enter extreme offscreen areas
    if ((x<-dim) || (x>dim*2) || (y<-dim) || (y>dim*2)) {
      collide();
    }
  }
}
// Axion particle
//   the axion particle draws a bold black path.  axions exist
//   in a slightly higher dimension and as such are drawn with
//   elevated embossed shadows.  axions are quick to stabilize
//   and fall into single pixel orbits axions automatically
//   recollide themselves after stabilizing.

class Axion {
  // position
  float x, y;
  float vx, vy;
  // orbit
  float theta;
  float speed;
  // decay
  float speedD;
  float thetaD;
  float thetaDD;

  Axion(float X, float Y) {
    // constructor
    x = X;
    y = Y;
  }
  
  void collide() {
    // initialize all parameters with random collision
    x = dim/2;
    y = dim/2;
    theta = random(TWO_PI);
    speed = random(1.0,6.0);

    speedD = random(0.998,1.000);
    thetaD = 0;
    thetaDD = 0;

    // rate of orbit decay
    while (abs(thetaDD)<0.00001) {
      thetaDD = random(-0.001,0.001);
    }
  }

  void move() {
    // draw - axions are high contrast
    tpoint(int(x),int(y),#111111,0.62);
    
    // axions cast vertical glows, highlight/shadow emboss
    tpoint(int(x),int(y-1),#EEEEEE,0.11);
    tpoint(int(x),int(y-2),#EEEEEE,0.07);
    tpoint(int(x),int(y-3),#EEEEEE,0.03);
    tpoint(int(x),int(y-4),#EEEEEE,0.01);

    tpoint(int(x),int(y+1),#111111,0.11);
    tpoint(int(x),int(y+2),#111111,0.07);
    tpoint(int(x),int(y+3),#111111,0.03);
    tpoint(int(x),int(y+4),#111111,0.01);

    // move
    x+=vx;
    y+=vy;
    // turn
    vx = speed*sin(theta);
    vy = speed*cos(theta);

    theta+=thetaD;

    // modify spin
    thetaD+=thetaDD;
    // modify speed
    speed*=speedD;
    speedD*=0.9999;
    if (random(1000)>996) {
     // reverse orbit
     speed*=-1;
     speedD=2-speedD;
     if (random(100)>30) {
       x = dim/2;
       y = dim/2;
       collide();
     }
    }
  }
}
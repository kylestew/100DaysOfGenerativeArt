void collideOne() {
  // eject a single particle, relative to position
  int t;
  //collisionTheta = atan2(dim/2-mouseX, dim/2-mouseY);
  
  // choose a set of hadron particles to recollide
  if (hadron.length > 0) {
    t = int(random(hadron.length));
    hadron[t].collide();
  }
  
  // choose a set of quark particles to recollide
  if (quark.length > 0) {
    t = int(random(quark.length));
    quark[t].collide();
  }
  
  // choose a set of muon particles to recollide
  if (muon.length > 0) {
    t = int(random(muon.length));
    muon[t].collide();
  }
}

void collideAll() {
  // random collision angle
  //collisionTheta = random(TWO_PI);

  // particle super collision
  if (hadron.length > 0) {
    for (int i = 0; i < maxHadron; i++) {
      hadron[i].collide();
    }
  }
  if (quark.length > 0) {
    for (int i = 0; i < maxQuark; i++) {
      quark[i].collide();
    }
  }
  if (muon.length > 0) {
    for (int i = 0; i < maxMuon; i++) {
      muon[i].collide();
    }
  }
  if (axion.length > 0) {
    for (int i = 0; i < maxAxion; i++) {
      axion[i].collide();
    }
  }
}

void drawBubble(PVector pos, color col) {
  stroke(col);
  strokeWeight(2);
  point(pos.x, pos.y);
}

void tpoint(int x1, int y1, color c, float a) {
  // alpha blend color with background
  color bg = get(x1, y1); 
  int r = int(red(bg) + (red(c) - red(bg)) * a);
  int g = int(green(bg) +(green(c) - green(bg)) * a);
  int b = int(blue(bg) + (blue(c) - blue(bg)) * a);
  
  stroke(color(r, g, b));
  point(x1, y1);
}

void lpoint(float x0,float y0, float x1, float y1, color c, float a) {
  // alpha blend color with background
  color bg = get((int)x1, (int)y1); 
  float alp = a * alphaMult;
  int r = int(red(bg) + (red(c) - red(bg)) * alp);
  int g = int(green(bg) +(green(c) - green(bg)) * alp);
  int b = int(blue(bg) + (blue(c) - blue(bg)) * alp);
  
  strokeWeight(strokeWeight);
  stroke(color(r, g, b));
  line(x0, y0, x1, y1);
}
class Walker {
  public PVector pos;
  public PVector posLast;
  float stepSize;
  float strokeWidth;
  
  float noiseScale;
  float noiseStrength;
  float noiseZ;
  float noiseZVelocity = 0.005;

  Walker(PVector position, float strokeWidth, float noiseScale, float noiseStrength) {
    pos = position;
    posLast = new PVector(pos.x, pos.y);
    stepSize = random(1, 3);
    
    this.strokeWidth = strokeWidth;

    this.noiseScale = noiseScale;
    this.noiseStrength = noiseStrength;
    
    setNoiseZRange(0.6);
  }

  void update() {
    float angle = noise(pos.x/noiseScale, pos.y/noiseScale, noiseZ) * noiseStrength;

    pos.x += cos(angle) * stepSize;
    pos.y += sin(angle) * stepSize;

  //  // offscreen wrap
  //  if (p.x<-10) p.x=pOld.x=width+10;
  //  if (p.x>width+10) p.x=pOld.x=-10;
  //  if (p.y<-10) p.y=pOld.y=height+10;
  //  if (p.y>height+10) p.y=pOld.y=-10;
  
    noiseZ += noiseZVelocity;
  }
  
  void draw() {
    strokeWeight(strokeWidth*stepSize);
    line(posLast.x, posLast.y, pos.x, pos.y);

    posLast.set(pos);
  }

// MODE 2 has different angle code
  //void update2(){
  //  angle = noise(p.x/noiseScale ,p.y/noiseScale, noiseZ) * 24;
  //  angle = (angle - int(angle)) * noiseStrength;

  void setNoiseZRange(float theNoiseZRange) {
   // small values will increase grouping of the agents
   noiseZ = random(theNoiseZRange);
  }
}
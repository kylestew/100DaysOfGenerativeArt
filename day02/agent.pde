class Agent {
  
  float centerX;
  float centerY;
  float radius;
  color mColor;
  float rotation;
  float followSpeed = 1;
  //float rotVelocity;
  
  Agent(float cX, float cY, float rad, color col) {
    centerX = cX;
    centerY = cY;
    radius = rad;
    mColor = col;
  }
  
  void update() {
  }
  
  void display() {
    pushMatrix();
    
    fill(mColor);
    stroke(mColor);
    strokeWeight(14.0);
    strokeJoin(ROUND);
    
    // set rotation
    translate(centerX, centerY);
    rotate(rotation-PI/2);
    translate(-centerX, -centerY);
    
    beginShape();
    vertex(centerX+radius, centerY);
    vertex(centerX, centerY+radius);
    vertex(centerX-radius, centerY);
    vertex(centerX, centerY-radius);
    endShape(CLOSE);

    popMatrix();
  }
  
}
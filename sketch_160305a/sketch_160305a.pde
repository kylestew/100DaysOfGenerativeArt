
float angle = 0.0;
float speed = 0.005;

void setup() {
  size(640, 640);
  noFill();
}

void draw() {
  float l0 = map(mouseX, 0, width, 10, 300);
  float l1 = map(mouseY, 0, height, 10, 300);
  
  background(255);
  
  translate(width/2, height/2);
  rotate(angle);
  for (int i = 0; i<5; i++) {
    pushMatrix();
    
    rotate(i*TWO_PI/5);
    translate(0, l0);
    ellipse(0, 0, 20, 20);
    
    rotate(angle);
    for (int j = 0; j<5; j++) {
      pushMatrix();
      
      rotate(j*TWO_PI/5);
      translate(0, l1);
      ellipse(0, 0, 20, 20);
      
      rotate(angle);
      for (int k = 0; k < 5; k++) {
        pushMatrix();
        
        rotate(k*TWO_PI/5);
        translate(0, 50);
        ellipse(0, 0, 20, 20);
        
        popMatrix();
      }
      
      popMatrix();
    }
    
    popMatrix();
  }
  
  angle += speed;
}


void setup() {
  size(600, 600, OPENGL);
}

void draw() {
  background(255);
  smooth();
  noFill();
  
  randomSeed(0);
  
  stroke(color(0), 180);
  strokeWeight(3);
  
  for (int gridY = 0; gridY < width; gridY += 25) {
    for (int gridX = 0; gridX < width; gridX += 25) {
      
      float diam = dist(mouseX, mouseY, gridX, gridY);
      diam = diam / 500 * 40;
      
      pushMatrix();
  
        translate(gridX, gridY, diam * 5);    
        ellipse(0, 0, diam, diam);
      
      popMatrix();
    }
  }
}


int tileCount = 20;
int actRandomSeed = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
//  smooth();
  stroke(255);
  
  randomSeed(actRandomSeed);
  
  for (int gridY = 0; gridY < tileCount; gridY++) {
    for (int gridX = 0; gridX < tileCount; gridX++) {
      
      int posX = width/tileCount * gridX;
      int posY = height/tileCount * gridY;
      
      int toggle = (int)random(0,2);
      
      if (toggle == 0) {
        
        line(posX, posY, posX + width / tileCount, posY + height / tileCount);
        
      } else {
        
        line(posX, posY + width / tileCount, posX + height / tileCount, posY);
        
      }
      
      
    }
  }
  
}

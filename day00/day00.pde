/*== DAY 00 == [SAT OCT 31 2015] == */
/*
 * "Waves of emojion"
 * Perlin noise drives states of a grid of emotion giving predictable random
 * emotional waves across the screen.
 */

PImage[] sprites = new PImage[7];

int tileCount = 20;
float tileSize;
float tilePadding = 0;
float spriteSize;
float damp = 4;
float speed = -0.015;
float size = 1.2;

void setup() {
  size(640, 640);
  smooth();
  
  tileSize = floor(width/tileCount);
  spriteSize = tileSize - tilePadding; //<>//
   //<>//
  for (int i = 0; i < sprites.length; i++) { 
    sprites[i] = loadImage("emoji" + (i + 1) + ".png");
  }
}

void draw() {
  background(24);
  
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      // base center point in grid
      float posX = tileSize*gridX + tileSize/2;
      float posY = tileSize*gridY + tileSize/2;
      
      float granularity = width * size; // really pull down the precision of the noise texture
      int idx = (int)(noise(posX / granularity + frameCount * speed, posY / granularity + frameCount * speed) * 7);
      if (idx >= sprites.length) idx = 0; // don't break
      
      // map emoji style to scaling
      float scale = map(idx, 0, 6, 0.8, 1.2);
  
      pushMatrix();
      translate(posX, posY);
      scale(scale, scale);
      
      imageMode(CENTER);
      image(sprites[idx], 0, 0, spriteSize, spriteSize);
      
      popMatrix();
    }
  }
  
  // video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 10 == 0 && frameCount < 140) saveFrame("output/frame####.gif");
}
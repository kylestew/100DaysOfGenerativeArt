

float tileCountX = 6;
float tileCountY = 6;
float tileWidth, tileHeight;

PImage eye;

void setup() {
  size(640, 640, OPENGL);
  tileWidth = width / tileCountX;
  tileHeight = width / tileCountY;
  
  noiseSeed((long)random(100));
//  noiseDetail(0.1);

  eye = loadImage("eyeball.png");
}

void draw() {
  smooth();
  noFill();
  strokeWeight(1.5);
  background(255);
  
  translate((width/tileCountX)/2, (height/tileCountY)/2);
  
  float timeOffset = frameCount / 70.0f;
  
  for (int gridY=0; gridY<=tileCountY; gridY++) {
    for (int gridX=0; gridX<=tileCountX; gridX++) {
      pushMatrix();
      translate(tileWidth * gridX, tileHeight * gridY);
      
      stroke(0, 198);

      // draw barnicle
      int circleCount = 9;
      float endSize = noise(gridX * 0.5 + timeOffset, gridY * 0.5 + timeOffset) * 80;
      float endOffsetX = map(noise(gridY * 0.5 + timeOffset, gridX * 0.5 + timeOffset), 0, 1, -tileWidth/2.5f, tileWidth/2.5f);
      float endOffsetY = map(noise(gridX * 0.5 + timeOffset, gridY * 0.5 + timeOffset), 0, 1, -tileWidth/2.5f, tileWidth/2.5f);
      
      float finalX = 0;
      float finalY = 0;
      float finalW = 0;
      for (int i = 0; i < circleCount; i++) {
        float diam = map(i, 0, circleCount-1, tileWidth, endSize);
        float offsetX = map(i, 0, circleCount-1, 0, endOffsetX);
        float offsetY = map(i, 0, circleCount-1, 0, endOffsetX);
        ellipse(offsetX, offsetY, diam, diam);
        
        finalX = offsetX;
        finalY = offsetY;
        finalW = diam;
      }
      
      beginShape();
      texture(eye);
      noStroke();
      vertex(finalX - finalW/2, finalY - finalW/2, 0, 0, 0);
      vertex(finalX + finalW/2, finalY - finalW/2, 0, 100, 0);
      vertex(finalX + finalW/2, finalY + finalW/2, 0, 100, 100);
      vertex(finalX - finalW/2, finalY + finalW/2, 0, 0, 100);
      endShape();

      
      popMatrix();
    }
  }
  
  saveFrame("out/frame########.png");
}

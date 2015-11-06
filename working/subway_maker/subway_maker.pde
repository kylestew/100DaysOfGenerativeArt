
float tileSize = 10;
int gridResolutionX, gridResolutionY;
boolean drawGrid = true;
PFont font;

char[][] tiles;
color[][] tileColors;

PShape[] tileSetA;
String tileSet;

PVector walker0, walker1, walker2, walker3;

void setup() {
  size(600, 600);
  smooth();
  frameRate(30);

  font = createFont("sans-serif", 8);
  textFont(font, 8);
  textAlign(CENTER, CENTER);

  gridResolutionX = round(width/tileSize)+1;
  gridResolutionY = round(height/tileSize)+1;
  tiles = new char[gridResolutionX][gridResolutionY];
  tileColors = new color[gridResolutionX][gridResolutionY];
  initTiles();

  // starting position for walker
  walker0 = new PVector(gridResolutionX/4, gridResolutionY/4);
  walker1 = new PVector(3*gridResolutionX/4, gridResolutionY/4);
  walker2 = new PVector(gridResolutionX/4, 3*gridResolutionY/4);
  walker3 = new PVector(3*gridResolutionX/4, 3*gridResolutionY/4);

  tileSetA = new PShape[16];
  tileSet = "E";
  for (int i=0; i<tileSetA.length; i++) {
    tileSetA[i] = loadShape(tileSet + "_" + nf(i, 2) + ".svg");
    tileSetA[i].disableStyle();
  }
}

void draw() {
  background(360);

  drawGrid();
  drawTiles();

  walk(walker0);
  walk(walker1);
  walk(walker2);
  walk(walker3);
}

void initTiles() {
  for (int gridY=0; gridY<gridResolutionY; gridY++) {
    for (int gridX=0; gridX<gridResolutionX; gridX++) {
      tiles[gridX][gridY] = '0';
//      tileColors[gridX][gridY] = color(random(255), 0, random(255));
      tileColors[gridX][gridY] = color(255);
    }
  }
}

void drawGrid() {
  rectMode(CENTER);
  for (int gridY=0; gridY<gridResolutionY; gridY++) {
    for (int gridX=0; gridX<gridResolutionX; gridX++) {
      float posX = tileSize*gridX - tileSize/2;
      float posY = tileSize*gridY - tileSize/2;
      strokeWeight(0.15);
      fill(360);
      stroke(0);
      noFill();
      rect(posX, posY, tileSize, tileSize);
    }
  }
}

void drawTiles() {
  shapeMode(CENTER);
  for (int gridY=0; gridY<gridResolutionY; gridY++) {
    for (int gridX=0; gridX<gridResolutionX; gridX++) {
      // only need to do work on set tiles
      char currentTile = tiles[gridX][gridY];
      if (currentTile != '0') {
        String binaryResult = "";
        // binaryResult = north + west + south + east
        // north
        if (gridX > 0 && gridY > 0 && tiles[gridX][gridY-1] != '0') 
          binaryResult = "1";
        else 
          binaryResult = "0";
        // west
        if (gridY > 0 && gridX > 0 && tiles[gridX-1][gridY] != '0') 
          binaryResult += "1";
        else 
          binaryResult += "0";
        // south
        if (gridY+1<gridResolutionY && tiles[gridX][gridY+1] != '0') 
          binaryResult += "1";
        else 
          binaryResult += "0";
        // east
        if (gridX+1<gridResolutionX && tiles[gridX+1][gridY] != '0') 
          binaryResult += "1";
        else 
          binaryResult += "0";

        // convert the binary string to a decimal value from 0-15
        int decimalResult = unbinary(binaryResult);

        // draw the determined tile
        float posX = tileSize*gridX - tileSize/2;
        float posY = tileSize*gridY - tileSize/2;
        fill(tileColors[gridX][gridY]);
        noStroke();

        shape(tileSetA[decimalResult], posX, posY, tileSize, tileSize);

        fill(150);
//        text(currentTile+"\n"+decimalResult+"\n"+binaryResult,posX,posY);
      }
    }
  }
  
  saveFrame("out/frame########.png");
}

void walk(PVector walker) {
  // given current position, determine direction to "walk"
  tiles[(int)walker.x][(int)walker.y] = 'A';
  
  // pick a random direction
  int direction = (int)(noise(frameCount) * 9);
//  int direction = (int)random(0,8);
  println("dir: " + direction);
  if (direction == 0) {
    // N
    walker.y--;
  } else if (direction == 1) {
    // NE
    walker.y--;
    walker.x++;
  } else if (direction == 2) {
    // E
    walker.x++;
  } else if (direction == 3) {
    // SE
    walker.y++;
    walker.x++;
  } else if (direction == 4) {
    // S
    walker.y++;    
  } else if (direction == 5) {
    // SW
    walker.y++;    
    walker.x--;
  } else if (direction == 6) {
    // W
    walker.x--;    
  } else if (direction == 7) {
    // NW
    walker.x--;
    walker.y--;    
  }
  
  // don't fall off the map
  if (walker.x >= gridResolutionX) walker.x = gridResolutionX - 1;
  if (walker.x < 0) walker.x = 0;
  if (walker.y >= gridResolutionY) walker.y = gridResolutionY - 1;
  if (walker.y < 0) walker.y = 0;
}


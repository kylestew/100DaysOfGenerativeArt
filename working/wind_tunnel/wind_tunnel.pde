import generativedesign.*;
import processing.xml.*;

int xCount = 601;
int yCount = 61;
float gridSize = 600;
int attractorCount = 6;

Node[] nodes = new Node[xCount*yCount];
Attractor[] attractors = new Attractor[attractorCount];

void setup() {
  size(800, 800);
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  noStroke();
  fill(0);
  
  reset();
}

void reset() {
  for (int i = 0; i < attractorCount; i++) {
    attractors[i] = new Attractor(random(0, width), random(0, height));
    attractors[i].setMode((int)random(3));
    
    attractors[i].setMode(2);
    
    attractors[i].radius = random(width/8, width/2);
    attractors[0].strength = random(0, 2);
    attractors[0].ramp = random(0, 1);
  }
  
  
  int i = 0;
  for (int y = 0; y < yCount; y++) {
    for (int x = 0; x < xCount; x++) {
      float xPos = x*(gridSize/(xCount-1))+(width-gridSize)/2;
      float yPos = y*(gridSize/(yCount-1))+(height-gridSize)/2;
      
      nodes[i] = new Node(xPos, yPos);
      nodes[i].setBoundary(0, 0, width, height);
      nodes[i].setDamping(0.2);
      
      for (int j = 0; j < attractors.length; j++) {
        attractors[j].attachNode(nodes[i]);
      }

      i++;
    }
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < attractors.length; i++) {
    attractors[i].attract();
  }
  
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].update();
    
    rect(nodes[i].x, nodes[i].y, 1, 1);
  }
  
  saveFrame("out/frame########.png");
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reset();
  }
}



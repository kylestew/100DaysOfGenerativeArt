import generativedesign.*;
import processing.xml.*;
import org.philhosoft.p8g.svg.*;

P8gGraphicsSVG svg;

float gridSize = 600;
int lineSegments = (int)(gridSize / 4.0f);
int lines = 61;
int attractorCount = 6;

Node[] nodes = new Node[lineSegments*lines];
Attractor[] attractors = new Attractor[attractorCount];

void setup() {
  size(800, 800);
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  stroke(0);
  noFill();
  frameRate(10);
  
  svg = (P8gGraphicsSVG)createGraphics(width, height, P8gGraphicsSVG.SVG, "output.svg");
  beginRecord(svg);
  
  reset();
}

void reset() {
  // setup attractors
  for (int i = 0; i < attractorCount; i++) {
    attractors[i] = new Attractor(random(0, width), random(0, height));
    attractors[i].setMode((int)random(3));
    
    attractors[i].setMode(2);
    
    attractors[i].radius = random(width/8, width/2);
    attractors[0].strength = random(0, 2);
    attractors[0].ramp = random(0, 1);
  }
  
  // setup lines (or points on each line)
  int i = 0;
  for (int y = 0; y < lines; y++) {
    for (int x = 0; x < lineSegments; x++) {
      float xPos = x*(gridSize/(lineSegments-1))+(width-gridSize)/2;
      float yPos = y*(gridSize/(lines-1))+(height-gridSize)/2;
      
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
  g.background(255);
  
  svg.clear();
  svg.beginDraw();
  
  for (int i = 0; i < attractors.length; i++) {
    attractors[i].attract();
  }
  
  // update all nodes
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].update();
  }

  // draw lines
  for (int line = 0; line < lines; line++) {
    
    // each line is an individual element
    beginShape();
  noFill();
    
    for (int seg = 0; seg < lineSegments; seg++) {      
      Node n0 = nodes[line * lineSegments + seg];
      vertex(n0.x, n0.y);
    }
    
    endShape();
    
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reset();
  }
  
  if (key == 's') {
    svg.endRecord();
  }
}



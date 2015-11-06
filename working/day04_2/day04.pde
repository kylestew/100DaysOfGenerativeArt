/*== DAY 04 == [WED NOV 4 2015] == */
/*
 * ""
 * Attractors used to bend lines in a wind tunnel or contoured mapped style
 */
import generativedesign.*;

boolean running = true;

int fCount = 80;
int fRate = 20; // 4 sec

float gridSize = 600;
int lineSegments = (int)(gridSize / 1);
int lines = 64;
float strength = 12;

Node[] nodes = new Node[lineSegments*lines];
Attractor attractor;

void setup() {
  size(640, 640);
  smooth();
  stroke(0);
  strokeWeight(1);
  noFill();
  
  frameRate(frameRate);
  
  reset();
}

void reset() {
  // setup attractor
  attractor = new Attractor(width/2, height/2);
  attractor.setMode(2);
  attractor.radius = random(width / 2, width / 2);
  attractor.strength = strength;
  attractor.ramp = 0.5;
  
  // setup lines (or points on each line)
  int i = 0;
  for (int y = 0; y < lines; y++) {
    for (int x = 0; x < lineSegments; x++) {
      float xPos = x*(gridSize/(lineSegments-1))+(width-gridSize)/2;
      float yPos = y*(gridSize/(lines-1))+(height-gridSize)/2;
      
      nodes[i] = new Node(xPos, yPos);
      nodes[i].setBoundary(0, 0, width, height);
      nodes[i].setDamping(0.2);
      
      attractor.attachNode(nodes[i]);

      i++;
    }
  }
}

void draw() {
  println("frame: " + frameCount);
  if (frameCount > fCount/2)
    return;
  //if (!running)
   //return;


   background(255);
   
   attractor.attract();
  
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
   
   //if (frameCount >= 40) {
   //  attractor.strength = -strength;
   //  attractor.ramp = 1;
   //}
   
   //println();
   //if (frameCount % 44 == 0)
   //  reset();

  //// video
  //saveFrame("output/frame########.png");
  //// gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
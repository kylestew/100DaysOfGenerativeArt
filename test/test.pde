OPC opc;

void setup() {
  size(16, 16);
  frameRate(30);
  
  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map an 8x8 grid of LEDs to the center of the window
  opc.ledGrid8x8(0, width/2.0, height/2.0, 2, 0, false);
}

void draw() {
  
  background(0);
  
//  noStroke();
  fill(255, 100);
  stroke(255, 100);
  line(0,0,16,16);
  line(0,16,16,0);
//  rect(2,2,2,2);
}

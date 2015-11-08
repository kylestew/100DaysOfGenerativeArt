/*== DAY 08 == [SUN NOV 8 2015] == */
/*
 * "Sine Accordian"
 * Stacks of varrying sine waves over time
 */

float fRate = 30;
float fCount = 102 * 4 + 4;
float fDiv = 3; // 90 frames

float speedMult = 3.5;

void setup() {
  size(640, 640);
  smooth();

  frameRate(fRate);
  
  strokeWeight(6);
  stroke(255);
  strokeJoin(ROUND);
}

void draw() {
  if (frameCount > fCount)
    noLoop();
  //println(frameCount);
  
  background(40);
  for (int i = 0; i <= 10; i++) {
    float y = i*30;
    
    // color/stroke based on depth
    fill(0, map(i, 0, 5, 245, 140), map(i, 0, 5, 245, 140));
    
    beginShape();
    vertex(0, height/2+y);
    for (int q = 0; q <= width; q+= 10) {
      float y2 = height/4 + y + (sin(radians(q + frameCount * speedMult)) - cos(radians(q - frameCount * speedMult)) * map(i + sin(radians(q)), 0, 5, 100, 20));
      vertex(q, y2);
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
  }
   //<>//
  //// video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
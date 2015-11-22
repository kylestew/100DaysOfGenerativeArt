/*== DAY 15 == [MON NOV 16 2015] == */
/*
 * "Entanglement"
 * 
 * Original idea: http://www.openprocessing.org/sketch/162660
 */

int fCount = 340;
int fRate = 30; // 4 sec

float num = 0;

void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);
  background(0);
  noStroke();
} //<>//

void draw() {
  if (frameCount > fCount)
    return;
  println("frame: " + frameCount);
   
  // grow color from blue to red
  fill(30+abs(num)/1, 19, 230-abs(num)/1, 88);
  
  translate(width/2, height/2);
  rotate(radians(num));
  for (int i = 0; i < 360; i += 12) {
    float x = sin(radians(i)) * num * 2;
    float y = cos(radians(x)) * num * 2;
    
    circleAtPoint(x, y, 1 + abs(num)/36);
    circleAtPoint(y, x, 1 + abs(num)/36);
    circleAtPoint(-x, -y, 1 + abs(num)/36);
    circleAtPoint(-y, -x, 1 + abs(num)/36);
  }
  num += 0.9;


  //// video
  //saveFrame("output/frame########.png");
  //// gif
  //if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}

void circleAtPoint(float x, float y, float rad) {
  rad = max(rad, 2);
  ellipse(x-rad/2,y-rad/2,rad,rad);
}
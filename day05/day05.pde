/*== DAY 05 == [THUR NOV 5 2015] == */
/*
 * "Diminishing Returns"
 * Triangles and sine waves make up this design
 * Inspired by Michael Pinn - http://www.openprocessing.org/sketch/202620
 */

float fRate = 30;
float fCount = 31 * 4 - 12; // 31 for gifs 
float fDiv = 2; // 

float s = 7;
float angle = 180/(s); // angle is 180 / (s) with number divisable by 10 for a mesh effect

void setup() {
  size(640, 420);
  smooth();

  fill(135, 88, 252);

  frameRate(fRate);
}

void draw() {
  if (frameCount > fCount)
    noLoop();
  println(frameCount);
  background(0);
  
  translate(width/2, height/2);
  for (int x = -300; x <= 300; x+=s) {
    for (int y = -200; y <= 200; y+=s) {
      strokeWeight(map(sin(radians(dist(x, y, 0, 0)*2+frameCount*12)), -1, 1, 1, s));
      pushMatrix();
      translate(x, y);
      rotate(radians(x*angle+(y*angle)));
      
      triangle(-s, s, 0, -s, s, s);
      popMatrix();
    }
  }
  
  //// video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
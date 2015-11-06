/*== DAY 01 == [SUN NOV 1 2015] == */
/*
 * "Pinwheel"
 * Originally wanted to do an oscilation, but constant spinning rotates on shapes was cooler.
 */

color[] colors = new color[6];

boolean running = true;
int baseShapeSize = 24;
int shapeGrowth = 24;
//float maxRot = PI;
float maxRot = PI/2;
float rotSpeed = 0.017;

void setup() {
  size(640, 640);
  smooth();

  colors[0] = color(40,206,186);
  colors[1] = color(0);
  colors[2] = color(255);
  colors[3] = color(0);
  colors[4] = color(247,84,131);
  colors[5] = color(0);
}

void draw() {
  if (!running)
    return;
    
  background(255);
  
  pushMatrix();

  float x = width/2;
  float y = height/2;
  int clr = 3;
  for (float size = width; size >= baseShapeSize; size -= shapeGrowth) {
    // cycle colors
    if (clr >= colors.length) clr = 0;
    fill(colors[clr]);
    stroke(colors[clr]);
    strokeWeight(14.0);
    strokeJoin(ROUND);
    clr++;
    
    // additive rotation
    translate(x,y);
    float rot = frameCount*rotSpeed;
    if (rot >= maxRot)
      running = false;
    rotate(rot);
    translate(-x,-y);
    
    beginShape();
    vertex(x+size, y);
    vertex(x, y+size);
    vertex(x-size, y);
    vertex(x, y-size);
    endShape(CLOSE);
  }
  
  popMatrix();

  // video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % 3 == 0 && frameCount < 200) saveFrame("output/frame####.gif");
}
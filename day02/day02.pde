/*== DAY 02 == [MON NOV 2 2015] == */
/*
 * "Infinite Wobbles"
 * Variation on DAY01, infinite repeating wobble using sine oscillation
 */

boolean running = true;

Agent[] agents = new Agent[24];
color[] colors = new color[6];
int baseShapeSize = 24;
int shapeGrowth = 28;
float rotSpeed = 0.085;
float maxFrames = 74*4;

void setup() {
  size(640, 640);
  smooth();

  colors[0] = color(40,206,186);
  colors[1] = color(0);
  colors[2] = color(255);
  colors[3] = color(0);
  colors[4] = color(247,84,131);
  colors[5] = color(0);
  
  // create agents
  float x = width/2;
  float y = height/2;
  float size = baseShapeSize;
  int clr = 0;
  for(int i = 0; i < agents.length; i++) {
    if (clr >= colors.length) clr = 0;
    agents[i] = new Agent(x, y, size, colors[clr++]);
    size += shapeGrowth;
  }
}

void draw() {
  if (frameCount > maxFrames)
    running = false;
  if (!running)
    return;
    
  background(255);
   
  for(int i = 0; i < agents.length; i++) {
    agents[i].rotation = sin((i - frameCount) * rotSpeed);
  }

  // draw stacking backwards
  for(int i = agents.length - 1; i >= 0; i--) {
    agents[i].display();
  }

  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % 4 == 0 && frameCount < 200) saveFrame("output/frame####.gif");
}
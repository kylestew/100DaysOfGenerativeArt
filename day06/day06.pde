/*== DAY 06 == [FRI NOV 6 2015] == */
/*
 * "Free Agents"
 * A legion of random walkers
 * From "M_1_5_03_TOOL" in Generative Gestaltung
 */
import generativedesign.*;


float fRate = 30;
float fCount = 200; // 
float fDiv = 12; // 

Agent[] agents = new Agent[10000];
int agentsCount = 10000;
float noiseScale = 200;
float noiseStrength = 40;
float noiseZRange = 0.9;
float overlayAlpha = 0;
float agentsAlpha = 33;
float strokeWidth = 0.2;
int drawMode = 1; // 1-2

void setup() {
  size(640, 640, P2D);
  smooth();
  
  for(int i=0; i<agents.length; i++) 
    agents[i] = new Agent();

  frameRate(fRate);
}

void draw() {
  if (frameCount > fCount)
    noLoop();
  //println(frameCount);
  
  noStroke();
  fill(255,255,255,4);
  rect(0, 0, width, height);
  
  stroke(0, agentsAlpha);
  if (drawMode == 1) {
    for (int i = 0; i < agentsCount; i++)
      agents[i].update1();
  } else {
    for (int i = 0; i < agentsCount; i++)
      agents[i].update2();
  }

  //// video
  //saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
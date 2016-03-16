/*== DAY 66 == [MON MAR 14 2016] == */
/*
 * "Wolfram Shuffle"
 * I hope this doesn't hurt anyones eyes. 
 * 1 dimensional wolfram automata with changing rulesets
 */
int fCount = 15*10;
int fDiv = 4;

CA ca;

void setup() {
  size(640, 640);
  frameRate(10);
  background(255);
  
  //int[] ruleset = {0,1,1,1,1,0,1,1};
 //int[] ruleset = {0,1,1,1,1,1,0,1};
 int[] ruleset = {0,1,1,1,1,0,0,0};
  //int[] ruleset = {0,1,1,1,0,1,1,0};
  
  ca = new CA(ruleset, width/32);
  //ca.randomize();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  
  ca.display(color(36, 12, 70), color(229, 26, 122));
  ca.generate();
  
  if (frameCount%12 == 0)
    ca.randomize();
    
  // video
  saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
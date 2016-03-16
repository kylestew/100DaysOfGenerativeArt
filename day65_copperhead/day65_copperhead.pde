/*== DAY 65 == [SUN MAR 13 2016] == */
/*
 * "Copperhead"
 * Someone discovered a new spaceship pattern in Conway's game of life. 
 * Big day for fans of cellular automata  
 * http://www.conwaylife.com/forums/viewtopic.php?f=2&t=2057
 */
int fRate = 6;
int fCount = 12*fRate-5;
int fDiv = 1;

GOL gol;

void setup() {
  size(640, 640);
  frameRate(fRate);
  
  gol = new GOL(width/20);
  gol.init();
  
  gol.loadTrans(5, 6);
  gol.load(4,0);
  gol.load(5,0);
  gol.load(3,1);
  gol.load(4,1);
  gol.load(5,1);
  gol.load(6,1);
  
  gol.load(2,3);
  gol.load(3,3);
  gol.load(4,3);
  gol.load(5,3);
  gol.load(6,3);
  gol.load(7,3);

  gol.load(3,4);
  gol.load(4,4);
  gol.load(5,4);
  gol.load(6,4);
  
  gol.load(2,6);
  gol.load(3,6);
  gol.load(6,6);
  gol.load(7,6);
  
  gol.load(0,7);
  gol.load(1,7);
  gol.load(3,7);
  gol.load(6,7);
  gol.load(8,7);
  gol.load(9,7);
  
  gol.load(3,8);
  gol.load(6,8);
  
  gol.load(4,11);
  gol.load(5,11);
  gol.load(4,12);
  gol.load(5,12);
}

void draw() {
  if (frameCount > fCount) {
   //frameCount = 0;
   //noLoop();
   return;
  }
  println(frameCount);
  
  
  background(255);

  gol.generate();
  gol.generate();
  gol.generate();
  gol.display(color(36, 12, 70), color(229, 26, 122));

    
  // video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
/*== DAY 10 == [MON NOV 9 2015] == */
/*
 * "Strange Attractions - II"
 * Actually a DeJong Attractor, not sure if thats a different class
 * http://paulbourke.net/fractals/peterdejong/
 * http://www.openprocessing.org/sketch/2097
 */

//float fRate = 2;
//float fCount = 12;
//float fDiv = 1;

deJongAttractor deJong;

void setup() {
//  size(1200, 1200);
  size(320, 320);
  smooth();

  //frameRate(fRate);
  
  deJong = new deJongAttractor();
  //deJong.setup(width, 12, 1.2, -1.4, 1.4, -1.2);
  deJong.setup(width, 2, -2, -2, -1.2, 2.1);
}

void draw() {
  //if (frameCount > fCount)
    //noLoop();
  //println(frameCount);
  
  image(deJong.plotImage(), 0, 0, width, height);
  print("complete");
  noLoop();
   //<>//
  //saveFrame("output/frame########.png");
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
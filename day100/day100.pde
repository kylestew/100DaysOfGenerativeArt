/*== DAY 100 == [MON APR 18 2016] == */
/*
 * "End of the Universe" [3 part post]
 * I've learned a lot creating #100DaysOfGenerativeArt. Now I'm looking forward to focusing deeper on each theme. 100 days gave me the chance to try out many ideas. Now I have the time to go deep on the best ones. Stay tuned for more!
 */
int fCount = 5*30;
int fDiv = 6;

Forms forms;

void setup() {
  size(640, 640, P2D);
  smooth(8);
  colorMode(RGB, 255, 255, 255, 1);

  // pick forms
  //forms = new FlowerOfLife();
  //forms = new MetatronsCube();
  //forms = new Multisided();
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    noLoop();
    return;
  }
  println(frameCount);
  
  forms.update(map(frameCount, 0, fCount, 0, 1));
  forms.draw();
  
  saveFrame("output/frame########.png");
}





/*
 * 0    circle
 * -    less sides
 * =    more sides
 * [    less shapes
 * ]    more shapes
 * a/d  base rotation
 * w/s  generational distance
*/
void keyPressed() {
  switch(key) {
    //case('0'):
    //  form.shapeSides = 2;
    //  break;
    //case('-'):
    //  form.shapeSides -= 1;
    //  break;
    //case('='):
    //  form.shapeSides += 1;
    //  break;
    //case(']'):
    //  form.shapeCount += 1;
    //  break;
    //case('['):
    //  form.shapeCount -= 1;
    //  break;
      
    //case('a'):
    //  form.baseRotation -= 1;
    //  println("baseRot: " + form.baseRotation);
    //  break;
    //case('d'):
    //  form.baseRotation += 1;
    //  println("baseRot: " + form.baseRotation);
    //  break;
    //case('w'):
    //  form.offsetGeneration += 0.01;
    //  break;
    //case('s'):
    //  form.offsetGeneration -= 0.01;
    //  break;
  }
  redraw();
}
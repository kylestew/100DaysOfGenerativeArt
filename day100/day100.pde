/*== DAY 100 == [MON APR 18 2016] == */
/*
 * "Final Days" [3 part post]
 * This is the end, my friends.
 */
 
/*
Ideas:
+ Animate parameters
+ Hi-res output
+ Hi-volume output
*/
int fCount = 6*30-12;
int fDiv = 6;

Forms forms;

void setup() {
  size(1600, 1600, P2D);
  smooth(8);
  colorMode(RGB, 255, 255, 255, 1);
  noLoop();

  // pick forms
  forms = new F1();
}

void draw() {
  forms.update();
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
/*== DAY 04 == [WED NOV 4 2015] == */
/*
 * "Look Into my Eyes"
 * Infinite shape zoom repeater with rotation
 */

boolean running = true;

PShape shape;

int frameCount = 30;
int frameRate = 10; // 3sec

float scale = 1.0;
float loopRepeatScale = 5; // go back to 1 at this point for an infinite loop
float spacing = 0.2;
float speed = 1.06;

float rot = 0;
float numRotationPerCycle = 4; // times to rotate for animation cycle
float rotOff = 0.3; // stagering of shapes - they don't line up, instead they spiral

void setup() {
  size(640, 640);
  smooth();
  background(255);
  
  frameRate(frameRate);
  
  shape = loadShape("eye.svg");
  shapeMode(CENTER);
}

void draw() {
  //if (frameCount > maxFrame)
    //return;
  //if (!running)
   //return;

   background(255);

   translate(width/2, height/2);
   
   // base rotation = last rotation
   rotate(rot);

   float r = 0;
   
   // draw shapes from current scale inwards until super tiny center shape is drawn
   for (float s = scale; s > 0.001; s *= spacing) {
     
     // offset individual rotation additivly
     rotate(r);
     r += rotOff;

     pushMatrix();
       
     scale(s, s);
     shape(shape);
     
     popMatrix();
   }
   
   scale += speed - 1;
   println(scale);
   
   // rotate so that one full animation cycle will be
   rot = map(scale, 1, loopRepeatScale, 0, PI - 0.15);
  
   if (scale >= loopRepeatScale - 0.2) {
     noLoop();
     print(rot);
     // restart animation cycle - stop for GIF
     //scale -= 4;
     //scale = 1;
     //rot = 0;
   }
  
  //// video
  //saveFrame("output/frame########.png");
  //// gif
  if (frameCount % 1 == 0 && frameCount < 500) saveFrame("output/frame####.gif");
}
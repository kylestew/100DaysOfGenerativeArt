/*== DAY 97 == [THR APR ?? 2016] == */
/*
 * "..."
 * Time to add another dimension to my art - literally!
 */
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import peasy.*;

int fCount = 4*30;
int fDiv = 1;

PeasyCam cam;

HE_Mesh mesh;
WB_Render render;

void setup() {
  size(640, 640, P3D);
  smooth(8);
  frameRate(30);
  
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000);
  //cam.setPitchRotationMode();
  //cam.rotateX(PI/3.0);
  //cam.rotateY(PI/3.0);
  //cam.rotateZ(PI/3.0);
  
  HEC_Cube cube = new HEC_Cube();
  cube.setEdge(70);
  mesh = new HE_Mesh(cube);
  render = new WB_Render(this);
}

void draw() {
  if (frameCount > fCount) {
    frameCount = 0;
    //noLoop();
    //return;
  }
  println(frameCount);
  
  background(255);
  
  cam.beginHUD();
  directionalLight(255,255,255,1,1,-1);
  directionalLight(127,127,127,-1,-1,1);
  cam.endHUD();
  
  noStroke();
  fill(0,0,255);
  render.drawFaces(mesh);
  
  stroke(255,0,0);
  render.drawEdges(mesh);

  

  // video
  //saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}
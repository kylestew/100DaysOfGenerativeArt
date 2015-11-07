PShape s;
float yRot;
float zRot;

void setup() {
  size(900, 900, P3D);
  frameRate(30);

  // s = loadShape("cube.obj");
  s = loadShape("satrun2.obj");

  yRot = 0f;
  zRot = 0f;

}

void draw() {
  background(0);

  ambientLight(0, 0, 255);
  spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);

  // camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  translate(width/2, height/2, -100);

  rotateY(yRot);
  yRot = yRot + 0.05f;
  rotateZ(zRot);
  zRot = zRot + 0.01f;

  // geometry is unitized
  // scale(width*0.2f, width*0.2f, width*0.2f);

  shape(s, 0, 0);
}

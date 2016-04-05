ArrayList splatpoop;
PGraphics testLayer;
void setup()
{
  size(400, 400);
  splatpoop = new ArrayList();
  testLayer = createGraphics(width, height);
}
 
void draw() {
  //println(frameRate);
  background(-1);
  testLayer.beginDraw();
  for (int i=0; i<splatpoop.size(); i++) {
    Splash s = (Splash) splatpoop.get(i);
    s.display();
    if(random(80)<40)
    s.update();
    if (s.y>height)
      splatpoop.remove(i);
  }
  testLayer.endDraw();
  image(testLayer,0,0);
}
 
void mousePressed() {
  color splc = (color) random(#000000);
  for (float i=3; i<29; i+=.35) {
    Splash sp = new Splash(mouseX, mouseY, i, splc);
    splatpoop.add(sp);
  }
}
 
 
class Splash {
  int x, y;
  float rad, ellipseangle, i;
  color c;
  Splash(int _x, int _y, float _i, color splc) {
    x = _x;
    y = _y;
    i = _i;
    rad = random(2, 50);
    ellipseangle = random(0, TWO_PI);
    c = splc;
  }
 
  void display() {
 
    testLayer.fill(c);
    testLayer.noStroke();
    float spotX = x + cos(ellipseangle)*2*i;
    float spotY = y + sin(ellipseangle)*3*i;
    testLayer.ellipse(spotX, spotY, rad-i, rad-i+random(1, 2));
  }
  void update() {
    y = y+1;
  }
}
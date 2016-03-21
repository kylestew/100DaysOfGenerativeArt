/*== DAY 68 == [WED MAR 16 2016] == */
/*
 * "Hue Made Me"
 * A vortex of color
 */




final int NB_PARTICLES = 200;
ArrayList<Triangle> triangles;
Particle[] parts = new Particle[NB_PARTICLES];
PImage image;
MyColor myColor = new MyColor();
 
void setup()
{
  size(600, 450, P2D);
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    parts[i] = new Particle();
  }
}
 
void draw()
{
  myColor.update();
  noStroke();
  fill(120, 1);
  background(50);
  triangles = new ArrayList<Triangle>();
  Particle p1, p2;
 
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    parts[i].move();
  }
 
  for (int i = 0; i < NB_PARTICLES; i++)
  {
    p1 = parts[i];
    p1.neighboors = new ArrayList<Particle>();
    p1.neighboors.add(p1);
    for (int j = i+1; j < NB_PARTICLES; j++)
    {
      p2 = parts[j];
      float d = PVector.dist(p1.pos, p2.pos);
      if (d > 0 && d < Particle.DIST_MAX)
      {
        p1.neighboors.add(p2);
      }
    }
    if(p1.neighboors.size() > 1)
    {
      addTriangles(p1.neighboors);
    }
  }
  drawTriangles();
}
 
void drawTriangles()
{
  noStroke();
  fill(myColor.R, myColor.G, myColor.B, 13);
  stroke(max(myColor.R-15, 0), max(myColor.G-15, 0), max(myColor.B-15, 0), 13);
  //noFill();
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i ++)
  {
    Triangle t = triangles.get(i);
    t.display();
  }
  endShape(); 
}
 
void addTriangles(ArrayList<Particle> p_neighboors)
{
  int s = p_neighboors.size();
  if (s > 2)
  {
    for (int i = 1; i < s-1; i ++)
    {
      for (int j = i+1; j < s; j ++)
      {
         triangles.add(new Triangle(p_neighboors.get(0).pos, p_neighboors.get(i).pos, p_neighboors.get(j).pos));
      }
    }
  }
}
 
void mousePressed()
{
   myColor.init();
}
 
class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .7;
  final static float maxSpeed = 1.5;
  MyColor()
  {
    init();
  }
   
  public void init()
  {
    R = random(255);
    G = random(255);
    B = random(255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
   
  public void update()
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  }
}
 
class Particle
{
  final static float RAD = 4;
  final static float BOUNCE = -1;
  final static float SPEED_MAX = 2.2;
  final static float DIST_MAX = 50;
  PVector speed = new PVector(random(-SPEED_MAX, SPEED_MAX), random(-SPEED_MAX, SPEED_MAX));
  PVector acc = new PVector(0, 0);
  PVector pos;
  //neighboors contains the particles within DIST_MAX distance, as well as itself
  ArrayList<Particle> neighboors;
   
  Particle()
  {
    pos = new PVector (random(width), random(height));
  }
 
  public void move()
  {   
    pos.add(speed);
     
    acc.mult(0);
     
    if (pos.x < 0)
    {
      pos.x = 0;
      speed.x *= BOUNCE;
    }
    else if (pos.x > width)
    {
      pos.x = width;
      speed.x *= BOUNCE;
    }
    if (pos.y < 0)
    {
      pos.y = 0;
      speed.y *= BOUNCE;
    }
    else if (pos.y > height)
    {
      pos.y = height;
      speed.y *= BOUNCE;
    }
  }
   
  public void display()
  {
    fill(255, 14);
    ellipse(pos.x, pos.y, RAD, RAD);
  }
}
 
class Triangle
{
  PVector A, B, C;
 
  Triangle(PVector p1, PVector p2, PVector p3)
  {
    A = p1;
    B = p2;
    C = p3;
  }
   
  public void display()
  {
    vertex(A.x, A.y);
    vertex(B.x, B.y);
    vertex(C.x, C.y);
  }
}
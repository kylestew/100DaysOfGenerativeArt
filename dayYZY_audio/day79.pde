/*== DAY 79 == [SUN MAR 27 2016] == */
/*
 * "???"
 * A vortex of color
 */
import ddf.minim.*;
import ddf.minim.analysis.*;

int fCount = 15*30;
int fDiv = 1;

Minim minim;
AudioPlayer out;
FFT fft;

void setup() {
  size(640, 640);
  smooth();
  background(0);
  frameRate(30);

  minim = new Minim(this);
  out = minim.loadFile("full.wav", 1024);
  // out = minim.getLineIn();
  out.play();

  fft = new FFT(out.bufferSize(), out.sampleRate());
  //fft.window( FFT.COSINE );
  fft.window( FFT.TRIANGULAR );
  fft.logAverages( 64, 3 );
}

void draw() {
  //if (frameCount >= fCount) {
  //  frameCount = 0;
  //  noLoop();
  //  return;
  //}
  
  fft.forward(out.mix);
  
  background(0);
  
  noFill();
  stroke(255,255,255);
  strokeWeight(1);
  translate(0, 2*height/3.0);
  
  int segs = (int)(fft.avgSize()/2.0);
  float spread = width / segs;
  beginShape();
  vertex(0, 0);
  for (int i = 0; i < segs; i++) {
    float x = i * spread;
    
    vertex(x + spread/2.0, 0 - fft.getAvg(i)*4);
    //line(x, 0, x+spread, );
    //println(fft.getAvg(i));
  
  }
  vertex(width, 0);
  endShape();
  

  
  // draw the logarithmic averages
  //{
  //  // since logarithmically spaced averages are not equally spaced
  //  // we can't precompute the width for all averages
  //  for(int i = 0; i < fftLog.avgSize(); i++)
  //  {
  //    centerFrequency    = fftLog.getAverageCenterFrequency(i);
  //    // how wide is this average in Hz?
  //    float averageWidth = fftLog.getAverageBandWidth(i);   
      
  //    // we calculate the lowest and highest frequencies
  //    // contained in this average using the center frequency
  //    // and bandwidth of this average.
  //    float lowFreq  = centerFrequency - averageWidth/2;
  //    float highFreq = centerFrequency + averageWidth/2;
      
  //    // freqToIndex converts a frequency in Hz to a spectrum band index
  //    // that can be passed to getBand. in this case, we simply use the 
  //    // index as coordinates for the rectangle we draw to represent
  //    // the average.
  //    int xl = (int)fftLog.freqToIndex(lowFreq);
  //    int xr = (int)fftLog.freqToIndex(highFreq);
      
  //    // if the mouse is inside of this average's rectangle
  //    // print the center frequency and set the fill color to red
  //    if ( mouseX >= xl && mouseX < xr )
  //    {
  //      fill(255, 128);
  //      text("Logarithmic Average Center Frequency: " + centerFrequency, 5, height - 25);
  //      fill(255, 0, 0);
  //    }
  //    else
  //    {
  //        fill(255);
  //    }
  //    // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
  //    rect( xl, height, xr, height - fftLog.getAvg(i)*spectrumScale );
  //  }
  //}
  
}


//final int NB_PARTICLES = 200;
//ArrayList<Triangle> triangles;
//Particle[] parts = new Particle[NB_PARTICLES];
//PImage image;
//MyColor myColor = new MyColor();
 
//void setup()
//{
//  size(600, 450, P2D);
//  for (int i = 0; i < NB_PARTICLES; i++)
//  {
//    parts[i] = new Particle();
//  }
//}
 
//void draw()
//{
//  myColor.update();
//  noStroke();
//  fill(120, 1);
//  background(50);
//  triangles = new ArrayList<Triangle>();
//  Particle p1, p2;
 
//  for (int i = 0; i < NB_PARTICLES; i++)
//  {
//    parts[i].move();
//  }
 
//  for (int i = 0; i < NB_PARTICLES; i++)
//  {
//    p1 = parts[i];
//    p1.neighboors = new ArrayList<Particle>();
//    p1.neighboors.add(p1);
//    for (int j = i+1; j < NB_PARTICLES; j++)
//    {
//      p2 = parts[j];
//      float d = PVector.dist(p1.pos, p2.pos);
//      if (d > 0 && d < Particle.DIST_MAX)
//      {
//        p1.neighboors.add(p2);
//      }
//    }
//    if(p1.neighboors.size() > 1)
//    {
//      addTriangles(p1.neighboors);
//    }
//  }
//  drawTriangles();
//}
 
//void drawTriangles()
//{
//  noStroke();
//  fill(myColor.R, myColor.G, myColor.B, 13);
//  stroke(max(myColor.R-15, 0), max(myColor.G-15, 0), max(myColor.B-15, 0), 13);
//  //noFill();
//  beginShape(TRIANGLES);
//  for (int i = 0; i < triangles.size(); i ++)
//  {
//    Triangle t = triangles.get(i);
//    t.display();
//  }
//  endShape(); 
//}
 
//void addTriangles(ArrayList<Particle> p_neighboors)
//{
//  int s = p_neighboors.size();
//  if (s > 2)
//  {
//    for (int i = 1; i < s-1; i ++)
//    {
//      for (int j = i+1; j < s; j ++)
//      {
//         triangles.add(new Triangle(p_neighboors.get(0).pos, p_neighboors.get(i).pos, p_neighboors.get(j).pos));
//      }
//    }
//  }
//}
 
//void mousePressed()
//{
//   myColor.init();
//}
 
//class MyColor
//{
//  float R, G, B, Rspeed, Gspeed, Bspeed;
//  final static float minSpeed = .7;
//  final static float maxSpeed = 1.5;
//  MyColor()
//  {
//    init();
//  }
   
//  public void init()
//  {
//    R = random(255);
//    G = random(255);
//    B = random(255);
//    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
//    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
//    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
//  }
   
//  public void update()
//  {
//    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
//    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
//    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
//  }
//}
 
//class Particle
//{
//  final static float RAD = 4;
//  final static float BOUNCE = -1;
//  final static float SPEED_MAX = 2.2;
//  final static float DIST_MAX = 50;
//  PVector speed = new PVector(random(-SPEED_MAX, SPEED_MAX), random(-SPEED_MAX, SPEED_MAX));
//  PVector acc = new PVector(0, 0);
//  PVector pos;
//  //neighboors contains the particles within DIST_MAX distance, as well as itself
//  ArrayList<Particle> neighboors;
   
//  Particle()
//  {
//    pos = new PVector (random(width), random(height));
//  }
 
//  public void move()
//  {   
//    pos.add(speed);
     
//    acc.mult(0);
     
//    if (pos.x < 0)
//    {
//      pos.x = 0;
//      speed.x *= BOUNCE;
//    }
//    else if (pos.x > width)
//    {
//      pos.x = width;
//      speed.x *= BOUNCE;
//    }
//    if (pos.y < 0)
//    {
//      pos.y = 0;
//      speed.y *= BOUNCE;
//    }
//    else if (pos.y > height)
//    {
//      pos.y = height;
//      speed.y *= BOUNCE;
//    }
//  }
   
//  public void display()
//  {
//    fill(255, 14);
//    ellipse(pos.x, pos.y, RAD, RAD);
//  }
//}
 
//class Triangle
//{
//  PVector A, B, C;
 
//  Triangle(PVector p1, PVector p2, PVector p3)
//  {
//    A = p1;
//    B = p2;
//    C = p3;
//  }
   
//  public void display()
//  {
//    vertex(A.x, A.y);
//    vertex(B.x, B.y);
//    vertex(C.x, C.y);
//  }
//}
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/309152*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
* Triangles by Particles
*
* @author aa_debdeb
* @date 2016/02/25
*/


ArrayList<Particle> particles;

void setup(){
  size(500, 500);
  frameRate(30);
  fill(255, 100);
  noStroke();
  
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 100; i++){
    particles.add(new Particle());
  }  
}

void draw(){
  background(0);
  
  for(Particle p: particles){
    p.update();
  }
  
  for(int i = 0; i < particles.size() - 2; i++){
    Particle p1 = particles.get(i);
    for(int j = i + 1; j < particles.size() - 1; j++){
      Particle p2 = particles.get(j);
      for(int k = j + 1; k < particles.size(); k++){
        Particle p3 = particles.get(k);
        if(PVector.dist(p1.pos, p2.pos) <= 60 && PVector.dist(p2.pos, p3.pos) <= 60 && PVector.dist(p3.pos, p1.pos) <= 60){
          triangle(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y, p3.pos.x, p3.pos.y);
        }
      }
    }
  }
}

class Particle {
  
  PVector pos;
  PVector vel;
  
  Particle(){
    pos = new PVector(random(width), random(height));
    float velAng = random(TWO_PI);
    vel = new PVector(3 * cos(velAng), 3 * sin(velAng));  
  }
  
  void update(){
    pos.add(vel);
    if(pos.x < 0 || pos.x >= width){
      vel.x *= -1;      
    }
    if(pos.y < 0 || pos.y >= height){
      vel.y *= -1;
    }
  }
  
}


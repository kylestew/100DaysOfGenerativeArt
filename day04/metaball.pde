class MetaBall {
  private PVector pos;
  private float radius;
  private PVector dir;
  private float speed;
  
  MetaBall(float r, float speed) {
    this.dir = new PVector(random(-1, 1), random(-1, 1));
    this.dir.normalize();
    this.dir.mult(speed);
    this.pos = new PVector(0, 0);
    this.radius = r;
    this.speed = speed;
  }
  
  void update() {
    pos.add(dir);
    
    if (abs(pos.x) > width/2) {
      dir.x *= -1;
    }
    if (abs(pos.y) > height/2) {
      dir.y *= -1;
    }
  }
}
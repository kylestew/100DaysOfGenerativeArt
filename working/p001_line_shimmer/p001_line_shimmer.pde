Walker[] w = new Walker[100];

void setup() {
  size(640, 640);
  frameRate(30);
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
  
  background(0);
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
//  background(0);
  
  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].display();
  }
  
  saveFrame("frames/####.png");
}

class Walker {
  PVector location;
  float r = random(120, 900);
  float mult = 8;
  float step = 0;

  Walker() {
    location = new PVector(width, 0);
    step = random(100);
  }

  void display() {
    stroke(255, random(90));
    strokeWeight(1);
    line(location.x, location.y, width/2, height/2);
  }

  void step() {
    step += 0.01;

//    int choice = int(random(4));
    int choice = int(noise(step) * 4);
    if (choice == 0) {
      location.x += mult;
    } else if (choice == 1) {
      location.x -= mult;
    } else if (choice == 2) {
      location.y += mult;
    } else {
      location.y -= mult;
    }
  }
}

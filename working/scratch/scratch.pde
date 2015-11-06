Ball ball;

void setup() {
  size(600, 600);
  smooth();

  ball = new Ball();
}

void draw() {
  background(0);

  ball.display();
}

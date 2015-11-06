void setup() {
  size(640, 640);
  H.init(this).background(#242424);
  smooth();

  HRect rect1 = new HRect(100);
  rect1.rounding(10);
  rect1.fill(#FF6600);
  rect1.stroke(#000000, 150);
  rect1.strokeWeight(6);
  rect1.anchorAt(H.CENTER);
  rect1.rotation(45);
  rect1.loc(100, height / 2);
  H.add(rect1);

  HRect rect2 = new HRect(100);
  rect2
    .rounding(10)
    .fill(#FF9900)
    .stroke(#000000, 150)
    .strokeWeight(6)
    .anchorAt(H.CENTER)
    .rotation(45)
    .loc(247,height / 2)
  ;
  H.add(rect2);

  HRect rect3 = new HRect(100);
  rect3.rounding(10).fill(#FFCC00).stroke(#000000, 150).strokeWeight(6).anchorAt(H.CENTER).rotation(45).loc(394,height / 2);
  H.add(rect3);

  H.drawStage();

  pushMatrix();
    fill(#FF3300);
    rect(0, 0, 100, 100, 10, 10, 10, 10);
  popMatrix();

  stroke(#0095a8);
  strokeWeight(1);
  line(0, height/2, width, height/2);

  noLoop();
}

void draw() {}

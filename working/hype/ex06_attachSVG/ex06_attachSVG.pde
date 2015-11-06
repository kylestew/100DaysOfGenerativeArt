void setup() {
  size(2000, 2000);
  H.init(this).background(#202020);
  smooth();

  HShape svg1 = new HShape("svg1.svg");
  svg1
    .loc(25, height / 2)
    .anchorAt(H.LEFT | H.CENTER_Y);
  H.add(svg1);


  H.drawStage();
  noLoop();
}

void draw() {}

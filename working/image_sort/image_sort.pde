
PImage img;
color[] colors;

int delayFrames;
int step;
int stride;

void setup() {
  size(640, 640);

  img = loadImage("sample.jpg");

  colors = new color[img.width * img.height];
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      colors[y * img.width + x] = img.get(x, y);
    }
  }

  delayFrames = 0;
  step = colors.length - 1;
  stride = img.width;
}

void draw() {
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      stroke(colors[y * img.width + x]);
      point(x, y);
    }
  }
 
  saveFrame("out/frame########.png");
  println(frameCount);
 
  if (frameCount > delayFrames)
    bubbleSortStep();
}

void bubbleSortStep() {
 if (step <= 0)
   return;
  for (int i = step; i >= step - stride; i--) {
    for (int j = 1; j <= i; j++) {
      if ( brightness(colors[j-1]) > brightness(colors[j]) ) {
        int temp = colors[j-1];
        colors[j-1] = colors[j];
        colors[j] = temp;
      }
    }
  }
}

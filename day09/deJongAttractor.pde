class deJongAttractor {
  
  private int dim;
  private int size;
  private int samples;
  private float a, b, c, d;
  
  void setup(int dimension, int samples, float a, float b, float c, float d) {
    dim = dimension;
    size = dim*dim;
    this.samples = samples;
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }
  
  PImage plotImage() {
    float[] data = new float[size];
    
    // clear
    for (int i = 0; i < size; ++i)
      data[i] = 1;
      
    // fill
    for (int j = 0; j < samples; ++j) {
      float x = j;
      float y = 0;
      for (int i = 0; i < 1000000; ++i) {
        float xn = sin(a * y) - cos(b * x);
        y = sin(c * x) - cos(d * y);
        x = xn;
        
        float xp = ((dim - 1.0) * (1.0 + x * 0.43) * 0.5);
        float yp = (int)((dim - 1.0) * (1.0 - y * 0.43) * 0.5);
        data[(int)((yp * dim + xp))] *= 0.99f;
      }
    }
    
    // draw
    PImage img = createImage(dim, dim, RGB);
    img.loadPixels();
    for (int i = 0; i < dim; i++) {
      for (int j = 0; j < dim; j++) {
        float clr = data[i * dim + j];
        img.pixels[i * dim + j] = color(clr * 255.0);
      }
    }
    img.updatePixels();
    return img;
  }
}
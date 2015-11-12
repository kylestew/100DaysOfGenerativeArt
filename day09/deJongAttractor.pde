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
    float[][] data = new float[dim][dim];
    
    // clear
    for (int i = 0; i < dim; ++i)
      for (int j = 0; j < dim; ++j)
        data[i][j] = 0;
      
    // fill
    float x0 = width/2;
    float y0 = width/2;
    float x1, y1;
    for (int i = 0; i < samples; ++i) {
      //float x = j;
      //float y = 0;
      for (int j = 0; j < 10000; ++j) {
        // pure deJong function
        x1 = sin(a*y0) - cos(b*x0);
        y1 = sin(c*x0) - cos(d*y0);
        
        // scale for screen
        
        
        //float xn = sin(a * y) - cos(b * x);
        //y = sin(c * x) - cos(d * y);
        //x = xn;
        
        //float xp = ((dim - 1.0) * (1.0 + x * 0.43) * 0.5);
        //float yp = (int)((dim - 1.0) * (1.0 - y * 0.43) * 0.5);
        //data[(int)((yp * dim + xp))] *= 0.99f;
        
        // if in screen (not out of array bounds), accumulate density
        if ((x1 > 0) && (x1 < dim) && (y1 > 0) && (y1 < dim)) {
          println(x1 + ", " + y1);
          data[int(x1)][int(y1)] += 1;
        }
        x0 = x1;
        y0 = y1;
      }
    }
    
    // draw
    PImage img = createImage(dim, dim, RGB);
    img.loadPixels();
    for (int i = 0; i < dim; i++) {
      for (int j = 0; j < dim; j++) {
        float clr = 0;
        if (data[i][j] > 0) {
          clr = data[i][j];
        }
        img.pixels[i * dim + j] = color(clr);        
      }
    }
    img.updatePixels();
    return img;
  }
}
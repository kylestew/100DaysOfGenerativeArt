class deJongAttractor {
  
  private int dim;
  private int samples;
  private float a, b, c, d;
  
  void setup(int dimension, int samples, float a, float b, float c, float d) {
    dim = dimension;
    this.samples = samples;
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }
  
  PImage plotImage() {
    float[][] density = new float[dim][dim];
    float[][] previousx = new float[dim][dim];
    
    // clear
    for (int i = 0; i < dim; ++i) {
      for (int j = 0; j < dim; ++j) {
        density[i][j] = 0;
        previousx[i][j] = 0;
      }
    }
      
    // fill
    float x0 = width/2;
    float y0 = width/2;
    float x1, y1;    
    for (int i = 0; i < samples; ++i) {
      x0 = 0;
      y0 = 0;
      for (int j = 0; j < 100000; ++j) {
        // deJong function with screen scaling
        x1 = ((sin(a*y0) - cos(b*x0)) * dim*0.24) + dim/2.0;
        y1 = ((sin(c*x0) - cos(d*y0)) * dim*0.24) + dim/2.0;
        
        x1 += random(-0.01, 0.01);
        y1 += random(-0.01, 0.01);

        
        if ((x1 > 0) && (x1 < dim) && (y1 > 0) && (y1 < dim)) {
          // build up density
          density[int(x1)][int(y1)] += 1;
          previousx[int(x1)][int(y1)] = x0;
        }
        x0 = x1;
        y0 = y1;
      }
    }
    
    // determine maximum to always have a good contrast range in putput
    float maxDense = 0;
    for (int i = 0; i < dim; i++) {
      for (int j = 0; j < dim; j++) {
        if (density[i][j] > maxDense) {
          maxDense = density[i][j];
        }
      }
    }
    float logMax = log(maxDense);
    
    // draw
    colorMode(HSB, 255);
    PImage img = createImage(dim, dim, RGB);
    img.loadPixels();
    for (int i = 0; i < dim; i++) {
      for (int j = 0; j < dim; j++) {
        float hue = 0;
        float sat = 0;
        float bri = 0;
        if (density[i][j] > 0) {
          float d = density[i][j];
          hue = map(previousx[i][j], 0, dim, 120, 255);
          sat = map(log(d), 0, logMax, 128, 0);
          bri = map(log(d), 0, logMax, 0, 255);
        }
        img.pixels[i * dim + j] = color(hue, sat, bri);
      }
    }
    img.updatePixels();
    return img;
  }
}
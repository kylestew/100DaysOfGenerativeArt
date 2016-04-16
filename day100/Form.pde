class Form {
  private PGraphics g; // each has its own canvas to draw into
  private PVector center;
  private float baseSize;
  private ArrayList<PVector> centers;

  // ======================================
  // == canvas ==
  public float blur = 0;
  public float baseRotation = 90.0;
  public int blendmode = BLEND;

  // == generations ==
  public int genStart = 0;
  public int genEnd = 2;
  public boolean[] trackCenters = { false, false, true };
  public boolean directedGen = true;
  public float scaleGeneration = 1.0;
  public float offsetGeneration = 1;

  // == shapes ==
  public int shapeCount = 6;
  public int shapeSides = 0;
  public float shapeRadius = 0.1;
  public float shapeOffset = 0.1;
  public float shapeRotation = 0;
  
  // == shape style ==
  public boolean showShapes = true;
  public float shapeWeight = 2.0;
  public color shapeColor = #bbeaf7;
  public float shapeOpacity = 1.0;
  public color shapeFillColor = #ffffff;
  public float shapeFillOpacity = 0.0;

  // == centers style ==
  public boolean showCenters = true;
  public color centerStrokeColor = #ffffff;
  public float centerStrokeWeight = 12.0;
  public float centerStrokeOpacity = 1.0;

  // == network style ==
  public boolean showNetwork = true;
  public color networkStrokeColor = #eeeeee;
  public float networkStrokeWeight = 2.0;
  public float networkStrokeOpacity = 0.8;
  // ======================================

  public Form(int width, int height, float cX, float cY) {
    this.g = createGraphics(width, height);
    this.center = new PVector(cX, cY);
    this.baseSize = width > height ? height : width;
  }

  public PGraphics draw() {
    g.beginDraw();
    g.colorMode(RGB, 255, 255, 255, 1.0);
    g.background(0,0,0,0);
    g.translate(center.x, center.y);
    g.rotate(radians(baseRotation));

    // apply conditional blurring
    if (blur > 0) {
      
      color sc = shapeColor;
      shapeColor = #ffffff;
      float so = shapeOpacity;
      shapeOpacity /= 2;
      float sw = shapeWeight;
      shapeWeight *= blur;
      
      drawFrame();
      
      g.filter(BLUR, blur);
      
      shapeColor = sc;
      shapeOpacity = so;
      shapeWeight = sw;
      
      drawFrame();
    } else {
      drawFrame();
    }

    g.endDraw();
    return g;
  }

  private void drawFrame() {
    centers = new ArrayList<PVector>();

    // draw generations
    drawGeneration(0, 1.0, radians(baseRotation), new PVector());

    // draw centers
    g.noStroke();
    setFill(centerStrokeColor, centerStrokeOpacity);
    if (showCenters) {
      for (int i = 0; i < centers.size(); i++) {
        PVector p = centers.get(i);
        g.ellipse(p.x, p.y, centerStrokeWeight, centerStrokeWeight);
      }
    }
    
    // draw network lines
    if (showNetwork) {
      // for each point, draw a line to all other points
      setStroke(networkStrokeColor, networkStrokeOpacity, networkStrokeWeight);
      for (int i = 0; i < centers.size(); i++) {
        PVector p = centers.get(i);
        // start past myself
        for (int j = i+1; j < centers.size(); j++) {
          PVector p1 = centers.get(j);
          g.line(p.x, p.y, p1.x, p1.y);
        }
      }
    }
  }

  private void drawGeneration(int generation, float scale, float rot0, PVector cent) {
    // determine radius of shape - based on generational scaling
    float rad = baseSize * shapeRadius * scale;

    // hide culled generations
    if (generation >= genStart) {
      // draw
      setStroke(shapeColor, shapeOpacity, shapeWeight);
      setFill(shapeFillColor, shapeFillOpacity);
      if (shapeSides > 2) {
        g.rotate(radians(shapeRotation));
        polygon(0, 0, rad, shapeSides);
      } else {
        g.ellipse(0, 0, rad, rad);
      }
    }
    
    // record shape center
    if (trackCenters[generation] == true)
      centers.add(cent);
    
    // draw generation from this shape
    if (generation < genEnd) {
      // determin # shapes to draw this generation
      int iterations = directedGen ? 1 : shapeCount;
      if (generation == 0) // gen 0 is the root generation - always iterate shape count times
        iterations = shapeCount;
      
      for (int i = 0; i < iterations; i++) {
        g.pushMatrix();
        
        // rotate
        float rot = i*(TWO_PI/shapeCount);
        g.rotate(rot);
        
        // offset
        float off = baseSize * shapeOffset * offsetGeneration;
        off *= scale*scaleGeneration; // figure in scaling
        g.translate(off, 0);
        
        // update center
        PVector c1 = new PVector(
          cent.x + off*sin(rot0 + rot), 
          cent.y + off*cos(rot0 + rot)
        );
        
        // draw next generation
        drawGeneration(generation + 1, scale * scaleGeneration, rot+rot0, c1);
        g.popMatrix();
      }
    }
  }

  private void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    g.beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      g.vertex(sx, sy);
    }
    g.endShape(CLOSE);
  }

  private void setStroke(color col, float opacity, float weight) {
    g.stroke(red(col), green(col), blue(col), opacity);
    g.strokeWeight(weight);
    g.noFill();
  }
  
  private void setFill(color col, float opacity) {
    if (opacity > 0) {
      g.fill(red(col), green(col), blue(col), opacity);
    }
  }
}
class Glyph {
  public float x0, y0, x1, y1, x2, y2;
  
  void draw(float baseHue, float hueVariability) {
    
    float hue = distFromCenter() * hueVariability + baseHue;
    while (hue > 300)
      hue -= 300;
    
    fill(hue,100,100,100);

    
    beginShape(TRIANGLES);
  
    vertex(x0,y0);
    vertex(x1,y1);
    vertex(x2,y2);
  
    endShape();
  }
  
  private float distFromCenter() {
    PVector center = new PVector(width/2.0, height/2.0);
    float cX = (x0 + x1 + x2) / 3;
    float cY = (y0 + y1 + y2) / 3;
    PVector myCent = new PVector(cX, cY);
    return PVector.dist(center, myCent);
  }
  
}
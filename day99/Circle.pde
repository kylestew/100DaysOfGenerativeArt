class Circle {
  float x;
  float y;
  float r;
  
  public Circle(float x, float y, float rad) {
    this.x = x;
    this.y = y;
    this.r = rad;
  }
  
  public PVector[] circleIntersection(Circle c) {
    /* Adapted from: http://paulbourke.net/geometry/circlesphere/tvoght.c */
    /* dx and dy are the vertical and horizontal distances between 
       the cirlce centers
     */
    float dx = c.x - x;
    float dy = c.y - y;
    
    /* Determine the straight-line distance between the centers */
    float d = dist(x, y, c.x, c.y);
    
    /* Check for solvability */
    if (d > (r + c.r)) 
      return null;
    if (d < abs(r - c.r))
      return null;
  
    /* 'point 2' is the point where the line through the circle
       intersection points crosses the line between the circle
       centers.
     */
    /* Determine the distance from point 0 to point 2 */
    float a = ((r*r) - (c.r*c.r) + (d*d)) / (2.0 * d);
    
    /* Determine the coordinates of point 2 */
    float x2 = x + (dx * a/d);
    float y2 = y + (dy * a/d);
    
    /* Determine the distance from point 2 to either of the
       intersection points.
     */
    float h = sqrt(r*r-a*a);
  
    /* Now determine the offset of the intersection points from
       point 2.
     */
    float rx = -dy * (h/d);
    float ry = dx * (h/d);
  
    /* Determine the absolute interesction points */
    return new PVector[] {
      new PVector(x2 + rx, y2 + ry),
      new PVector(x2 - rx, y2 - ry)
    };
  }
}
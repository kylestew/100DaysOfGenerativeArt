
public class Multisided extends Forms {
  
  private Form f1;
  private Form f1s;
  
  float off = 0.16;
  float rad0 = 0.04;
  float rad1 = 0.1;
  float off2 = 0.16;

  public Multisided() {
    super();
    
    backTint = #dddddd;
    back = loadImage("nasa_ffa_011.jpg");
    
    // circle container
    Form form = new Form(width, height, width/2, height/2);
    form.genStart = 0;
    form.genEnd = 0;
    form.shapeCount = 1;
    form.offsetGeneration = 0;
    form.scaleGeneration = 1.04;
    form.shapeRadius = 0.73;
    form.shapeWeight = 8.0;
    form.shapeOpacity = 1.0;
    form.shapeColor = #ffffff;
    form.showCenters = false;
    form.showNetwork = false;
    form.shapeFillOpacity = 0.4;
    form.shapeFillColor = #000000;
    form.blur = 2;
    forms.add(form);
    
    f1 = new Form(width, height, width/2, height/2);
    f1.genStart = 0;
    f1.genEnd = 2;
    f1.shapeCount = 5;
    f1.shapeRadius = rad0;
    f1.shapeWeight = 1.4;
    f1.shapeOffset = off;
    f1.showShapes = true;
    f1.showCenters = true;
    f1.shapeColor = #FFFFFF;
    f1.centerStrokeWeight = 7.0;
    f1.centerStrokeColor = #bbeaf7;
    f1.showNetwork = true;
    f1.networkStrokeColor = #bbeaf7;
    f1.networkStrokeWeight = 2.0;
    f1.blur = 5.0;
    forms.add(f1);
    
    f1s = new Form(width, height, width/2, height/2);
    f1s.genStart = 0;
    f1s.genEnd = 2;
    f1s.shapeCount = 6;
    f1s.shapeRadius = rad0;
    f1s.shapeWeight = 1.4;
    f1s.shapeOffset = off2;
    f1s.showShapes = true;
    f1s.showCenters = true;
    f1s.shapeColor = #FFFFFF;
    f1s.centerStrokeWeight = 7.0;
    f1s.centerStrokeColor = #bbeaf7;
    f1s.showNetwork = true;
    f1s.networkStrokeColor = #bbeaf7;
    f1s.networkStrokeWeight = 2.0;
    f1s.blur = 5.0;
    forms.add(f1s);
  }
  
  public void update(float perc) {
    f1.shapeOffset = off * sin(map(perc, 0, 1, -PI/2.0, PI+PI/2.0));
    if (f1.shapeOffset > 0)
      f1.shapeOffset = 0;
    
    f1s.shapeOffset = off * sin(map(perc, 0, 1, -PI/2.0, PI+PI/2.0));
    if (f1s.shapeOffset < 0) f1s.shapeOffset = 0;
  }
}
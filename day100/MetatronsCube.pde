
public class MetatronsCube extends Forms {
  
  private Form backbone;
  private Form secondary;
  private Form net;
  
  float rad = 0.140;
  float off = 0.140;

  public MetatronsCube() {
    super();
    
    backTint = #ffffff;
    back = loadImage("nasa_ffa_001.jpg");

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

    // backbone circles
    backbone = new Form(width, height, width/2, height/2);
    backbone.genStart = 0;
    backbone.genEnd = 2;
    backbone.shapeRadius = rad;
    backbone.shapeOffset = off;
    backbone.showCenters = false;
    backbone.showNetwork = false;
    backbone.networkStrokeColor = #bbeaf7;
    backbone.networkStrokeWeight = 2.0;
    backbone.networkStrokeOpacity = 0.9;
    backbone.shapeColor = #ffffff;
    backbone.shapeWeight = 2;
    backbone.blur = 4;
    forms.add(backbone);
    
    // network
    net = new Form(width, height, width/2, height/2);
    net.genStart = 0;
    net.genEnd = 2;
    net.trackCenters = new boolean[] { true, true, true };
    net.shapeRadius = rad;
    net.shapeOffset = off;
    net.showShapes = false;
    net.showCenters = true;
    net.showNetwork = true;
    net.networkStrokeColor = #adf8fe;
    net.networkStrokeWeight = 2.0;
    net.networkStrokeOpacity = 0.9;
    net.shapeColor = #ffffff;
    net.shapeWeight = 2;
    net.centerStrokeWeight = 9;
    net.blur = 3;
    forms.add(net);
    
    // centers
    Form cents = new Form(width, height, width/2, height/2);
    cents.genStart = 0;
    cents.genEnd = 2;
    cents.trackCenters = new boolean[] { true, true, true };
    cents.shapeRadius = rad;
    cents.shapeOffset = off;
    cents.showShapes = false;
    cents.showCenters = true;
    cents.showNetwork = false;
    cents.networkStrokeColor = #adf8fe;
    cents.networkStrokeWeight = 2.0;
    cents.networkStrokeOpacity = 0.9;
    cents.shapeColor = #ffffff;
    cents.shapeWeight = 2;
    cents.centerStrokeWeight = 9;
    cents.blur = 2;
    forms.add(cents);
  }
  
  public void update(float perc) {
    backbone.shapeWeight = 2.0 * abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
    backbone.shapeRadius = rad * abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
    backbone.scaleGeneration = abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
    
    net.scaleGeneration = abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
    net.networkStrokeWeight = 2.0*abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
    net.centerStrokeWeight = 9.0*abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
  }
}
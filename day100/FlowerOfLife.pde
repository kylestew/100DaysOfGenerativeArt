
public class FlowerOfLife extends Forms {
  
  private Form f1, f2;
  
  float rad = 0.24;
  float off = 0.12;
  float off2 = 0.105;

  public FlowerOfLife() {
    super();
    
    backTint = #ffffff;
    back = loadImage("nasa_ffa_021.jpg");
    
    // circle container
    Form form = new Form(width, height, width/2, height/2);
    form.genStart = 0;
    form.genEnd = 0;
    form.shapeCount = 1;
    form.offsetGeneration = 0;
    form.scaleGeneration = 1.04;
    form.blur = 2;
    form.shapeRadius = 0.73;
    form.shapeWeight = 8.0;
    form.shapeOpacity = 1.0;
    form.shapeColor = #ffffff;
    form.showCenters = false;
    form.showNetwork = false;
    form.shapeFillOpacity = 0.4;
    form.shapeFillColor = #000000;
    //form.blendmode = EXCLUSION;
    forms.add(form);

    // inner circles
    f1 = new Form(width, height, width/2, height/2);
    f1.genStart = 0;
    f1.genEnd = 2;
    f1.shapeRadius = rad;
    f1.shapeOffset = off;
    f1.showCenters = false;
    f1.showNetwork = false;
    f1.networkStrokeColor = #4dd0d2;
    f1.networkStrokeWeight = 1.0;
    f1.shapeColor = #adf8fe;
    f1.shapeWeight = 3;
    f1.blur = 3;
    forms.add(f1);
    
    // fill in gaps from first form
    f2 = new Form(width, height, width/2, height/2);
    f2.baseRotation += 90;
    f2.genStart = 2;
    f2.genEnd = 2;
    f2.shapeRadius = rad;
    f2.shapeOffset = off2;
    f2.showCenters = false;
    f2.showNetwork = false;
    f2.shapeColor = #adf8fe;
    f2.shapeWeight = 3;
    f2.blur = 3;
    forms.add(f2);
  }
  
  public void update(float perc) {
    f1.shapeOffset = off * abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
    f2.shapeOffset = off2 * abs(sin(map(perc, 0, 1, -PI/2.0, PI/2.0)));
    
    f1.baseRotation = map(perc, 0, 1, 0, 360);
    f2.baseRotation = map(perc, 0, 1, 90, 360+90);
  }
}
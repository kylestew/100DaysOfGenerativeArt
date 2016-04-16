
public class F1 extends Forms {

  public F1() {
    super();
    
    backTint = #cccccc;
    back = loadImage("nasa_ffa_010.jpg");

    Form form = new Form(width, height, width/2, height/2);
    form.genStart = 0;
    form.genEnd = 2;
    form.blur = 4;
    forms.add(form);
  
    Form f1 = new Form(width, height, width/2, height/2);
    f1.genStart = 0;
    f1.genEnd = 0;
    f1.blur = 12;
    f1.shapeRadius = 0.5;
    f1.shapeWeight = 4.0;
    f1.shapeColor = #ffffff;
    f1.showCenters = false;
    f1.showNetwork = false;
    f1.shapeFillOpacity = 1.0;
    f1.blendmode = EXCLUSION;
    forms.add(f1);
  }
  
  
  
  public void update() {
    // animations

//   offsetGeneration = sin(map(frameCount, 0, fCount, 0, TWO_PI));
//   //offset = 0.1*cos(map(frameCount, 0, fCount, 0, TWO_PI));
//   //offset = 0.1*cos(map(frameCount, 0, fCount, 0, PI));
//   //radius = 0.6+0.5*cos(map(frameCount, 0, fCount, 0, TWO_PI));
  }

  
}
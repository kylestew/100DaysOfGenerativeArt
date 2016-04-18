public class Forms {
  public PImage back;
  public color backTint = #cccccc;
  public PImage post;
  public float postTintAlpha = 0.5;
  public ArrayList<Form> forms = new ArrayList<Form>();

  public void update(float perc) {
  }
  
  public void draw() {
    // background
    if (back != null) {
      background(backTint);
      tint(backTint);
      image(back, 0, 0, width, height);
      noTint();
    } else {
      background(0);
    }
    
    // draw forms
    for (Form form : forms) {
      blendMode(form.blendmode);
      image(form.draw(), 0, 0);
    }
  }
}
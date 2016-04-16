public class Forms {
  public PImage back;
  public color backTint = #cccccc;
  public ArrayList<Form> forms = new ArrayList<Form>();

  public void update() {
  }
  
  public void draw() {
    // background
    background(backTint);
    tint(backTint);
    image(back, 0, 0, width, height);
    noTint();
    
    // draw forms
    for (Form form : forms) {
      blendMode(form.blendmode);
      image(form.draw(), 0, 0);
    }
  }
}
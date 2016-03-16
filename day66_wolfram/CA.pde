// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Wolfram Cellular Automata
// A class to manage the CA
// https://github.com/shiffman/The-Nature-of-Code-Examples

class CA {
  int generation;
  int[] ruleSet;
  int w = 5;
  int cols;
  int rows;
  int[][] matrix;  
  
  CA(int[] ruleSet, int cellWidth) {
    this.ruleSet = ruleSet;
    this.w = cellWidth;
    cols = width/w;
    rows = height/w;
    matrix = new int[cols][rows];
    
    restart();
  }
  
  // create a random ruleset
  void randomize() {
    for (int i = 0; i < 8; i++) {
      ruleSet[i] = int(random(2));
    }
    
    // clear current generation to reseed
    //matrix[cols/2][0] = 1;
    //restart();
  }
  
  void restart() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        matrix[i][j] = 0;
      }
    }
    matrix[cols/2][0] = 1; // start with middle cell having state of "1"
    generation = 0;
  }
  
  void generate() {
    for (int i = 0; i < cols; i++) {
      int left = matrix[(i+cols-1)%cols][generation%rows];
      int me = matrix[i][generation%rows];
      int right = matrix[(i+1)%cols][generation%rows];
      matrix[i][(generation+1)%rows] = rules(left, me, right);
    }
    generation++;
  }
  
  boolean finished() {
    return generation > height/w;
  }
  
  void display(color back, color fore) {
    int offset = generation%rows;
    
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int y = j - offset;
        if (y <= 0) y = rows + y;
        if (matrix[i][j] == 1)
          fill(back);
        else
          fill(fore);
        noStroke();
        rect(i*w, (y-1)*w, w, w);
      }
    }
  }
  
  int rules(int a, int b, int c) {
    // Wolfram rules
    // convert to binary and use as index into ruleset
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleSet[index];
  }
}
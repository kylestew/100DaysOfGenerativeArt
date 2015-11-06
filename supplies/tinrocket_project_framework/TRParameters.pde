import java.util.HashMap;
import java.lang.Number;


class TRParameters {
  private HashMap dictionary;


  public TRParameters() {
    this.reset();
  }


  public String put(String _key, Object _value) {
    // Everything gets stored as a string for identical results whether values were assigned in code or loaded from a text file
    String valueSimplified = _value.toString();
    this.dictionary.put(_key, valueSimplified);

    return valueSimplified;
  }


  public String get(String _key) {
    return this.dictionary.get(_key).toString();
  }


  public int getInt(String _key) {
    return Integer.parseInt(this.dictionary.get(_key).toString());
  }


  public float getFloat(String _key) {
    return Float.parseFloat(this.dictionary.get(_key).toString());
  }


  public long getLong(String _key) {
    return Long.parseLong(this.dictionary.get(_key).toString());
  }


  public void reset() {
    this.dictionary = new HashMap();
  }


  public void save(String _filePath) {
    try {
      PrintWriter output = createWriter(_filePath); 

      for (Object key : this.dictionary.keySet()) { 
        output.println(key + "\t" + this.dictionary.get(key));
      }

      output.flush();
      output.close(); // Finishes the file
    } 
    catch (Exception e) {
      println("Error saving " + _filePath);
    }
  }

  public void load(String _filePath) {
    try {
      BufferedReader reader = createReader(_filePath); 

      while (reader.ready()) {
        String[] parts = reader.readLine().split("\t");
        this.dictionary.put(parts[0], parts[1]);
      }

      reader.close();
    } 
    catch (Exception e) {
      println("Error loading " + _filePath);
    }
  }

  public void debugDumpParams() {
    for (Object key : this.dictionary.keySet()) { 
      println(key + "\t" + this.dictionary.get(key));
    }
  }
}
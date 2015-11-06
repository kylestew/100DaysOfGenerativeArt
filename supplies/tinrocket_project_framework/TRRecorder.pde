// REQUIRES: Video Export library: http://funprogramming.org/VideoExport-for-Processing/
import com.hamoid.*;
import java.util.*;


class TRRecorder {
  public boolean logging = true;

  public boolean recordVideo = false;
  public boolean recordPDF = false;
  public boolean recordFrames = false;

  public String recordVideoSavePath = "movies/";
  public float recordVideoFPS = 30.0;
  public int recordVideoQuality = 95;
  public float recordVideoDuration = -1;

  public String recordName = "";
  public int recordNthFrame = 1;
  public String recordPDFSavePath = "pdfs/";
  public String recordStillSavePath = "stills/";
  public String recordFramesSavePath = "frames/";

  private VideoExport videoExport;
  private Date date;
  private PApplet parent;

  private boolean recordStillCaptureSingleStill;
  private boolean recordPDFCaptureSinglePDF;

  public int recordFrameSinceStart;
  private int currentFrame;


  public TRRecorder(PApplet _sketch) {
    this.parent = _sketch;
    recordName = this.parent.getClass().getSimpleName();

    this.date = new Date();
  }
  
  
  public String recordName() {
    return recordName + " " + this.date.getTime();
  }


  public String recordNameWithFrame() {
    return recordName + " " + this.date.getTime() + " f" + nf(this.recordFrameSinceStart, 8);
  }
  
  
  public float recordVideoRunningTime() {
    //record_running_time = record_running_time + (1.0 / this.recordVideoFPS);
    return 0.0;
  }


  public void setupEvent() {
    if (this.recordVideo) {
      String path = this.recordVideoSavePath + this.recordName() + ".mp4";
      this.videoExport = new VideoExport(this.parent, path);
      this.videoExport.setQuality(this.recordVideoQuality);
      this.videoExport.setFrameRate(this.recordVideoFPS);
    }
  }


  public void drawEventEnter() {
    if (this.recordPDF || this.recordPDFCaptureSinglePDF) {
      String path = this.recordPDFSavePath + this.recordNameWithFrame() + ".pdf";
      beginRecord(PDF, path);
    }
  }


  public void drawEventExit() {
    if (this.recordPDF || this.recordPDFCaptureSinglePDF) {
      endRecord();
      if (this.logging) {
        String path = this.recordPDFSavePath + this.recordNameWithFrame() + ".pdf";
        println("Wrote PDF: " + path);
      }

      this.recordPDFCaptureSinglePDF = false;
    }

    if (this.recordVideo) {
      if (this.recordFrameSinceStart % recordNthFrame == 0) {
        this.videoExport.saveFrame();
      }
    }

    if (this.recordFrames) {
      if (this.recordFrameSinceStart % recordNthFrame == 0) {
        String path = this.recordFramesSavePath + this.recordNameWithFrame() + ".png";
        saveFrame(path);

        if (this.logging) println("Wrote Frame: " + path);
      }
    }

    if (this.recordStillCaptureSingleStill) {
      String path = this.recordStillSavePath + this.recordNameWithFrame() + ".png";
      saveFrame(path);

      if (this.logging) println("Wrote Still: " + path);

      this.recordStillCaptureSingleStill = false;
    }

    this.recordFrameSinceStart++;
  }

  public void captureOneStill() {
    this.recordStillCaptureSingleStill = true;
  }


  public void captureOnePDF() {
    this.recordPDFCaptureSinglePDF = true;
  }
}
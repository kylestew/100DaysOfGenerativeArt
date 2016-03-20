/*== DAY 71 == [SAT MAR 19 2016] == */
/*
 * "Yosemite"
 * Dataviz from USGS map data
 */
import blobDetection.*;
import peasy.*;
 
int fCount = 128;
int fDiv = 5;
 
PeasyCam cam;
PImage map;

int levels = 12;                    
float factor = 1.0;                     
float elevation = 128;          

color colorBack = color(255);
color colorStart =  color(0,0,0,255);               
color colorEnd = color(0,0,0,90);              

BlobDetection[] blobDetectors;

void setup() {
  //size(640, 640, P3D);
  size(1200, 1200, P3D);
  smooth(8);
  frameRate(15);
  
  map = loadImage("hawaii.png");
  
  cam = new PeasyCam(this,10);
  cam.rotateZ(-PI/1.0);
  cam.rotateX(-PI/2.0);
  //cam
  
  prepareContours();
}

void draw() {
  //if (frameCount >= fCount) {
    //noLoop();
    //return;
  //}
  
  background(colorBack);
  
  // track camera around
  //cam.lookAt(0,0,0);
  //cam.rotateZ(PI/(float)fCount);
  //cam.rotateY(-PI/(float)fCount);
  
  // sine curve building of layers
  //levels = (int)map(sin(map(frameCount, 0, fCount, 0, PI)),0,1,1,48);
  
  strokeWeight(1.5);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  
  translate(-map.width*factor/2, -map.height*factor/2);
  for (int i = 0; i < levels; i++) {
    translate(0, 0, elevation/levels);
    drawContours(i);
  }  
  
  // video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  //if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
}


void prepareContours() {
  blobDetectors = new BlobDetection[levels];
  for (int i = 0; i < levels; i++) {
    blobDetectors[i] = new BlobDetection(map.width, map.height);
    blobDetectors[i].setThreshold(i/(float)levels);
    blobDetectors[i].computeBlobs(map.pixels);
  }
}

void drawContours(int i) {
  Blob blob;
  EdgeVertex eA, eB;

  // multiple blobs may be detected per level
  for (int n = 0; n < blobDetectors[i].getBlobNb(); n++) {
    blob = blobDetectors[i].getBlob(n);
    if (blob != null) {
      stroke(lerpColor(colorStart, colorEnd, (i/(float)levels)));
      noFill();

      for (int m = 0; m < blob.getEdgeNb(); m++) {
        eA = blob.getEdgeVertexA(m);
        eB = blob.getEdgeVertexB(m);
        if (eA !=null && eB !=null) {
          //vertex(eA.x*map.width*factor, eA.y*map.height*factor);
          //vertex(eB.x*map.width*factor, eB.y*map.height*factor); 

          line(
            eA.x*map.width*factor, eA.y*map.height*factor, 
            eB.x*map.width*factor, eB.y*map.height*factor 
          );
        }
      }
    }
  }
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("output_######.png");
  if (key == '+') {
    levels++;
    println("levels: " + levels);
    prepareContours();
  }
  if (key == '-') {
    levels--;
    println("levels: " + levels);
    prepareContours();
  }  
  if (key == '0') {
    println("elevation: " + elevation);
    elevation++;
  }  
  if (key == '9') {
    println("elevation: " + elevation);
    elevation--;
  }  
  if (key == ' ') {
    cam = new PeasyCam(this,200);
  }
}
/*== DAY 70 == [FRI MAR 18 2016] == */
/*
 * "Topo"
 * Topographic contours using blob detection.
 * https://www.instagram.com/slimesunday/
 *
 * == CONTROL ==
 * mouse    camera control
 * +/-      num countour levels
 * 9/0      spread/compress elevation
 * space    reset camera
 */
import blobDetection.*;
import peasy.*;
 
int fCount = 128;
int fDiv = 5;
 
PeasyCam cam;
PImage map;

int levels = 0;                    
float factor = 1.0;                     
float elevation = 64;          

color colorBack = color(0);
color colorStart =  color(0,900,900,100);               
color colorEnd = color(100,900,900,100);              

BlobDetection[] blobDetectors;

void setup() {
  //size(640, 640, P3D);
  size(1200, 1200, P3D);
  smooth();
  frameRate(15);
  
  colorMode(HSB, 360, 100, 100, 100);
  
  colorBack = color(0);
  colorStart =  color(320,90,90);               
  colorEnd = color(390,90,90);              
  
  map = loadImage("map.png");
  
  cam = new PeasyCam(this,200);
  cam.rotateZ(-PI/5.0);
  cam.rotateX(-PI/4.0);
}

void draw() {
  if (frameCount >= fCount) {
    noLoop();
    return;
  }
  
  background(colorBack);
  
  // track camera around
  cam.lookAt(0,0,0);
  cam.rotateZ(PI/(float)fCount);
  cam.rotateY(-PI/(float)fCount);
  
  // sine curve building of layers
  levels = (int)map(sin(map(frameCount, 0, fCount, 0, PI)),0,1,1,48);
  prepareContours();
  
  strokeWeight(1.0 + 8 - sqrt(levels));
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
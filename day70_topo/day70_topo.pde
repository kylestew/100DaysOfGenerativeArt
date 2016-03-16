/*== DAY 70 == [FRI MAR 18 2016] == */
/*
 * "Contours"
 * ...
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
 
PeasyCam cam;
PImage map;

int levels = 35;                    
float factor = 1;                     
float elevation = 55;                 

color colorBack = color(0);
color colorStart =  color(0);               
color colorRange =  color(100);              

BlobDetection[] blobDetectors;

void setup() {
  size(640, 640, P3D);
  
  cam = new PeasyCam(this,200);
  map = loadImage("map.png");
  
  prepareContours();
}

void draw() {
  background(colorBack);
  
  translate(-map.width*factor/2, -map.height*factor/2);
  for (int i = 0; i < levels; i++) {
    translate(0, 0, elevation/levels);
    drawContours(i);
  }  
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
      stroke(255);

  //    stroke((i/levels*colorRange)+colorStart,100,100);      // coloring the contours

      for (int m = 0; m < blob.getEdgeNb(); m++) {
        eA = blob.getEdgeVertexA(m);
        eB = blob.getEdgeVertexB(m);
        if (eA !=null && eB !=null) {
          
          // TRY: play with line thicknesses here
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
    prepareContours();
  }
  if (key == '-') {
    levels--;
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
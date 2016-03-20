/*== DAY 72 == [SUN MAR 20 2016] == */
/*
 * "Blob Experiment"
 * Animated Perlin noise used as the topo map data.
 */
import blobDetection.*;
import peasy.*;
 
int fCount = 15*15;
int fDiv = 2;
 
PeasyCam cam;
PImage map;

int levels = 6;                    
float factor = 1.0;                     
float elevation = 1;          

color colorBack;
color colorStart;               
color colorEnd;              

BlobDetection[] blobDetectors;

void setup() {
  size(640, 640, P3D);
  smooth();
  frameRate(15);
  
  colorBack = color(0);
  colorStart =  color(320,90,90);               
  colorEnd = color(390,90,90);              
  
  cam = new PeasyCam(this,150);
  cam.rotateZ(-PI/5.0);
  cam.rotateX(-PI/4.0);
}

void draw() {
  if (frameCount >= fCount) {
   noLoop();
   return;
  }
  println(frameCount);
  
  background(colorBack);

  float noiseDiv = 0.012;
  noiseDetail(2, 0.58);
  
  colorMode(RGB, 1, 1, 1, 1);
  map = createImage(width, height, RGB);
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float h = noise((x)*noiseDiv, (y)*noiseDiv, frameCount/12.0);
      map.pixels[(int)(x + y * width)] = color(h,h,h);
    }
  }
  
    
  prepareContours();
  
  colorMode(HSB, 360, 1, 1, 1);
  strokeWeight(4);
  strokeJoin(ROUND);
  strokeCap(PROJECT);
  
  translate(-map.width*factor/2, -map.height*factor/2);
  for (int i = 0; i < levels; i++) {
    translate(0, 0, elevation);
    drawContours(i); 
  }  
  
  
  // video
  //if (frameCount >= 0) saveFrame("output/frame########.png");
  // gif
  if (frameCount % fDiv == 0) saveFrame("output/frame####.gif");
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
      
      stroke(0,0,1,1);
      fill((n * frameCount) / 4.0, 1, 1);

      beginShape();
      float x0 = 0;
      float y0 = 0;
      boolean first = true;
      for (int m = 0; m < blob.getEdgeNb(); m++) {
        
        // pair of vertices to draw
        eA = blob.getEdgeVertexA(m);
        eB = blob.getEdgeVertexB(m);
        
        if (first) {
          x0 = eA.x;
          y0 = eA.y;
          first = false;
        }
        
        if (eA != null && dist(x0, y0, eA.x, eA.y) < 0.2) {
          vertex(eA.x*map.width*factor, eA.y*map.height*factor);
          x0 = eA.x;
          y0 = eA.y;
        }

        if (eB != null && dist(x0, y0, eB.x, eB.y) < 0.2) {
          vertex(eB.x*map.width*factor, eB.y*map.height*factor); 
          x0 = eB.x;
          y0 = eB.y;
        }
      }
      endShape(CLOSE);
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
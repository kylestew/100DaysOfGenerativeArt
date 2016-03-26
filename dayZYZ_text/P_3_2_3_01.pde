/**
 * fontgenerator with dynamic elements. letter ouline consist of linked agents.
 * 
 * MOUSE
 * press + position x  : letter distortion
 * 
 * KEYS
 * a-z                 : text input (keyboard)
 * del, backspace      : clear screen
 */
import geomerative.*;

String typedText = "Hello";

int fontSize = 184;

//float spacing = 20;
//float spaceWidth = 150; // width of letter ' '
//float lineSpacing = fontSize*1.5;
//float stepSize = 2;
//float danceFactor = 1;
//float letterX = 50;
//float textW = 50;
//float letterY = lineSpacing;

RFont font;
RGroup grp;
RPoint[] pnts;

void setup() {
  size(700,700); 
  smooth();

  frameRate(15);

  RG.init(this);
  font = new RFont("OpenSans-Regular.ttf", fontSize, RFont.CENTER);

  // break up segments into multiple points
  RCommand.setSegmentLength(25);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //grp = font.toGroup(typedKey+"");
  //textW = grp.getWidth();
  //pnts = grp.getPoints(); 

  background(255);
}

void draw() {
  noFill();

  // translation according the amoutn of letters
  //translate(letterX, letterY);

  //// distortion on/off
  //if (mousePressed) danceFactor = map(mouseX, 0,width, 1,3);
  //else danceFactor = 1;

  //// are there points to draw?
  //if (grp.getWidth() > 0) {
  //  // let the points dance
  //  for (int i = 0; i < pnts.length; i++ ) {
  //    pnts[i].x += random(-stepSize,stepSize)*danceFactor;
  //    pnts[i].y += random(-stepSize,stepSize)*danceFactor;  
  //  }

  //  //  ------ lines: connected rounded  ------
  //  strokeWeight(0.08);
  //  //stroke(200,0,0);
  //  beginShape();
  //  // start controlpoint
  //  curveVertex(pnts[pnts.length-1].x,pnts[pnts.length-1].y);
  //  // only these points are drawn
  //  for (int i=0; i<pnts.length; i++){
  //    curveVertex(pnts[i].x, pnts[i].y);
  //  }
  //  curveVertex(pnts[0].x, pnts[0].y);
  //  // end controlpoint
  //  curveVertex(pnts[1].x, pnts[1].y);
  //  endShape();

  //  //  ------ lines: connected straight  ------
  //  strokeWeight(0.1);
  //  stroke(0);
  //  beginShape();
  //  for (int i=0; i<pnts.length; i++){
  //    vertex(pnts[i].x, pnts[i].y);
  //    ellipse(pnts[i].x, pnts[i].y, 7, 7);
  //  }
  //  vertex(pnts[0].x, pnts[0].y);
  //  endShape();
  //}
}

//void keyPressed() {
//  if (key != CODED) {
//    switch(key) {
//    case ENTER:
//    case RETURN:
//      grp = font.toGroup(""); 
//      letterY += lineSpacing;
//      textW = letterX = 20;
//      break;
//    case ESC:
//    case TAB:
//      break;
//    case BACKSPACE:
//    case DELETE:
//      background(255);
//      grp = font.toGroup(""); 
//      textW = letterX = 0;
//      letterY = lineSpacing;
//      break;
//    case ' ':
//      grp = font.toGroup(""); 
//      letterX += spaceWidth;
//      break;
//    default:
//      typedKey = key;
//      // add to actual pos the letter width
//      textW += spacing;
//      letterX += textW;
//      grp = font.toGroup(typedKey+"");
//      textW = grp.getWidth();
//      pnts = grp.getPoints(); 
//    }
//  } 
//}
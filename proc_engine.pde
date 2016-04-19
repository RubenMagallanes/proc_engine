//private World world; // the world
private int[][] temp_map = {
      {1, 1, 1, 1, 1}, 
      {1, 2, 2, 2, 1}, 
      {1, 2, 3, 2, 1}, 
      {1, 2, 2, 2, 1}, 
      {1, 1, 1, 1, 1}};
private int voxel = 20;// in pixels

void setup() {
      size(450, 450, P3D);
      
      noSmooth(); // anti alias
     // ortho();
      
      translateX = 0;
      translateY = 0;
      translateZ = 0;
      rotateDegsX = 50;// tilt back (rotateX done before Z)
      rotateDegsY = 0; 
      rotateDegsZ = 15;// pull front to left a lil
      
}

int translateX, translateY, translateZ;
int rotateDegsX, rotateDegsY, rotateDegsZ;

boolean keyW=false, keyA=false, keyS=false, keyD=false, 
      keyQ=false, keyE=false; // wasd keys pressed

//String turn;
void draw() {
      lights();
      background(50,50,50);
      translate(width/2, height/2);// point of origen with 0,0 centered
      //scale(2.0,2.0,2.0);
      //check for key events
      checkKeys();
      pushMatrix();  
      //translate here makes everything move
      
      //draw ui elements (make own func) // TODO
      //draw axes in top left
      pushMatrix();
      translate(-150,-150);
      rotateX(radians(rotateDegsX));
      rotateY(radians(rotateDegsY+5));
      rotateZ(radians(rotateDegsZ));
      drawAxes();
      popMatrix();
     //translate here does some weird ortho stuff, a,d move left right fine, but w,s go up and down
       
     // pushMatrix();
      rotateX(radians(rotateDegsX));
      rotateY(radians(rotateDegsY));
      rotateZ(radians(rotateDegsZ));
      
      //translate here makes translations follow axes on screen
        translate(translateX, translateY, translateZ); 
     
    
      drawAxes();
      drawOrigin(15);
      drawGrid();
      
      drawEnvironment();
      //popMatrix();
       
      
      popMatrix();
      
}
/**      draw everything in th scene      */
private void drawEnvironment(){
      //pushMatrix();
      //translate(95,95);
      //fill(20,100,20);
      //stroke(20,100,20);
      
      //box(10);
      //popMatrix();
      pushMatrix();
      pushStyle();
      fill(20,100,20);
      stroke(50,130,50);
      for (int i = 0; i< 5; i++){
            for (int j = 0; j< 5; j++){
                  pushMatrix();
                  translate((i*voxel) - (voxel/2), (j*voxel) - (voxel/2), temp_map[j][i] * voxel);
                  box(voxel);
                   popMatrix();
            }
      }
      popStyle();
      popMatrix();
}

private void checkKeys(){
      if (keyW) {
          translateY +=5;
          
      }
      if (keyA) {
           translateX +=5;
      }
      if (keyQ) {
            rotateDegsZ ++; 
            if (rotateDegsZ > 360) rotateDegsZ=0;
      }
      if (keyS) {
           translateY -=5;
      }
      if (keyD) {
           translateX -=5;
      }
      if (keyE) {
            rotateDegsZ --; 
            if (rotateDegsZ < 0) rotateDegsZ=360;
      }
}
/**
 draws 3d cube thingie at center
 */
private void drawOrigin(int cubeSize) {
      pushMatrix();
      stroke(190, 190, 190);
      fill(255, 0);//transparent

      lineRect(0, 0, cubeSize, cubeSize, "center");// draw on x,y plane
      rotateX(PI/2); // rotate around X
      lineRect(0, 0, cubeSize, cubeSize, "center");// draw on y,z plane
      rotateY(PI/2);// rotate around Y
      lineRect(0, 0, cubeSize, cubeSize, "center");// draw on x,z plane
      popMatrix();// preserve previous transform stack
}

/**
 draw the 10x10 grid at current location
 */
private void drawGrid() {
      pushMatrix();
      //fill(0,0);//transparent
      stroke(255);

      for (int i = -100; i< 100; i+=20) {
            for (int j = -100; j< 100; j+=20) {
                  lineRect(i, j, 20, 20, "corner");
            }
      }
      popMatrix();
}
/** 
      draws a trio of axes, red along x, green along y, blue along z
*/private void drawAxes() {
      pushMatrix();
      pushStyle();
      strokeWeight(3);
      
      stroke(255,0,0);//x
      line(0,0,50,0);
      
      stroke(0,255,0);//y
      line(0,0,0,50);
      
      stroke(0,0,255);//z
      rotateY(radians(-90));
      line(0,0,50,0);
      
      popStyle();
      popMatrix();
}
/**
 helper function for drawing
 draws a square out of 4 lines
 */
private void lineRect(int x, int y, int w, int h, String mode) {
      if (mode.equals("center")) { // pull square back by half width, height 
            x = x-(w/2);
            y = y-(h/2);
      }
      line(x, y, x, y+h);// left
      line(x, y, x+w, y);//top
      line(x+w, y, x+w, y+h);//right
      line(x, y+h, x+w, y+h);//bottom
}

void  mousePressed() {
      
}
void mouseReleased() {
}
void keyPressed() {
      if(keyCode == 32) {
            translateX = 0; 
            translateY = 0;  
            translateZ = 0;
            rotateDegsX = 50;
            rotateDegsZ = 15;
      }
      if (key == 'w' || key == 'W')
            keyW = true;
      else if (key == 'a' || key == 'A') {
            keyA = true;
      } else if (key == 's' || key == 'S') {
            keyS = true;
      } else if (key == 'd' || key == 'D') {
            keyD = true;
      } else if (key == 'q' || key == 'Q') {
            keyQ = true;
      } else if (key == 'e' || key == 'E') {
            keyE = true;
      } 
}
void keyReleased() {
      if (key == 'w' || key == 'W')
            keyW = false;
      else if (key == 'a' || key == 'A') {
            keyA = false;
      } else if (key == 's' || key == 'S') {
            keyS = false;
      } else if (key == 'd' || key == 'D') {
            keyD = false;
      }else if (key == 'q' || key == 'Q') {
            keyQ = false;
      } else if (key == 'e' || key == 'E') {
            keyE = false;
      } 
}
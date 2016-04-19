//private World world; // the world
private int[][] temp_map = {
      {1, 1, 1, 1, 1}, 
      {1, 2, 2, 2, 1}, 
      {1, 2, 3, 2, 1}, 
      {1, 2, 2, 2, 1}, 
      {1, 1, 1, 1, 1}};
private int tilesize = 10;// in pixels

void setup() {
      size(450, 450, P3D);
      noSmooth(); // anti alias
      lights();
      translateX = 0;
      translateY = 0;
      translateZ = 0;
      rotateRadsX = 30;
      rotateRadsY = 0; 
      rotateRadsZ = 30;
      background(0);
}

int gridSize= 50;
int gridSizeX = width/gridSize;
int gridSizeY = height/gridSize;
      
int translateX, translateY, translateZ;
int rotateRadsX, rotateRadsY, rotateRadsZ;

//String turn;
void draw() {
      translate(width/2,height/2);// point of origen with 0,0 centered
      //scale(2.0,2.0,2.0);
      pushMatrix();     
      
      translate(translateX, translateY, translateZ); 
      rotateX(radians(rotateRadsX));
      rotateY(radians(rotateRadsY));
      rotateZ(radians(rotateRadsZ));
      drawOrigin(15);
      drawGrid();
      drawAxes();
      //draw everything
      popMatrix();
      
      
}
/**
draws 3d cube thingie at center
*/
private void drawOrigin(int cubeSize){
      pushMatrix();
      stroke(255,0,0);
      fill(255,0);//transparent
      
      lineRect(0,0,cubeSize,cubeSize, "center");// draw on x,y plane
      rotateX(PI/2); // rotate around X
      lineRect(0,0,cubeSize,cubeSize, "center");// draw on y,z plane
      rotateY(PI/2);// rotate around Y
      lineRect(0,0,cubeSize,cubeSize, "center");// draw on x,z plane
      popMatrix();// preserve previous transform stack
}

/**
      draw the 10x10 grid at current location
*/
private void drawGrid(){
      pushMatrix();
      //fill(0,0);//transparent
      stroke(255);
      
      for (int i = -100; i< 100; i+=20){
            for (int j = -100; j< 100; j+=20){
                  lineRect(i,j,20,20,"corner");
            }
      }
      popMatrix();
}
/**
helper function for drawing
draws a square out of 4 lines
*/
private void lineRect(int x, int y, int w, int h, String mode){
     if(mode.equals("center")) { // pull square back by half width, height 
           x = x-(w/2);
           y = y-(h/2);
     }
      line(x,y,x, y+h);// left
      line(x,y,x+w,y);//top
      line(x+w,y,x+w,y+h);//right
      line(x,y+h,x+w,y+h);//bottom
}

void  mousePressed() {
}
void mouseReleased() {
}
void keyPressed(){

}
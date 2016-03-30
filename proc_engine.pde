

private World world; // the world


private int tilesize = 20;// in pixels


void setup(){
      size(450,450);
      noSmooth();
      world = new World();
}

private int margin =25; 
//String turn;
void draw(){
      //draw text stuff
      stroke(0);
      fill(0);
      textSize(15);
      //turn = "turn: " + world.turnNumber();
      //text(turn, 10, 15); 
    

      //refactor frequently used variables maybe, save to locals instead of referenced? 
      //but for now , just draw tiles statically :^)

      //tiles
      //fill(#17AF0B);
      stroke(#17AF0B);
      stroke (10,100); // draw grid
      for (int i=0; i< world.mapSize(); i++){
            for (int j=0; j< world.mapSize(); j++){
                  fill(#17AF0B);
                  stroke(10,100);
                  if (mouseX >((i*tilesize))+ margin && mouseX < (margin+((i+1)*tilesize))){
                       if (mouseY >((j*tilesize))+ margin && mouseY < (margin+((j+1)*tilesize))){
                              stroke(0);
                              if (pressed)
                                    fill(#7ED388);
                       }
                 }
                  
                  rect(margin+ (tilesize* i), margin+ (tilesize* j), tilesize, tilesize);
                  
                  
            }
      }
      //draw things on tiles
      //for () //TODO
      
      //query "height sets" for borderlines - set of pointers to tiles that are of the
      //saem height, every one needs to draw boundry lines
}
boolean pressed = false;
void  mousePressed() {
      pressed = true;
}
void mouseReleased(){
      pressed = false;
}
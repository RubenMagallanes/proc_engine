private World world; // the world


private int tilesize = 5;// in pixels
void setup(){
      size(300,300);
      noSmooth();
      world = new World();
}

private int margin =25; 
String turn;
void draw(){
      //draw text stuff
      stroke(0);
      fill(0);
      textSize(15);
      turn = "turn: " + world.turnNumber();
      text(turn, 10, 15); 
    

      //refactor frequently used variables maybe, save to locals instead of referenced? 
      //but for now , just draw tiles statically :^)

      //tiles
      fill(#17AF0B);
      stroke(#17AF0B);
      //stroke (10,100); // draw grid
      for (int i=0; i< world.mapSize(); i++){
            for (int j=0; j< world.mapSize(); j++){
                  rect(margin+ (tilesize* i), margin+ (tilesize* j), tilesize, tilesize);
                   
            }
      }
      //draw things on tiles
      //for () //TODO
      
      //query "height sets" for borderlines - set of pointers to tiles that are of the
      //saem height, every one needs to draw boundry lines
}

void onClick(){
      print("ayyy");
}
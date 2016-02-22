private World world; // the world


private int tilesize = 5;// in pixels
void setup(){
      size(300,300);
      world = new World();
}

private int margin =25; 
void draw(){
      //update map based on system clock time
      //draw current state of map
      //refactor frequently used variables maybe, save to locals instead of referenced? 
      //but for now , just draw tiles statically :^)
      
      //tiles
      fill(#17AF0B);
      //stroke (10,100); // draw grid
      for (int i=0; i< world.mapSize(); i++){
            for (int j=0; j< world.mapSize(); j++){
                  rect(margin+ (tilesize* i), margin+ (tilesize* j), tilesize, tilesize);
            }
      }
      //gridlines
      /*stroke (0, 1);
      for (int i=0; i< world.mapSize()+1; i++){
            line(margin, margin+ (i* tilesize),margin+ (world.mapSize()* tilesize), margin+ (i* tilesize));
            for(int j=0; j< world.mapSize()+1; j++){
                line(margin+ (j* tilesize), margin,  margin+ (j* tilesize), margin+ (world.mapSize()* tilesize));
            }
      }*/
}
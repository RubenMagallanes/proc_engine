import java.util.*;
/**
      takes care of all world variables
*/
class World {
      private WorldMap map; // all the tiles, query this for stuff 
 
      //int turn / tick
      //private int turn; 
                              //for querying for drawing
      //set of players
      //set of npcs
     // private Set npsDrawSet<> //TODO
      //set of terrain (trees etc)
                              //for accepting input
      //list of sources of input () - one for each player, and one for nature//todo
      
      //set of things that are affected by tick()
      //private Set<Tickable> tickSet = new HashSet<Tickable>();//latern split this to two sets
      
      public World(){
            map = new WorldMap();
            //turn = 0;
      }
      //functions to grab specifics about the world
     /* public boolean tick(){
            turn++;
            for (Tickable t: tickSet){
                  if (!t.tick()) return false;
            }
            return true;
      }*/
     
      public int mapSize(){
            return map.worldSize;
      }
     /* public int turnNumber(){
            return turn;
      }*/
}

/**      
      takes care of tiles in a world (Map in namespace was taken)
*/
class WorldMap {
      public final int worldSize = 20;
      private Tile[][] grid; 
     
      public WorldMap(){
            grid = new Tile[worldSize][worldSize];
            for (int i = 0; i< worldSize; i++){
                  for (int j = 0; j< worldSize; j++){
                        grid[i][j] = new Tile(1);
                        //TODO add tile to relevant heightSet / landset or whatever
                  }
            }
           
      }
      public int tileHeight(int x, int y){
            return grid[x][y].height();
      }
}

/**   a single tile in the worldMap
*/
class Tile {
      private int h; 
      //material can be dirt, sand, rock
      private String m; // change to enumaterial?
      
      public Tile(int hei){
            this.h = hei;
            this.m = "dirt";
      }
      public Tile (int hei, String mat){
            this.h = hei;
            this.m = mat;
      }
     public int height(){
            return this.h;
      }
      public String material(){
            return this.m;
      }
}


//TODO entity- animal, structure- some permit entities, others donot, material- dirt rock sand water
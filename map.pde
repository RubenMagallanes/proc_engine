import java.util.*;
/**
      takes care of all world variables
*/
class World {
      private WorldMap map; // all the tiles, query this for stuff 
 
      public World(){
            map = new WorldMap();
      }
     
      public int mapSize(){
            return map.worldSize;
      }

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
      //material can be dirt, grass, sand, rock
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
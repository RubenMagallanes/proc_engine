/**
      takes care of all world variables
*/
class World {
      private WorldMap map; // all the tiles, query this for stuff 
      //world variables
      public World(){
            map = new WorldMap();
      }
      /** change this to bunch of read only functions to get specifics */
      public WorldMap tiles(){
            return map;
      }
      
}

/**      
      takes care of tiles in a world (Map in namespace was taken)
*/
class WorldMap {
      private int worldSize = 10;
      private Tile[][] grid; 
      public WorldMap(){
            grid = new Tile[worldSize][worldSize];
            for (int i = 0; i< worldSize; i++){
                  for (int j = 0; j< worldSize; j++){
                        grid[i][j] = new Tile(1);
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
      private int height; 
      public Tile(int h){
            height = h;
      }
      public int height(){
            return this.height;
      }
}


// entity- animal, structure- some permit entities, others donot, material- dirt rock sand water
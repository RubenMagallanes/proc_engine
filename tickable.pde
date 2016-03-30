
/**   defines something that chenges each tick of thw world clock. 
      tick() is called on each implementing object, each then handles 
      their own actions from there
*/
public interface Tickable {
      /**
            do one tick's worth of actions.
      */ 
      public boolean tick(); 
       
}
public abstract class Being implements Tickable {

      /** 
            returns a bunch of pixels to draw //todo
      */
      public boolean paint(int x, int y);
      
      public color getColor();
}
public class Mover extends Being {
      
      /**move one square randomly*/
      public boolean tick(){
            
            return true;
      }
      public boolean paint(int x, int y){
            return false;
      }
      
      public color getColor(){
            return Color(10,10,255);
      }
}
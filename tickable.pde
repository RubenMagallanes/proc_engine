
/**   defines something that chenges each tick of thw world clock. 
      tick() is called on each implementing object, each then handles 
      their own actions from there
*/
public interface Tick {
      /**
            do one tick's worth of actions.
      */ 
      public tick(); 
       
}
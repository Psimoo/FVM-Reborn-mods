package a_4797
{
   public class a_4685
   {
      
      public static const PLAY:int = 0;
      
      public static const PAUSE:int = 1;
      
      public static const STOP:int = 2;
      
      public function a_4685()
      {
         super();
      }
      
      public static function getState(v:int) : int
      {
         if(v < 0 || v > 2)
         {
            v = 1;
         }
         return v;
      }
   }
}


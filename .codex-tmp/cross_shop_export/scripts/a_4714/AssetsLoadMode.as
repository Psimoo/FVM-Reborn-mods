package a_4714
{
   public class AssetsLoadMode
   {
      
      public static const CONCURRENT:int = 0;
      
      public static const SINGLE:int = 1;
      
      public function AssetsLoadMode()
      {
         super();
      }
      
      public static function getMode(mode:int) : int
      {
         if(mode < 0 || mode > 1)
         {
            mode = 0;
         }
         return mode;
      }
   }
}


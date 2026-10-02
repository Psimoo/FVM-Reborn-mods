package a_4729
{
   public class a_1789
   {
      
      private static var eventManager:a_1779;
      
      public function a_1789()
      {
         super();
      }
      
      public static function getInstance() : a_1779
      {
         if(null == eventManager)
         {
            eventManager = new a_1779();
         }
         return eventManager;
      }
      
      public static function reBuild() : a_1779
      {
         return new a_1779();
      }
   }
}


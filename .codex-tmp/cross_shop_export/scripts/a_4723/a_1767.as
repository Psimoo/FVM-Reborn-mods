package a_4723
{
   public class a_1767
   {
      
      private static var instance:a_1767;
      
      private var a_540:int;
      
      public function a_1767()
      {
         super();
      }
      
      public static function getInstance() : a_1767
      {
         if(instance == null)
         {
            instance = new a_1767();
         }
         return instance;
      }
      
      public function set SystemTime(iSystemTime:int) : void
      {
         this.a_540 = iSystemTime;
      }
      
      public function get SystemTime() : int
      {
         return this.a_540;
      }
   }
}


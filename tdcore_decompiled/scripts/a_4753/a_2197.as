package a_4753
{
   public class a_2197
   {
      
      private static var a_773:a_2197;
      
      private var a_749:a_2179;
      
      public function a_2197()
      {
         super();
      }
      
      public static function getInstance() : a_2197
      {
         if(null == a_773)
         {
            a_773 = new a_2197();
         }
         return a_773;
      }
      
      public function a_1797(stTDGameLogic:a_2179) : Boolean
      {
         if(!stTDGameLogic is a_2179)
         {
            return false;
         }
         this.a_749 = stTDGameLogic;
         return true;
      }
   }
}


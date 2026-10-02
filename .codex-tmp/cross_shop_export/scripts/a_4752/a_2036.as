package a_4752
{
   import flash.utils.ByteArray;
   
   public class a_2036
   {
      
      private static var instance:a_2036;
      
      public var a_783:String;
      
      public var m_iUin:int;
      
      public function a_2036()
      {
         super();
      }
      
      public static function getInstance() : a_2036
      {
         if(instance == null)
         {
            instance = new a_2036();
         }
         return instance;
      }
      
      public function setSignature(signature:ByteArray) : void
      {
         this.a_783 = Base64.encode(signature);
      }
   }
}


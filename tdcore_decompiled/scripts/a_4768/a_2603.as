package a_4768
{
   import a_4759.b_167;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.miscserver.a_2979;
   import flash.utils.ByteArray;
   
   public class a_2603 extends b_167
   {
      
      private static var a_845:a_2603;
      
      private static var a_846:int;
      
      public function a_2603()
      {
         super();
      }
      
      public static function getInstance() : a_2603
      {
         if(null == a_845)
         {
            a_845 = new a_2603();
         }
         return a_845;
      }
      
      private function a_2607(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var responseComposeCard:a_2979 = new a_2979();
         if(!responseComposeCard.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseComposeCard failed.");
            return;
         }
         if(0 == responseComposeCard.m_nResultID)
         {
         }
      }
   }
}


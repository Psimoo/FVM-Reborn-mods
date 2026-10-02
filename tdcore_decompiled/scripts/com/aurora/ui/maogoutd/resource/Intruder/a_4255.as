package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.resource.BaseBattleElementCreatorFactoryEncrypt;
   
   public class a_4255 extends BaseBattleElementCreatorFactoryEncrypt
   {
      
      private static var a_1286:a_4255;
      
      public function a_4255()
      {
         super();
      }
      
      public static function getInstance() : a_4255
      {
         if(null == a_1286)
         {
            a_1286 = new a_4255();
         }
         return a_1286;
      }
      
      public function a_4256(iTypeId:uint) : a_4206
      {
         return GetObject(iTypeId) as a_4206;
      }
   }
}


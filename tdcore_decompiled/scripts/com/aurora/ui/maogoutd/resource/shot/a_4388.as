package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.resource.BaseBattleElementCreatorFactoryEncrypt;
   
   public class a_4388 extends BaseBattleElementCreatorFactoryEncrypt
   {
      
      private static var a_1286:a_4388;
      
      public function a_4388()
      {
         super();
      }
      
      public static function getInstance() : a_4388
      {
         if(null == a_1286)
         {
            a_1286 = new a_4388();
         }
         return a_1286;
      }
      
      public function a_4389(iTypeId:uint) : a_4348
      {
         return GetObject(iTypeId) as a_4348;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.resource.BaseBattleElementCreatorFactoryEncrypt;
   
   public class a_4012 extends BaseBattleElementCreatorFactoryEncrypt
   {
      
      private static var a_1286:a_4012;
      
      public function a_4012()
      {
         super();
      }
      
      public static function getInstance() : a_4012
      {
         if(null == a_1286)
         {
            a_1286 = new a_4012();
         }
         return a_1286;
      }
      
      public function a_4013(iTypeId:uint) : a_3962
      {
         return GetObject(iTypeId) as a_3962;
      }
   }
}


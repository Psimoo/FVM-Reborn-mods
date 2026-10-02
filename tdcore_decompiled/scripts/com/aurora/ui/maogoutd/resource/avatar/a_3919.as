package com.aurora.ui.maogoutd.resource.avatar
{
   import com.aurora.ui.maogoutd.resource.BaseBattleElementCreatorFactoryEncrypt;
   
   public class a_3919 extends BaseBattleElementCreatorFactoryEncrypt
   {
      
      private static var a_1286:a_3919;
      
      public function a_3919()
      {
         super();
      }
      
      public static function getInstance() : a_3919
      {
         if(null == a_1286)
         {
            a_1286 = new a_3919();
         }
         return a_1286;
      }
      
      public function a_3920(iTypeId:uint) : a_3924
      {
         return GetObject(iTypeId) as a_3924;
      }
   }
}


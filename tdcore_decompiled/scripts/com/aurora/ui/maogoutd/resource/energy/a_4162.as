package com.aurora.ui.maogoutd.resource.energy
{
   import com.aurora.ui.maogoutd.resource.BaseBattleElementCreatorFactoryEncrypt;
   
   public class a_4162 extends BaseBattleElementCreatorFactoryEncrypt
   {
      
      private static var a_1286:a_4162;
      
      public function a_4162()
      {
         super();
      }
      
      public static function getInstance() : a_4162
      {
         if(null == a_1286)
         {
            a_1286 = new a_4162();
         }
         return a_1286;
      }
      
      public function a_4163(iTypeId:uint) : a_4157
      {
         return GetObject(iTypeId) as a_4157;
      }
   }
}


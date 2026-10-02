package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class a_4126 extends a_4108
   {
      
      protected var a_1407:a_3953;
      
      protected var a_1408:a_4206;
      
      public function a_4126()
      {
         super();
      }
      
      public static function a_3926() : a_4126
      {
         return PoolManager.getInstance().CheckOutOne(a_4126,IceFreezeUpEffectMovie) as a_4126;
      }
   }
}


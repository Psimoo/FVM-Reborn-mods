package com.aurora.ui.maogoutd.resource.Intruder.zombie.handEffect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class JumpingMouseHandEffect extends BaseHandEffect
   {
      
      public function JumpingMouseHandEffect()
      {
         super();
      }
      
      public static function a_3926() : CommonHandEffect
      {
         return PoolManager.getInstance().CheckOutOne(CommonHandEffect,JumpingMouseHandEffectMovie) as CommonHandEffect;
      }
   }
}


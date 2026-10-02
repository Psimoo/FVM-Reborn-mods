package com.aurora.ui.maogoutd.resource.effect.baseClimb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class LanderFullEffect extends BaseClimbEffect
   {
      
      public function LanderFullEffect()
      {
         super();
      }
      
      public static function a_3926() : BaseClimbEffect
      {
         return PoolManager.getInstance().CheckOutOne(LanderFullEffect) as LanderFullEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LanderFullEffectMovie;
      }
   }
}


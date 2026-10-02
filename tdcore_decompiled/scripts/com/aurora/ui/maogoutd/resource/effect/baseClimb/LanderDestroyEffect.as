package com.aurora.ui.maogoutd.resource.effect.baseClimb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class LanderDestroyEffect extends BaseClimbEffect
   {
      
      public function LanderDestroyEffect()
      {
         super();
      }
      
      public static function a_3926() : BaseClimbEffect
      {
         return PoolManager.getInstance().CheckOutOne(LanderDestroyEffect) as LanderDestroyEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LanderDestroyEffectMovie;
      }
   }
}


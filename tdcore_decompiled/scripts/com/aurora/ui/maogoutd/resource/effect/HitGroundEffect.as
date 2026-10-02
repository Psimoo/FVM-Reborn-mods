package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class HitGroundEffect extends a_4108
   {
      
      public function HitGroundEffect()
      {
         super();
      }
      
      public static function a_3926() : HitGroundEffect
      {
         return PoolManager.getInstance().CheckOutOne(HitGroundEffect) as HitGroundEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return HitGroundEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         return super.a_1797(isReversed);
      }
   }
}


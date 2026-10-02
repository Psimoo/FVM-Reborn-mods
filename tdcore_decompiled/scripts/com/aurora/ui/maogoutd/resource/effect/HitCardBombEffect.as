package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class HitCardBombEffect extends a_4108
   {
      
      public function HitCardBombEffect()
      {
         super();
      }
      
      public static function a_3926() : HitCardBombEffect
      {
         return PoolManager.getInstance().CheckOutOne(HitCardBombEffect) as HitCardBombEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return HitCardBombEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         return super.a_1797(isReversed);
      }
   }
}


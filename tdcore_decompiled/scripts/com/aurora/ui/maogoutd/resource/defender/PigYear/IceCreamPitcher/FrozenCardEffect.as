package com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4110;
   
   public class FrozenCardEffect extends a_4110
   {
      
      public function FrozenCardEffect()
      {
         super();
      }
      
      public static function a_3926() : FrozenCardEffect
      {
         return PoolManager.getInstance().CheckOutOne(FrozenCardEffect) as FrozenCardEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FrozenCardEffectMovie;
      }
   }
}


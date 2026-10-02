package com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4110;
   
   public class ShiHuaEffect extends a_4110
   {
      
      public function ShiHuaEffect()
      {
         super();
      }
      
      public static function a_3926() : ShiHuaEffect
      {
         return PoolManager.getInstance().CheckOutOne(ShiHuaEffect) as ShiHuaEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShiHuaEffectMovie;
      }
   }
}


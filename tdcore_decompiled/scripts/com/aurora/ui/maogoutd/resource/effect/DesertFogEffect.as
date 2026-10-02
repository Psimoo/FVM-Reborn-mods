package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class DesertFogEffect extends BaseDesertFogEffect
   {
      
      public function DesertFogEffect()
      {
         super();
      }
      
      public static function a_3926() : BaseDesertFogEffect
      {
         return PoolManager.getInstance().CheckOutOne(DesertFogEffect) as DesertFogEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DesertFogEffectMovie;
      }
   }
}


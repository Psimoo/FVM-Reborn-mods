package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DesertCross
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.BaseDesertFogEffect;
   
   public class DesertFog2Effect extends BaseDesertFogEffect
   {
      
      public function DesertFog2Effect()
      {
         super();
      }
      
      public static function a_3926() : BaseDesertFogEffect
      {
         return PoolManager.getInstance().CheckOutOne(DesertFog2Effect) as DesertFog2Effect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DesertFog2EffectMovie;
      }
      
      override public function get height() : Number
      {
         return 64;
      }
   }
}


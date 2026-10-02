package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class FallenEdenHolyNightGrailEffect extends FallenEdenHolyBaseGrailEffect
   {
      
      public function FallenEdenHolyNightGrailEffect()
      {
         super();
      }
      
      public static function a_3926() : FallenEdenHolyNightGrailEffect
      {
         return PoolManager.getInstance().CheckOutOne(FallenEdenHolyNightGrailEffect) as FallenEdenHolyNightGrailEffect;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         damageMAX = 30000;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return FallenEdenHolyNightGrailEffectMovie;
      }
   }
}


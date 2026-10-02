package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class FallenEdenHolyDayGrailEffect extends FallenEdenHolyBaseGrailEffect
   {
      
      public function FallenEdenHolyDayGrailEffect()
      {
         super();
      }
      
      public static function a_3926() : FallenEdenHolyDayGrailEffect
      {
         return PoolManager.getInstance().CheckOutOne(FallenEdenHolyDayGrailEffect) as FallenEdenHolyDayGrailEffect;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         damageMAX = 10000;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return FallenEdenHolyDayGrailEffectMovie;
      }
   }
}


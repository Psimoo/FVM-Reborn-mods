package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class ButterRunwayAcceEffect extends BaseAccelerationEffect
   {
      
      public function ButterRunwayAcceEffect()
      {
         super();
      }
      
      public static function a_3926() : BaseAccelerationEffect
      {
         return PoolManager.getInstance().CheckOutOne(ButterRunwayAcceEffect) as ButterRunwayAcceEffect;
      }
      
      override protected function IsPlayRate(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      override public function get width() : Number
      {
         return 80;
      }
      
      override public function get height() : Number
      {
         return 54;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return ButterRunwayAcceEffectMovie;
      }
   }
}


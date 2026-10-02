package com.aurora.ui.maogoutd.resource.Intruder.zombie.handEffect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WaterClimbMouseHandEffect extends BaseHandEffect
   {
      
      public function WaterClimbMouseHandEffect()
      {
         super();
      }
      
      public static function a_3926() : CommonHandEffect
      {
         return PoolManager.getInstance().CheckOutOne(CommonHandEffect) as CommonHandEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterClimbMouseHandEffectMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}


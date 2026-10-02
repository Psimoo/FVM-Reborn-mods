package com.aurora.ui.maogoutd.resource.Intruder.zombie.handEffect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class CommonHandEffect extends BaseHandEffect
   {
      
      public function CommonHandEffect()
      {
         super();
      }
      
      public static function a_3926() : CommonHandEffect
      {
         return PoolManager.getInstance().CheckOutOne(CommonHandEffect) as CommonHandEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return CommonHandEffectMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}


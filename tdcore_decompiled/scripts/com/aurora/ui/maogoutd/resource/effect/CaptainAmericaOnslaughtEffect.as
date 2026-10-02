package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class CaptainAmericaOnslaughtEffect extends a_4108
   {
      
      public function CaptainAmericaOnslaughtEffect()
      {
         super();
      }
      
      public static function a_3926() : a_4108
      {
         return PoolManager.getInstance().CheckOutOne(CaptainAmericaOnslaughtEffect) as CaptainAmericaOnslaughtEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return CaptainAmericaOnslaughtEffectMovie;
      }
   }
}


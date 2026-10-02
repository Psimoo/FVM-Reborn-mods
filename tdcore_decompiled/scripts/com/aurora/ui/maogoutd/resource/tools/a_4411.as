package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4411 extends a_4410
   {
      
      public function a_4411()
      {
         super();
      }
      
      public static function a_3926() : a_4411
      {
         return PoolManager.getInstance().CheckOutOne(a_4411) as a_4411;
      }
      
      override protected function getBindMovie() : Class
      {
         return BeShotAimedAlertMovie;
      }
   }
}


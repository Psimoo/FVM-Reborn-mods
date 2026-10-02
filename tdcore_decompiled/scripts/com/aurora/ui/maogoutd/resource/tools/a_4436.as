package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4436 extends a_4410
   {
      
      public function a_4436()
      {
         super();
      }
      
      public static function a_3926() : a_4436
      {
         return PoolManager.getInstance().CheckOutOne(a_4436) as a_4436;
      }
      
      override protected function getBindMovie() : Class
      {
         return OtherDefenseAlertMovie;
      }
   }
}


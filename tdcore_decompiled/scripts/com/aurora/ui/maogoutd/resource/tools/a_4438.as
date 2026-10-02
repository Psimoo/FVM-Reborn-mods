package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4438 extends a_4410
   {
      
      public function a_4438()
      {
         super();
      }
      
      public static function a_3926() : a_4438
      {
         return PoolManager.getInstance().CheckOutOne(a_4438) as a_4438;
      }
      
      override protected function getBindMovie() : Class
      {
         return ProduceEnergyDefenseAlertMovie;
      }
   }
}


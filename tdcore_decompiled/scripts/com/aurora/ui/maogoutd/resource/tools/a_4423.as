package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4423 extends a_4410
   {
      
      public function a_4423()
      {
         super();
      }
      
      public static function a_3926() : a_4423
      {
         return PoolManager.getInstance().CheckOutOne(a_4423) as a_4423;
      }
      
      override protected function getBindMovie() : Class
      {
         return InsurancePositionAlertMovie;
      }
   }
}


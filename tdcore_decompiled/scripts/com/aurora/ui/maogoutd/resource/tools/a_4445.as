package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4445 extends a_4410
   {
      
      public function a_4445()
      {
         super();
      }
      
      public static function a_3926() : a_4445
      {
         return PoolManager.getInstance().CheckOutOne(a_4445) as a_4445;
      }
      
      override protected function getBindMovie() : Class
      {
         return SelectedMapGridAlertMovie;
      }
   }
}


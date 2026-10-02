package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4443 extends a_4410
   {
      
      public function a_4443()
      {
         super();
      }
      
      public static function a_3926() : a_4443
      {
         return PoolManager.getInstance().CheckOutOne(a_4443) as a_4443;
      }
      
      override protected function getBindMovie() : Class
      {
         return RemoteAttackFigterAlertMovie;
      }
   }
}


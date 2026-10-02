package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4406 extends a_4410
   {
      
      public function a_4406()
      {
         super();
      }
      
      public static function a_3926() : a_4406
      {
         return PoolManager.getInstance().CheckOutOne(a_4406) as a_4406;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarPositionAlertMovie;
      }
   }
}


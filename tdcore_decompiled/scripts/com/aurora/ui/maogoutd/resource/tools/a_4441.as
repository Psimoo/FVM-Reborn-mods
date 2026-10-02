package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4441 extends a_4410
   {
      
      public function a_4441()
      {
         super();
      }
      
      public static function a_3926() : a_4441
      {
         return PoolManager.getInstance().CheckOutOne(a_4441) as a_4441;
      }
      
      override protected function getBindMovie() : Class
      {
         return RemoteAttackDefenseAlertMovie;
      }
   }
}


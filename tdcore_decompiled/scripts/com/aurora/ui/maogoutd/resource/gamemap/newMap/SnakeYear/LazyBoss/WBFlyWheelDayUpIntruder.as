package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBFlyWheelDayUpIntruder extends WBFlyWheelMouseMoveIntruder
   {
      
      public function WBFlyWheelDayUpIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBFlyWheelMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBFlyWheelDayUpIntruder) as WBFlyWheelDayUpIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlyWheelDayUpIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function ShotBullet() : void
      {
         CreateShot(WBFlyWheelDayShot.a_4344(),-10);
      }
   }
}


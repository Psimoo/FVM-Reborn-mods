package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBFlyWheelDayDownIntruder extends WBFlyWheelMouseMoveIntruder
   {
      
      public function WBFlyWheelDayDownIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBFlyWheelMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBFlyWheelDayDownIntruder) as WBFlyWheelDayDownIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlyWheelDayDownIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function ShotBullet() : void
      {
         CreateShot(WBFlyWheelDayShot.a_4344(),10);
      }
   }
}


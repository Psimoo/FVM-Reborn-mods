package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBFlyWheelNightDownIntruder extends WBFlyWheelMouseMoveIntruder
   {
      
      public function WBFlyWheelNightDownIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBFlyWheelMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBFlyWheelNightDownIntruder) as WBFlyWheelNightDownIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlyWheelNightDownIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function ShotBullet() : void
      {
         CreateShot(WBFlyWheelNightShot.a_4344(),10);
      }
   }
}


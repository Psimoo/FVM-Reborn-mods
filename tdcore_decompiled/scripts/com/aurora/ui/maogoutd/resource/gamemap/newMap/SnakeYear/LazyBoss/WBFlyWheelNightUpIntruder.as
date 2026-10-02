package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBFlyWheelNightUpIntruder extends WBFlyWheelMouseMoveIntruder
   {
      
      public function WBFlyWheelNightUpIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBFlyWheelMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBFlyWheelNightUpIntruder) as WBFlyWheelNightUpIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlyWheelNightUpIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function ShotBullet() : void
      {
         CreateShot(WBFlyWheelNightShot.a_4344(),-10);
      }
   }
}


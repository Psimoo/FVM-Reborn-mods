package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBGreedyBaby2MoveIntruder extends WBGreedyBabyMoveIntruder
   {
      
      protected static var a_1490:Array = new Array();
      
      public function WBGreedyBaby2MoveIntruder()
      {
         super();
         curColor = 1;
      }
      
      public static function a_3926() : WBGreedyBabyMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyBaby2MoveIntruder) as WBGreedyBaby2MoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyBaby2MoveIntruderMovie;
      }
   }
}


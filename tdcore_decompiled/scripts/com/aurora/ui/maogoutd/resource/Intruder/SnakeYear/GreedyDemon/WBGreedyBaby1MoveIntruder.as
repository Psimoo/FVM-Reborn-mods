package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBGreedyBaby1MoveIntruder extends WBGreedyBabyMoveIntruder
   {
      
      protected static var a_1490:Array = new Array();
      
      public function WBGreedyBaby1MoveIntruder()
      {
         super();
         curColor = 0;
      }
      
      public static function a_3926() : WBGreedyBabyMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyBaby1MoveIntruder) as WBGreedyBaby1MoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyBaby1MoveIntruderMovie;
      }
   }
}


package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBGreedyBaby3MoveIntruder extends WBGreedyBabyMoveIntruder
   {
      
      protected static var a_1490:Array = new Array();
      
      public function WBGreedyBaby3MoveIntruder()
      {
         super();
         curColor = 2;
      }
      
      public static function a_3926() : WBGreedyBabyMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyBaby3MoveIntruder) as WBGreedyBaby3MoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyBaby3MoveIntruderMovie;
      }
   }
}


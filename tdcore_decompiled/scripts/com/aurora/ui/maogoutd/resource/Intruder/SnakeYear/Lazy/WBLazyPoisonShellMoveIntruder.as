package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBLazyPoisonShellMoveIntruder extends WBLazyBaseShellMoveIntruder
   {
      
      protected static var a_1490:Array = new Array();
      
      public function WBLazyPoisonShellMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBLazyPoisonShellMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBLazyPoisonShellMoveIntruder) as WBLazyPoisonShellMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1279 = -35;
         m_iYDisplayCenterPos = -30;
         tagCom.AddTag(122);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazyPoisonShellMoveIntruderMovie;
      }
   }
}


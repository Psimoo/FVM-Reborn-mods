package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBLazyGoldShellMoveIntruder extends WBLazyBaseShellMoveIntruder
   {
      
      protected static var a_1490:Array = new Array();
      
      public function WBLazyGoldShellMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBLazyGoldShellMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBLazyGoldShellMoveIntruder) as WBLazyGoldShellMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1279 = -35;
         m_iYDisplayCenterPos = -37;
         tagCom.AddTag(123);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazyGoldShellMoveIntruderMovie;
      }
   }
}


package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBLazyIceShellMoveIntruder extends WBLazyBaseShellMoveIntruder
   {
      
      protected static var a_1490:Array = new Array();
      
      public function WBLazyIceShellMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBLazyIceShellMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBLazyIceShellMoveIntruder) as WBLazyIceShellMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1279 = -35;
         m_iYDisplayCenterPos = -46;
         AddTag(121);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazyIceShellMoveIntruderMovie;
      }
   }
}


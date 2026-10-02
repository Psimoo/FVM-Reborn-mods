package com.aurora.ui.maogoutd.resource.Intruder
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TestBaseMoveIntruder extends a_4206
   {
      
      private var m_stTimer:Timer;
      
      public function TestBaseMoveIntruder()
      {
         super();
         this.m_stTimer = new Timer(1000);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.OnTimerHandler);
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = 999999999;
         this.m_stTimer.start();
         return true;
      }
      
      private function OnTimerHandler(e:TimerEvent) : void
      {
         if(999999999 != a_1339)
         {
         }
      }
   }
}


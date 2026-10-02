package com.aurora.ui.maogoutd.resource.defender.test
{
   import com.aurora.ui.maogoutd.ClientLog.a_4812;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TestBaseDefense extends a_3962
   {
      
      private var m_stTimer:Timer;
      
      public function TestBaseDefense()
      {
         super();
         this.m_stTimer = new Timer(1000);
         this.m_stTimer.addEventListener(TimerEvent.TIMER,this.OnTimerHandler);
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
      }
      
      private function OnTimerHandler(e:TimerEvent) : void
      {
         var iLifeValue:int = a_1339;
         a_3969(1);
         if(iLifeValue == a_1339)
         {
            a_4812.Get().a_2116();
         }
         if(Math.abs(a_1339 - 999999999) > 100000)
         {
            a_4812.Get().a_2116();
         }
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 999999999;
         this.m_stTimer.start();
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTimer.stop();
         a_1339 = 0;
         super.a_3940();
         return true;
      }
   }
}


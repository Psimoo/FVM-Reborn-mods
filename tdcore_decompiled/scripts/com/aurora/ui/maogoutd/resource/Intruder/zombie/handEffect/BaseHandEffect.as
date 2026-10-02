package com.aurora.ui.maogoutd.resource.Intruder.zombie.handEffect
{
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BaseHandEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public function BaseHandEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public function SetPosition(iXDisplayCenterPos:int) : void
      {
         a_1279 = iXDisplayCenterPos;
         a_3419();
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         a_1275 = 0;
         gotoAndStop(1);
         this.play();
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
            return;
         }
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         a_1275 = 0;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return true;
      }
   }
}


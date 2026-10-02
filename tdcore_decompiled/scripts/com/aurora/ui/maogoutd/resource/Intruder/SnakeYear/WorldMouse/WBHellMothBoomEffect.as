package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class WBHellMothBoomEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public function WBHellMothBoomEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : WBHellMothBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBHellMothBoomEffect) as WBHellMothBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBHellMothBoomEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.SetAnimation2(0);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
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
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}


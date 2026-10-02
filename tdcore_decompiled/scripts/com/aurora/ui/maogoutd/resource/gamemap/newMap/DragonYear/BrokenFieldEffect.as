package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BrokenFieldEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var stCallBackFunc:Function = null;
      
      public var stEndCallBackFunc:Function = null;
      
      private var m_iSleepTime:int;
      
      public function BrokenFieldEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : BrokenFieldEffect
      {
         return PoolManager.getInstance().CheckOutOne(BrokenFieldEffect) as BrokenFieldEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BrokenFieldEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      public function get a_3958() : int
      {
         return this.m_iSleepTime;
      }
      
      public function set a_3958(iSleepTime:int) : void
      {
         this.m_iSleepTime = iSleepTime;
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
      
      public function FrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 9)
         {
            if(this.stCallBackFunc != null)
            {
               this.stCallBackFunc();
            }
         }
         else if(a_1273 == a_1274)
         {
            if(this.stEndCallBackFunc != null)
            {
               this.stEndCallBackFunc();
            }
            this.a_3940();
         }
      }
   }
}


package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class PreWarnEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public var stCallBackFunc:Function = null;
      
      private var m_iWaitTime:int;
      
      public function PreWarnEffect()
      {
         super();
         a_1279 = -0.5 * 304 + 25;
         m_iYDisplayCenterPos = -0.5 * 317 + 37;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : PreWarnEffect
      {
         return PoolManager.getInstance().CheckOutOne(PreWarnEffect,PreWarnEffectMovie) as PreWarnEffect;
      }
      
      public static function GetFreeInstance1() : PreWarnEffect
      {
         return PoolManager.getInstance().CheckOutOne(PreWarnEffect,PreWarnEffect1Movie) as PreWarnEffect;
      }
      
      public static function GetFreeInstance2() : PreWarnEffect
      {
         return PoolManager.getInstance().CheckOutOne(PreWarnEffect,PreWarnEffect2Movie) as PreWarnEffect;
      }
      
      public static function GetFreeInstance3() : PreWarnEffect
      {
         return PoolManager.getInstance().CheckOutOne(PreWarnEffect,PreWarnEffect3Movie) as PreWarnEffect;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      public function get WaitTime() : int
      {
         return this.m_iWaitTime;
      }
      
      public function set WaitTime(iWaitTime:int) : void
      {
         this.m_iWaitTime = iWaitTime;
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
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
         ++this.m_iStartTime;
         if(this.m_iStartTime > this.WaitTime * 10)
         {
            this.a_3940();
            if(this.stCallBackFunc != null)
            {
               this.stCallBackFunc();
            }
         }
      }
   }
}


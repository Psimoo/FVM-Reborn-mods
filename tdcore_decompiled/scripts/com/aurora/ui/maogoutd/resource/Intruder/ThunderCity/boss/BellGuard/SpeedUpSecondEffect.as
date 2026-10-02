package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.boss.BellGuard
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SpeedUpSecondEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      private var m_iSleepTime:int;
      
      public function SpeedUpSecondEffect()
      {
         super();
         a_1279 = -0.5 * 553 - 116;
         m_iYDisplayCenterPos = -0.5 * 518 + 28;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : SpeedUpSecondEffect
      {
         return PoolManager.getInstance().CheckOutOne(SpeedUpSecondEffect) as SpeedUpSecondEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpeedUpSecondEffectMovie;
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
      
      public function get a_3958() : int
      {
         return this.m_iSleepTime;
      }
      
      public function set a_3958(iSleepTime:int) : void
      {
         this.m_iSleepTime = iSleepTime;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
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
            this.a_3940();
         }
      }
   }
}


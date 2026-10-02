package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class IntruderPoisonGasEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      private var appearedTimes:int = 0;
      
      public var stTargetIntruder:a_4206;
      
      private var m_iHurtCD:int;
      
      private var a_1579:int;
      
      private var m_iHurtTimes:int;
      
      private var m_iWaitTime:int;
      
      public function IntruderPoisonGasEffect()
      {
         super();
         a_1279 = -22;
         m_iYDisplayCenterPos = -18;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : IntruderPoisonGasEffect
      {
         return PoolManager.getInstance().CheckOutOne(IntruderPoisonGasEffect) as IntruderPoisonGasEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return IntruderPoisonGasEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean, iHurtCD:* = 1, iHurtPower:int = 10) : Boolean
      {
         a_1283 = isReseaved;
         this.m_iHurtCD = iHurtCD;
         this.a_1579 = iHurtPower;
         this.m_iHurtTimes = 0;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         this.appearedTimes = 0;
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
         if(this.stTargetIntruder != null)
         {
            this.stTargetIntruder.PoisonHurtPower = 0;
            this.stTargetIntruder.m_stPoisonGasEffect = null;
            this.stTargetIntruder = null;
         }
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
         if(this.m_iStartTime % (this.m_iHurtCD * 10) == 0)
         {
            ++this.m_iHurtTimes;
            if(this.m_iHurtTimes <= 3 && this.stTargetIntruder != null && this.stTargetIntruder.iLifeValue > 0 && this.stTargetIntruder.parent != null)
            {
               this.stTargetIntruder.a_3969(this.a_1579);
            }
         }
         ++this.m_iStartTime;
         if(this.m_iStartTime > this.m_iWaitTime * 10)
         {
            this.a_3940();
         }
      }
   }
}


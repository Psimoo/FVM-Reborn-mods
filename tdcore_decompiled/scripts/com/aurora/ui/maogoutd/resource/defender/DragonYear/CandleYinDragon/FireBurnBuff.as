package com.aurora.ui.maogoutd.resource.defender.DragonYear.CandleYinDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FireBurnBuff extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      private var appearedTimes:int = 0;
      
      public var stTargetMouveIntruder:a_4206;
      
      private var m_iHurtCD:int;
      
      private var a_1579:Number;
      
      public var m_BuffAddTimes:int;
      
      private var m_TatalPower:Number;
      
      public var m_BuffDurations:Array = [];
      
      public var m_BuffPowers:Array = [];
      
      private var m_iWaitTime:int;
      
      public function FireBurnBuff()
      {
         super();
         a_1279 = -24;
         m_iYDisplayCenterPos = -16;
         this.m_stTiemr = new Timer(50);
      }
      
      public static function a_3926() : FireBurnBuff
      {
         return PoolManager.getInstance().CheckOutOne(FireBurnBuff) as FireBurnBuff;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireBurnBuffMovie;
      }
      
      public function a_1797(isReseaved:Boolean, iHurtCD:int = 1, iHurtPower:Number = 1) : Boolean
      {
         a_1283 = isReseaved;
         this.m_iHurtCD = iHurtCD;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         this.appearedTimes = 0;
         this.m_BuffAddTimes = 1;
         this.m_TatalPower = this.m_BuffAddTimes * this.a_1579;
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
         if(this.stTargetMouveIntruder != null)
         {
            this.stTargetMouveIntruder.m_stFireBurnBuff = null;
            this.stTargetMouveIntruder = null;
         }
         PoolManager.getInstance().CheckInOne(this);
         this.m_BuffDurations = [];
         this.m_BuffPowers = [];
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
      
      private function a_4003(a_4730:TimerEvent) : void
      {
         var totalPower:Number = NaN;
         var power:Number = NaN;
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
         for(var i:* = int(this.m_BuffDurations.length - 1); i >= 0; i--)
         {
            --this.m_BuffDurations[i];
            if(this.m_BuffDurations[i] <= 0)
            {
               this.m_BuffDurations.splice(i,1);
               this.m_BuffPowers.splice(i,1);
            }
         }
         if(this.m_BuffDurations.length == 0)
         {
            this.a_3940();
            return;
         }
         if((this.m_iStartTime - 5) % (this.m_iHurtCD * 10) == 0)
         {
            if(this.stTargetMouveIntruder != null && this.stTargetMouveIntruder.iLifeValue > 0)
            {
               totalPower = 0;
               for each(power in this.m_BuffPowers)
               {
                  totalPower += power;
               }
               if(this.stTargetMouveIntruder.iLifeValue - totalPower > 0)
               {
                  this.stTargetMouveIntruder.a_3969(totalPower);
               }
               else
               {
                  this.stTargetMouveIntruder.PowerfulBombReduceLifeRate(totalPower / 900);
               }
            }
         }
         ++this.m_iStartTime;
      }
   }
}


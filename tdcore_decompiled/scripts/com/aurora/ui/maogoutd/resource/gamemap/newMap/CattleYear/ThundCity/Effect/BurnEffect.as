package com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BurnEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      private var appearedTimes:int = 0;
      
      public var stTargetFieldGrid:a_3491;
      
      private var m_iHurtCD:int;
      
      private var a_1579:int;
      
      private var m_iWaitTime:int;
      
      public function BurnEffect()
      {
         super();
         a_1279 = -0.5 * 38 + 1;
         m_iYDisplayCenterPos = -0.5 * 34 + 7;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : BurnEffect
      {
         return PoolManager.getInstance().CheckOutOne(BurnEffect) as BurnEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BurnEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean, iHurtCD:* = 2, iHurtPower:int = 1) : Boolean
      {
         a_1283 = isReseaved;
         this.m_iHurtCD = iHurtCD;
         this.a_1579 = iHurtPower;
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
         if(this.stTargetFieldGrid != null)
         {
            this.stTargetFieldGrid.m_stBurnEffect = null;
            this.stTargetFieldGrid = null;
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
         ++this.m_iStartTime;
         if(this.m_iStartTime % (this.m_iHurtCD * 10) == 0)
         {
            this.BurnFieldGridDefense(this.stTargetFieldGrid);
         }
         if(this.m_iStartTime > this.m_iWaitTime * 10)
         {
            this.a_3940();
         }
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(!stFieldGrid.m_isCanBrokeByLight)
         {
            return false;
         }
         return stFieldGrid.BurnFieldGridDefenseNormal(this.a_1579 * 10);
      }
   }
}


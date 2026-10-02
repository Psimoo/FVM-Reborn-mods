package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class WBGreedyCoinEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_iFogTick:int = 10;
      
      public var m_lastTick:int = -1;
      
      public var m_startTime:int = -1;
      
      public function WBGreedyCoinEffect()
      {
         super();
         a_1279 = -15;
         m_iYDisplayCenterPos = -740;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : WBGreedyCoinEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyCoinEffect) as WBGreedyCoinEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyCoinEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.SetAnimationOnce2Loop2(0,1);
         this.m_iFogTick = 30;
         this.m_lastTick = -1;
         this.m_startTime = getTimer();
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
         var TICK_INTERVAL:int = 100;
         var now:int = getTimer();
         if(this.m_lastTick == -1)
         {
            this.m_lastTick = now;
            return;
         }
         var delta:int = now - this.m_lastTick;
         if(delta < TICK_INTERVAL)
         {
            return;
         }
         var tickCount:* = int(delta / TICK_INTERVAL);
         tickCount = int(Math.min(tickCount,5));
         this.m_lastTick += tickCount * TICK_INTERVAL;
         while(tickCount-- > 0)
         {
            this.OnLogicTick();
         }
      }
      
      private function OnLogicTick() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
            return;
         }
         --this.m_iFogTick;
         if(this.m_iFogTick == 0 && (a_1273 >= 28 && a_1273 <= 37))
         {
            this.m_iFogTick = 10;
            m_iXGridNo = this.m_TargetFieldGrid.m_iXGridNo;
            m_iYGridNo = this.m_TargetFieldGrid.m_iYGridNo;
            this.DamageCard(m_iXGridNo - 1,m_iYGridNo);
            this.DamageCard(m_iXGridNo - 1,m_iYGridNo - 1);
            this.DamageCard(m_iXGridNo - 1,m_iYGridNo + 1);
            this.DamageCard(m_iXGridNo,m_iYGridNo);
            this.DamageCard(m_iXGridNo,m_iYGridNo - 1);
            this.DamageCard(m_iXGridNo,m_iYGridNo + 1);
            this.DamageCard(m_iXGridNo + 1,m_iYGridNo);
            this.DamageCard(m_iXGridNo + 1,m_iYGridNo - 1);
            this.DamageCard(m_iXGridNo + 1,m_iYGridNo + 1);
         }
      }
      
      private function DamageCard(iNoX:int, iNoY:int) : void
      {
         this.DamageFieldGridDefense(this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      protected function DamageFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(10);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(10);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(10);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(10);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(10);
         }
         stFieldGrid.DamageNewSlot(true,0,false,10,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(10);
         }
         return true;
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
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}


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
   
   public class WBGreedyBallMoveIntruder extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_lastTick:int = -1;
      
      public var m_startTime:int = -1;
      
      public function WBGreedyBallMoveIntruder()
      {
         super();
         a_1279 = -220 + 85 + 78;
         m_iYDisplayCenterPos = -210 + 85 + 16;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : WBGreedyBallMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyBallMoveIntruder) as WBGreedyBallMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyBallMoveIntruderMovie;
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
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 18)
         {
            this.a_3940();
            return;
         }
         if(!a_1283)
         {
            if(a_1273 == 1)
            {
               this.ClearCard(7,3);
            }
            else if(a_1273 == 2)
            {
               this.ClearCard(7,3);
            }
            else if(a_1273 == 3)
            {
               this.ClearCard(6,2);
            }
            else if(a_1273 == 4)
            {
               this.ClearCard(5,1);
            }
            else if(a_1273 == 5)
            {
               this.ClearCard(4,0);
            }
            else if(a_1273 == 6)
            {
               this.ClearCard(4,0);
            }
            else if(a_1273 == 7)
            {
               this.ClearCard(4,1);
            }
            else if(a_1273 == 8)
            {
               this.ClearCard(4,2);
            }
            else if(a_1273 == 9)
            {
               this.ClearCard(4,3);
            }
            else if(a_1273 == 10)
            {
               this.ClearCard(4,4);
            }
            else if(a_1273 == 11)
            {
               this.ClearCard(4,5);
            }
            else if(a_1273 == 12)
            {
               this.ClearCard(4,6);
            }
            else if(a_1273 == 13)
            {
               this.ClearCard(4,6);
            }
            else if(a_1273 == 14)
            {
               this.ClearCard(5,5);
            }
            else if(a_1273 == 15)
            {
               this.ClearCard(6,4);
            }
            else if(a_1273 == 16)
            {
               this.ClearCard(7,3);
            }
            else if(a_1273 == 17)
            {
               this.ClearCard(7,3);
            }
         }
         else if(a_1273 == 1)
         {
            this.ClearCard(1,3);
         }
         else if(a_1273 == 2)
         {
            this.ClearCard(1,3);
         }
         else if(a_1273 == 3)
         {
            this.ClearCard(2,2);
         }
         else if(a_1273 == 4)
         {
            this.ClearCard(3,1);
         }
         else if(a_1273 == 5)
         {
            this.ClearCard(4,0);
         }
         else if(a_1273 == 6)
         {
            this.ClearCard(4,0);
         }
         else if(a_1273 == 7)
         {
            this.ClearCard(4,1);
         }
         else if(a_1273 == 8)
         {
            this.ClearCard(4,2);
         }
         else if(a_1273 == 9)
         {
            this.ClearCard(4,3);
         }
         else if(a_1273 == 10)
         {
            this.ClearCard(4,4);
         }
         else if(a_1273 == 11)
         {
            this.ClearCard(4,5);
         }
         else if(a_1273 == 12)
         {
            this.ClearCard(4,6);
         }
         else if(a_1273 == 13)
         {
            this.ClearCard(4,6);
         }
         else if(a_1273 == 14)
         {
            this.ClearCard(3,5);
         }
         else if(a_1273 == 15)
         {
            this.ClearCard(2,4);
         }
         else if(a_1273 == 16)
         {
            this.ClearCard(1,3);
         }
         else if(a_1273 == 17)
         {
            this.ClearCard(1,3);
         }
      }
      
      private function ClearCard(iNoX:int, iNoY:int) : void
      {
         this.a_3502(this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
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
   }
}


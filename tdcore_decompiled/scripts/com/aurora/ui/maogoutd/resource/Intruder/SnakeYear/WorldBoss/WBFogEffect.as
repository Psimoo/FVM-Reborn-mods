package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class WBFogEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_iState:int = 0;
      
      public var m_iFogTick:int = 0;
      
      public var m_fastMap:Object;
      
      public function WBFogEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : WBFogEffect
      {
         return PoolManager.getInstance().CheckOutOne(WBFogEffect) as WBFogEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFogEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         this.m_iState = 1;
         this.m_iFogTick = 0;
         this.SetAnimationOnce2Loop2(0,1);
         this.play();
         this.m_fastMap = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap();
         return true;
      }
      
      public function a_3940() : Boolean
      {
         this.m_iState = 2;
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
         var state:int = 0;
         if(this.m_iState == 0 || this.m_iState == 1)
         {
            state = this.isExistFlower() ? 0 : 1;
            if(state != this.m_iState)
            {
               this.m_iFogTick = 0;
            }
            this.m_iState = state;
            if(this.m_iState == 1)
            {
               ++this.m_iFogTick;
               if(this.m_iFogTick == 11)
               {
                  this.m_iFogTick = 0;
                  this.DamageFieldGridDefense(this.m_TargetFieldGrid);
               }
            }
            if(this.m_fastMap != null && Boolean(this.m_fastMap.HasFan()))
            {
               if(this.m_iState != 1)
               {
                  this.a_3940();
                  return;
               }
               this.SetAnimation2(2);
               this.m_iState = 2;
            }
         }
         if(this.m_iState == 0)
         {
            visible = false;
         }
         else
         {
            visible = true;
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
         stFieldGrid.DamageNewSlot(true,0,false,10,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(10);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(10);
         }
         return true;
      }
      
      public function isExistFlower() : Boolean
      {
         if(this.m_fastMap == null)
         {
            return false;
         }
         if(this.m_TargetFieldGrid)
         {
            return this.m_fastMap.IsLight(this.m_TargetFieldGrid.m_iXGridNo,this.m_TargetFieldGrid.m_iYGridNo);
         }
         return false;
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


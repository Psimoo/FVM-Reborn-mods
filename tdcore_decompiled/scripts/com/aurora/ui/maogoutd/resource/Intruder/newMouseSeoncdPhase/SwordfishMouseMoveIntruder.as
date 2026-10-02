package com.aurora.ui.maogoutd.resource.Intruder.newMouseSeoncdPhase
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class SwordfishMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      private var m_iMoveTime:int;
      
      private var m_isWaitting:Boolean;
      
      private var m_isSprint:Boolean;
      
      private var m_isWaiteTime:int;
      
      private var m_sprintTime:int;
      
      private var m_vertigoTime:int;
      
      private var m_isVertigo:Boolean;
      
      private var needtimes:int;
      
      public function SwordfishMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SwordfishMouseMoveIntruder) as SwordfishMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SwordfishMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         this.m_iMoveTime = int(Math.abs(1 * a_3491.a_1080 / a_1350));
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         this.needtimes = 0;
         this.m_isWaiteTime = 3 * 20;
         this.m_isSprint = false;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.needtimes = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(this.m_isWaitting)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.m_isSprint)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(this.m_isWaitting)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_isSprint)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(this.m_iMoveTime > 0)
         {
            --this.m_iMoveTime;
            if(0 == this.m_iMoveTime)
            {
               this.m_isWaitting = true;
               this.ResetMovieStatus();
            }
         }
         if(this.m_isSprint)
         {
            --this.m_sprintTime;
            if(this.m_sprintTime == 0)
            {
               ++this.needtimes;
               if(this.needtimes >= 2)
               {
                  this.m_isSprint = false;
                  a_1350 = a_1283 ? a_3491.a_1080 / (1 * 20) : -a_3491.a_1080 / (3 * 20);
                  if(a_1339 > MAX_INJURED_LIFE)
                  {
                     a_1275 = 0;
                     gotoAndStop((a_1276[0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[1] as FrameLabel).frame);
                  }
               }
               else
               {
                  this.m_isSprint = false;
                  this.m_isWaiteTime = 3 * 20;
                  this.m_isWaitting = true;
                  this.ResetMovieStatus();
               }
            }
            this.killDefenseCard(iCurrentTime);
         }
         if(this.m_isWaitting)
         {
            --this.m_isWaiteTime;
            if(this.m_isWaiteTime == 0)
            {
               this.m_isWaitting = false;
               this.m_isSprint = true;
               a_1350 = a_1283 ? a_3491.a_1080 / (1 * 20) : -a_3491.a_1080 / (1 * 20);
               this.m_sprintTime = int(Math.abs((2 + 1.5) * a_3491.a_1080 / a_1350));
               this.ResetMovieStatus();
            }
         }
         else if(this.m_isVertigo)
         {
            --this.m_vertigoTime;
            if(a_1339 > MAX_INJURED_LIFE)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1339 > 0)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            if(this.m_vertigoTime == 0)
            {
               this.m_isVertigo = false;
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      private function killDefenseCard(iCurrentTime:int) : void
      {
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stProtector)
         {
            m_stCurrentFieldGrid.m_stProtector.m_iDieType = 1;
            m_stCurrentFieldGrid.m_stProtector.a_3969(900);
         }
         if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stAttackFighter)
         {
            if(m_stCurrentFieldGrid.m_stAttackFighter.a_3512() == 286523412)
            {
               a_1477 = iCurrentTime;
               this.m_vertigoTime = 3 * 20;
               this.m_isVertigo = true;
               this.m_isSprint = false;
            }
            else
            {
               m_stCurrentFieldGrid.m_stAttackFighter.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stAttackFighter.a_3969(900);
            }
         }
         if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stBoomDefense)
         {
            if(!m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten || m_stCurrentFieldGrid.m_stBoomDefense.isSleeping)
            {
               m_stCurrentFieldGrid.m_stBoomDefense.m_iDieType = 1;
               m_stCurrentFieldGrid.m_stBoomDefense.a_3969(900);
            }
         }
         if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stFlowerDefense)
         {
            m_stCurrentFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            m_stCurrentFieldGrid.m_stFlowerDefense.a_3969(900);
         }
         if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter)
         {
            m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.a_3969(900);
         }
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.DamageNewSlot(true,0,false,900,1);
         }
         if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stTrayDefense)
         {
            m_stCurrentFieldGrid.m_stTrayDefense.m_iDieType = 1;
            m_stCurrentFieldGrid.m_stTrayDefense.a_3969(900);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}


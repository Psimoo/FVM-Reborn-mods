package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class ZombieCanoesMouseFirstTransMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private const FULL_HP:int = 1800;
      
      private const HURT_HP:int = 600;
      
      private const DEAD_HP:int = 0;
      
      private var a_1484:Boolean;
      
      private var a_1485:Boolean;
      
      private var a_1486:Boolean;
      
      private var a_1487:int;
      
      private var a_1488:int;
      
      public function ZombieCanoesMouseFirstTransMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieCanoesMouseFirstTransMoveIntruder) as ZombieCanoesMouseFirstTransMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieCanoesMouseFirstTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.a_1488 = iIntruderMoveDirection;
         a_1339 = this.FULL_HP;
         a_1279 = width * 0.15;
         a_1272 = 0;
         this.a_1484 = true;
         this.a_1485 = true;
         this.a_1486 = false;
         this.a_1487 = Math.abs(Math.round(a_3491.a_1080 * 2 / a_1350));
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var isNeededToReset:Boolean = false;
         if(a_1339 <= this.DEAD_HP)
         {
            if(a_1275 != 3)
            {
               a_1275 = 3;
               if(m_stCurrentFieldGrid != null)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               isNeededToReset = true;
            }
         }
         else if(this.a_1485)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               isNeededToReset = true;
            }
         }
         else if(a_1339 > this.HURT_HP)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               isNeededToReset = true;
            }
         }
         else if(a_1275 != 2)
         {
            a_1275 = 2;
            isNeededToReset = true;
         }
         if(isNeededToReset)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            a_3419();
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1466 > 0)
         {
            a_1466 -= iRduceLifeValue;
         }
         else
         {
            a_1339 -= iRduceLifeValue;
         }
         if(a_1466 < 0)
         {
            a_1339 += a_1466;
            a_1466 = 0;
         }
         if(a_1339 <= 0)
         {
            a_1469 = 0;
            a_1468 = 0;
            if(Boolean(m_stFreezeUpEffect) && m_stFreezeUpEffect.visible)
            {
               m_stFreezeUpEffect.a_3940();
               m_stFreezeUpEffect = null;
            }
         }
         if(Math.abs(iRduceLifeValue) > 1)
         {
            this.ResetMovieStatus();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_4210();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         var isDead:Boolean = false;
         if(this.a_1488 < 0)
         {
            if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo < 2)
            {
               isDead = true;
            }
         }
         else if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo > BattleFieldView.a_1011 - 1)
         {
            isDead = true;
         }
         if(isDead)
         {
            a_1339 = 0;
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         else
         {
            this.a_4210();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         if(!this.a_1486)
         {
            this.a_1486 = true;
            this.initIntruderMovePosition(this.a_1488);
            return true;
         }
         if(a_1275 == 0)
         {
            if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
            {
               this.a_1485 = false;
               this.ResetMovieStatus();
            }
            play();
         }
         else
         {
            --this.a_1487;
            if(this.a_1487 <= 0)
            {
               this.a_1484 = !this.a_1484;
               if(this.a_1484)
               {
                  a_1350 = a_3491.a_1080 / (3 * 20);
                  this.a_1487 = Math.abs(Math.round(a_3491.a_1080 * 2 / a_1350));
                  if(this.a_1488 < 0)
                  {
                     a_1350 *= -1;
                  }
               }
               else
               {
                  a_1350 = a_3491.a_1080 / (4 * 20);
                  this.a_1487 = Math.abs(Math.round(a_3491.a_1080 / a_1350));
                  if(this.a_1488 >= 0)
                  {
                     a_1350 *= -1;
                  }
               }
            }
            super.a_4216(iCurrentTime);
            a_1464 = false;
            if(m_stCurrentFieldGrid != null)
            {
               if(null != m_stCurrentFieldGrid.m_stAttackFighter)
               {
                  if(m_stCurrentFieldGrid.m_stAttackFighter is a_3924)
                  {
                     if(m_stCurrentFieldGrid.m_stAttackFighter.iLifeValue == 1)
                     {
                        a_1464 = true;
                     }
                  }
               }
            }
            if(this.a_1484)
            {
               this.a_4200(m_stCurrentFieldGrid,iCurrentTime);
            }
         }
         return true;
      }
      
      private function a_4200(stFieldGrid:a_3491, iCurrentTime:int) : void
      {
         var tempLife:int = 0;
         if(null == stFieldGrid)
         {
            return;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               tempLife = stFieldGrid.m_stAttackFighter.iLifeValue;
               if(tempLife > 1)
               {
                  tempLife--;
               }
               else
               {
                  tempLife = 0;
               }
               stFieldGrid.m_stAttackFighter.a_3969(tempLife);
               x += a_1350;
            }
            else
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            if(!stFieldGrid.m_stBoomDefense.isCanBeEaten || stFieldGrid.m_stBoomDefense.isSleeping)
            {
               stFieldGrid.m_stBoomDefense.m_iDieType = 1;
               stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            }
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
         if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(true,0,true,0,1);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
      }
      
      private function initIntruderMovePosition(iIntruderMoveDirection:int) : void
      {
         var targetXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var startXGridNo:int = 0;
         if(iIntruderMoveDirection < 0)
         {
            targetXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 1;
            x = a_3491.a_1080 * (targetXGridNo + 1);
            startXGridNo = targetXGridNo;
         }
         else
         {
            targetXGridNo = m_stCurrentFieldGrid.m_iXGridNo + 1;
            x = a_3491.a_1080 * targetXGridNo;
         }
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(targetXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         stFieldGrid.a_3459(this);
         var i:int = startXGridNo;
         var n:int = startXGridNo + 1;
         while(i < n)
         {
            this.a_4200(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,m_stCurrentFieldGrid.m_iYGridNo),0);
            i++;
         }
      }
   }
}


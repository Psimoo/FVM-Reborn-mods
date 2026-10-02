package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class ZombieWaterSubmarineMouseSecondTransMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private const FULL_HP:int = 6800;
      
      private const HURT_HP:int = 900;
      
      private const DEAD_HP:int = 0;
      
      private const ARMOR_FULL_HP:int = 2000;
      
      private const ARMOR_HURT_HP:int = 600;
      
      private const ARMOR_DEAD_HP:int = 0;
      
      private var m_isInWater:Boolean;
      
      private var a_1552:Boolean;
      
      private var a_1554:Boolean;
      
      private var m_isInited:Boolean;
      
      private var a_1071:int;
      
      private var a_1555:Boolean;
      
      private var a_1556:int = 0;
      
      public function ZombieWaterSubmarineMouseSecondTransMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieWaterSubmarineMouseSecondTransMoveIntruder) as ZombieWaterSubmarineMouseSecondTransMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieWaterSubmarineMouseSecondTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1466 = this.ARMOR_FULL_HP;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1377 = 20;
         this.m_isInWater = false;
         this.a_1552 = false;
         this.a_1554 = false;
         this.m_isInited = false;
         this.a_1555 = false;
         this.a_1071 = iIntruderMoveDirection;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var isNeededToReset:Boolean = false;
         if(a_1339 <= this.DEAD_HP)
         {
            if(m_stCurrentFieldGrid)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  if(m_stCurrentFieldGrid)
                  {
                     m_stCurrentFieldGrid.a_3457(this);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  }
                  isNeededToReset = true;
               }
            }
         }
         else if(this.a_1552)
         {
            if(a_1339 > this.HURT_HP && a_1466 > this.ARMOR_DEAD_HP)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  isNeededToReset = true;
               }
            }
            else if(a_1275 != 3)
            {
               a_1275 = 3;
               isNeededToReset = true;
            }
         }
         else if(this.a_1554)
         {
            if(a_1275 != 5)
            {
               a_1275 = 5;
               isNeededToReset = true;
            }
         }
         else if(a_1475)
         {
            if(this.m_isInWater)
            {
               if(a_1339 > this.HURT_HP && a_1466 > this.ARMOR_DEAD_HP)
               {
                  if(a_1275 != 6)
                  {
                     a_1275 = 6;
                     isNeededToReset = true;
                  }
               }
               else if(a_1339 > this.HURT_HP)
               {
                  if(a_1275 != 8)
                  {
                     a_1275 = 8;
                     isNeededToReset = true;
                  }
               }
               else if(a_1275 != 10)
               {
                  a_1275 = 10;
                  isNeededToReset = true;
               }
            }
         }
         else if(this.m_isInWater)
         {
            if(a_1339 > this.HURT_HP && a_1466 > this.ARMOR_DEAD_HP)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  isNeededToReset = true;
               }
            }
            else if(a_1339 > this.HURT_HP)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  isNeededToReset = true;
               }
            }
            else if(a_1275 != 9)
            {
               a_1275 = 9;
               isNeededToReset = true;
            }
         }
         else if(a_1339 > this.HURT_HP)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
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
         this.a_4213();
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
      
      override public function a_4212() : Boolean
      {
         var isDead:Boolean = false;
         if(this.a_1071 < 0)
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
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         var stPreFieldGrid:a_3491 = null;
         var stPreFieldBaseDefense:a_3962 = null;
         var iPreEatLifeValue:int = 0;
         var tempLife:int = 0;
         BattleFieldView.ms_kenShi29.play();
         if(stBaseDefense.stFieldGrid)
         {
            stPreFieldGrid = stBaseDefense.stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stBaseDefense.stFieldGrid.m_iXGridNo - 1,stBaseDefense.stFieldGrid.m_iYGridNo);
            if(stPreFieldGrid)
            {
               if(null != stPreFieldGrid.m_stAttackFighter)
               {
                  stPreFieldBaseDefense = stPreFieldGrid.m_stAttackFighter;
               }
               else if(null != stPreFieldGrid.m_stBoomDefense)
               {
                  stPreFieldBaseDefense = stPreFieldGrid.m_stBoomDefense;
               }
               else if(null != stPreFieldGrid.m_stFlowerDefense)
               {
                  stPreFieldBaseDefense = stPreFieldGrid.m_stFlowerDefense;
               }
               else if(null != stPreFieldGrid.m_stBaseAuxiliaryFighter)
               {
                  stPreFieldBaseDefense = stPreFieldGrid.m_stBaseAuxiliaryFighter;
               }
               else if(null != stPreFieldGrid.m_stProtector)
               {
                  stPreFieldBaseDefense = stPreFieldGrid.m_stProtector;
               }
               if(stPreFieldBaseDefense)
               {
                  stPreFieldBaseDefense.m_iDieType = 1;
                  iPreEatLifeValue = a_1377;
                  if(stPreFieldBaseDefense is a_3924)
                  {
                     if(iPreEatLifeValue > stPreFieldBaseDefense.iLifeValue - 1)
                     {
                        iPreEatLifeValue = stPreFieldBaseDefense.iLifeValue - 1;
                     }
                  }
                  stPreFieldBaseDefense.a_3969(iPreEatLifeValue);
                  stPreFieldBaseDefense.m_iDieType = 0;
               }
            }
         }
         stBaseDefense.m_iDieType = 1;
         var tempLiveValue:int = a_1377;
         if(stBaseDefense is a_3924)
         {
            tempLife = stBaseDefense.iLifeValue;
            if(tempLiveValue > tempLife)
            {
               tempLiveValue = tempLife - 1;
            }
         }
         stBaseDefense.a_3969(tempLiveValue);
         stBaseDefense.m_iDieType = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!this.m_isInited)
         {
            this.m_isInited = true;
            y -= 15;
         }
         var numOrigXPos:Number = x;
         if(a_1275 == 1 || a_1275 == 4)
         {
            a_1350 = a_3491.a_1080 / (3 * 20);
            if(this.a_1071 < 0)
            {
               a_1350 *= -1;
            }
         }
         else
         {
            a_1350 = a_3491.a_1080 / (6 * 20);
            if(this.a_1071 < 0)
            {
               a_1350 *= -1;
            }
         }
         super.a_4216(iCurrentTime);
         if(!a_1283 && x < 0 || a_1283 && x > BattleFieldView.a_1013)
         {
            if(this.m_isInWater)
            {
               this.a_1552 = this.m_isInWater = false;
               this.ResetMovieStatus();
            }
         }
         if(!this.m_isInWater && (x > 0 && x < BattleFieldView.a_1013 - 60 || a_1283 && x > 60 && x < BattleFieldView.a_1013))
         {
            this.a_1552 = this.m_isInWater = true;
            BattleFieldView.a_1020.play();
            this.ResetMovieStatus();
         }
         if(a_1475)
         {
            if(a_1275 == 4)
            {
               this.a_1554 = true;
               this.ResetMovieStatus();
            }
         }
         if(a_1275 == 1 || a_1275 == 3)
         {
            if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
            {
               this.a_1552 = false;
               this.ResetMovieStatus();
            }
         }
         if(a_1275 == 5)
         {
            if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
            {
               this.a_1554 = false;
               this.ResetMovieStatus();
            }
         }
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
         return true;
      }
   }
}


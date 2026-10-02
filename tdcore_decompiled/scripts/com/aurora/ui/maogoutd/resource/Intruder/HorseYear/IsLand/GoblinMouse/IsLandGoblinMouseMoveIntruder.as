package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.GoblinMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   
   public class IsLandGoblinMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      protected var a_1493:int = 0;
      
      protected var a_1494:int;
      
      private var m_InvincibleTick:int = 0;
      
      public function IsLandGoblinMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandGoblinMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandGoblinMouseMoveIntruder,IsLandGoblinMouseMoveIntruderMovie) as IsLandGoblinMouseMoveIntruder;
      }
      
      public static function DamageOneGrid(stFieldGrid:a_3491, damage:int) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBattleBarrierHorseDefense)
         {
            stFieldGrid.m_stBattleBarrierHorseDefense.m_iDieType = 1;
            stFieldGrid.m_stBattleBarrierHorseDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(damage);
         }
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         a_1281 = true;
         MAX_LIFE = 1500;
         INJURED_LIFE = 600;
         ONE_GRID_SPEED = 2;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.a_1493 = 0;
         this.a_1494 = 60;
         a_1462 = true;
         a_1463 = true;
         a_1465 = 1;
         this.m_InvincibleTick = 20;
         a_1275 = -1;
         SetAnimation(0,0);
         return true;
      }
      
      override public function ShowBoomDieEffect() : void
      {
         var stSmallMouseBoomdie:a_4143 = null;
         var bReversed:Boolean = false;
         if(!a_1461 && a_1339 <= 0 && null != parent && !IsBossIntruder)
         {
            stSmallMouseBoomdie = a_4143.a_3926();
            bReversed = a_1283;
            if(this.a_1493 == 1)
            {
               bReversed = true;
            }
            else if(this.a_1493 == 2)
            {
               bReversed = false;
            }
            stSmallMouseBoomdie.a_1797(bReversed);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
         }
      }
      
      override protected function get BoomIsReduceLife() : Boolean
      {
         if(a_1465 == 1)
         {
            return true;
         }
         return super.BoomIsReduceLife;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.a_1494 > 0 || this.a_1493 <= 0)
            {
               return true;
            }
            if(a_1475)
            {
               SetAnimation(8,9);
            }
            else
            {
               SetAnimation(6,7);
            }
         }
         else
         {
            if(this.a_1493 == 2 && a_1283 == false)
            {
               x -= 30;
               a_1283 = true;
            }
            SetDeadAnim(10);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_InvincibleTick > 0)
         {
            return true;
         }
         return super.a_4209(iRduceLifeValue);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_InvincibleTick > 0 || a_1465 == 1)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override protected function IsReveredGrid() : Boolean
      {
         return false;
      }
      
      private function HasDrillCard(grid:a_3491) : Boolean
      {
         if(grid == null || grid.m_stAttackFighter == null)
         {
            return false;
         }
         return grid.m_stAttackFighter.tagCom.HasTag(30038);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         --this.m_InvincibleTick;
         if(iCurrentTime >= a_1472 + a_1471 && (this.a_1493 == 0 || this.a_1493 != 0 && this.a_1494 <= 0 && m_stCurrentFieldGrid.m_stProtector == null && m_stCurrentFieldGrid.m_stAttackFighter == null && m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter == null && m_stCurrentFieldGrid.m_stBoomDefense == null && m_stCurrentFieldGrid.m_stOceanGoddessToolDefense == null && m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense == null && m_stCurrentFieldGrid.m_stFlowerDefense == null && m_stCurrentFieldGrid.m_stTrayDefense == null))
         {
            if(a_1273 >= 11 && a_1273 <= 34)
            {
               return true;
            }
            a_1472 = iCurrentTime;
            play();
            x += a_1350 * a_1470;
            iXGridNo = int((x + (this.a_1493 == 0 ? -50 : 0)) / a_3491.a_1080);
            if(iXGridNo < 0)
            {
               iXGridNo = 0;
            }
            if(iXGridNo >= BattleFieldView.a_1011 - 1)
            {
               iXGridNo = BattleFieldView.a_1011 - 1;
            }
            if(this.a_1493 == 0)
            {
               if(x < 0)
               {
                  this.a_1493 = 1;
                  SetAnimationOnce2Loop(2,5,2,5);
               }
               else if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo && this.HasDrillCard(m_stCurrentFieldGrid))
               {
                  this.a_1493 = 2;
                  SetAnimationOnce2Loop(3,4,3,4);
                  this.a_1494 = 30;
               }
               if(this.a_1493 != 0)
               {
                  x -= a_1350 * a_1470;
                  SetSpeed(0);
               }
            }
            if(this.a_1494 != 30 && iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo).a_3459(this);
            }
            else if(iXGridNo < 0 || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
               return true;
            }
         }
         if(this.a_1494 <= 0 && this.a_1493 > 0 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470))
         {
            if(null != m_stCurrentFieldGrid.m_stProtector)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stProtector);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stAttackFighter)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stAttackFighter);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stBoomDefense && m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stBoomDefense);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stFlowerDefense)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stFlowerDefense);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense);
               this.ResetMovieStatus();
            }
            else if(null != m_stCurrentFieldGrid.m_stOceanGoddessToolDefense)
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(m_stCurrentFieldGrid.m_stOceanGoddessToolDefense);
               this.ResetMovieStatus();
            }
            else if(a_1475)
            {
               a_1475 = false;
               this.ResetMovieStatus();
            }
         }
         if(this.a_1494 > 0 && this.a_1493 > 0)
         {
            --this.a_1494;
            if(this.a_1493 == 1)
            {
               if(40 == this.a_1494)
               {
                  a_1465 = 0;
                  SetCannotSeeByFighter(false);
               }
               else if(this.a_1494 <= 0)
               {
                  SetSpeed(-6);
                  SetAnimation(6,7);
               }
            }
            else if(this.a_1493 == 2)
            {
               if(10 == this.a_1494)
               {
                  a_1465 = 0;
                  SetCannotSeeByFighter(false);
                  a_1463 = false;
                  DamageOneGrid(m_stCurrentFieldGrid,100);
               }
               else if(this.a_1494 <= 0)
               {
                  a_1283 = true;
                  x -= 30;
                  SetSpeed(-6);
                  SetAnimation(6,7);
               }
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.enm_shotEffectXuanYun == iEffectType)
         {
            return;
         }
         if(0 == a_1465)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function get height() : Number
      {
         return 65;
      }
   }
}


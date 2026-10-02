package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.utils.Dictionary;
   
   public class WBEmptyBossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_DISAPPEAR:uint = 7;
      
      protected static const STATE_SKILL_ONE:uint = 8;
      
      protected static const STATE_SKILL_TWO:uint = 9;
      
      protected static const STATE_SKILL_THREE:uint = 10;
      
      protected static const STATE_SKILL_FOUR:uint = 11;
      
      protected static const STATE_SKILL_FOUR_APPEAR1:uint = 12;
      
      protected static const STATE_SKILL_FOUR_APPEAR2:uint = 13;
      
      protected static const STATE_SKILL_DEAD:uint = 14;
      
      private var m_bHasBorn:Boolean = false;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var moveArray:Array = [STATE_MOVE];
      
      private var invicibleArray:Array = [STATE_BORN,STATE_HIDE,STATE_NONE];
      
      public function WBEmptyBossMoveIntruder()
      {
         super();
         _bossStep = 1;
         a_1279 = 28;
         a_1467 = -90;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBEmptyBossMoveIntruder,WBDesireKingP1BossMovie) as WBEmptyBossMoveIntruder;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR1 + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR2 + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR1 + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR2 + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 1] = 20;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
      }
      
      override protected function InitSkillCache() : void
      {
         a_1465 = 0;
         this.m_bHasBorn = false;
         this.SkillBorn();
      }
      
      private function SkillBorn() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 6;
         iLastNoY = 4;
         m_vStateCache.push([STATE_BORN,45,6,5]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         this.m_bHasBorn = true;
         m_vStateCache.push([STATE_SKILL_ONE,15]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillDead() : void
      {
         a_1283 = false;
         m_vStateCache.push([STATE_SKILL_DEAD,34]);
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 172 || a_1273 == 399)
               {
               }
         }
         return true;
      }
      
      private function HandleDie() : void
      {
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         this.SkillDead();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         _iTimeNum = iCurrentTime;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            this.InitState();
            a_1460 = true;
            _MAXLifeValue = iLifeValue;
            _Reduce2ShieldLifeValue = _MAXLifeValue * 0.25;
            _ReduceOneStepLifeValue = _MAXLifeValue * 0.1;
         }
         if(this.m_bHasHandleDie == false && a_1339 <= 0)
         {
            this.HandleDie();
            return false;
         }
         if(m_iRestTick > 0)
         {
            nextFrame();
            if(this.IsMoving())
            {
               this.MoveMySelf();
            }
            this.CheckIsCanLaunchSkill(iCurrentTime);
            if(this.IsMoving())
            {
               a_3502(m_stCurrentFieldGrid);
            }
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop(536);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      override protected function MoveMySelf() : void
      {
         if(m_bIsNeedHighPrecision)
         {
            this.x = Math.round(10000 * this.x + 10000 * m_fMoveSpeedX) * 0.0001;
            this.y = Math.round(10000 * this.y + 10000 * m_fMoveSpeedY) * 0.0001;
         }
         else
         {
            this.x += m_fMoveSpeedX;
            this.y += m_fMoveSpeedY;
         }
         var m_iLastX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var m_iLastY:int = m_stCurrentFieldGrid.m_iYGridNo;
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         if(m_iLastX == iXGridNo && m_iLastY == iYGridNo)
         {
            return;
         }
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
         SetIsCannotSee(!bIsCanChangeToFieldGrid,false);
      }
      
      override protected function IsMoving() : Boolean
      {
         return this.moveArray.indexOf(m_iBossState) != -1;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(x > getPosXByXGridNo(9))
         {
            return false;
         }
         if(y < getPosYByYGridNo(0))
         {
            return false;
         }
         if(y > getPosYByYGridNo(7))
         {
            return false;
         }
         if(this.m_bHasBorn == false)
         {
            return false;
         }
         return this.invicibleArray.indexOf(m_iBossState) == -1 && a_1339 > 0;
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               CallChangeStep();
               a_3940();
               return false;
            }
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         var iNoX:int = 0;
         var iNoY:int = 0;
         var offsetX:int = 0;
         var offsetY:int = 0;
         SetIsCannotSee(STATE_HIDE == iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_ONE:
               SetIsCannotSee(false);
               break;
            case STATE_MOVE:
               iNextValue = this.SetMoveToPosition3(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_WAITING:
               SetIsCannotSee(false);
               break;
            case STATE_DEAD:
               SetIsCannotSee(true);
               break;
            case STATE_SKILL_FOUR:
               break;
            case STATE_HIDE:
               SetIsCannotSee(true);
               visible = false;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetMoveToPosition3(iNoX:int, iNoY:int) : int
      {
         var numSpeed:Number = 60 / (20 * 0.4);
         if(iNoX == m_stCurrentFieldGrid.m_iXGridNo)
         {
            numSpeed = 60 / (20 * 0.35);
         }
         return setMoveToPosition(getPosXByXGridNo(iNoX),getPosYByYGridNo(iNoY),numSpeed);
      }
      
      private function SetMoveToPosition2(iNoX:int, iNoY:int, numSpeed:Number) : int
      {
         return setMoveToPosition(getPosXByXGridNo(iNoX),getPosYByYGridNo(iNoY),numSpeed);
      }
      
      private function SetAppearToGrid2(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = null;
         var iNoX:int = iXGridNo;
         var iNoY:int = iYGridNo;
         if(iNoX < 0)
         {
            iNoX = 0;
         }
         if(iNoX > 8)
         {
            iNoX = 8;
         }
         if(iNoY < 0)
         {
            iNoY = 0;
         }
         if(iNoY > 6)
         {
            iNoY = 6;
         }
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         this.x = getPosXByXGridNo(iXGridNo);
         this.y = getPosYByYGridNo(iYGridNo);
         ChangeToFieldGrid(stNextFieldGrid);
         this.visible = true;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.m_bHasHandleDie = false;
      }
   }
}


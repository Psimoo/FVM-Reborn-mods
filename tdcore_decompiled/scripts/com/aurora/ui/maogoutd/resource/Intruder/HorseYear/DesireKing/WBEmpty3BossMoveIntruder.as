package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.utils.Dictionary;
   
   public class WBEmpty3BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_LIGHT_SPLASH_OUT:uint = 7;
      
      protected static const STATE_LIGHT_SPLASH_IN:uint = 8;
      
      protected static const STATE_SPEED_IN:uint = 9;
      
      protected static const STATE_SPLASH_OUT:uint = 10;
      
      protected static const STATE_SPLASH_IN:uint = 11;
      
      protected static const STATE_SPEED_TO_DIZZY:uint = 12;
      
      protected static const STATE_DIZZY:uint = 13;
      
      protected static const STATE_DIZZY_TO_WAITING:uint = 14;
      
      protected static const STATE_SKILL_ONE:uint = 15;
      
      protected static const STATE_SKILL_TWO:uint = 16;
      
      protected static const STATE_SKILL_THREE_BEGIN:uint = 17;
      
      protected static const STATE_SKILL_THREE_LOOP:uint = 18;
      
      protected static const STATE_SKILL_THREE_END:uint = 19;
      
      protected static const STATE_SKILL_FOUR:uint = 20;
      
      protected static const STATE_SKILL_FIVE_BEGIN:uint = 21;
      
      protected static const STATE_SKILL_FIVE_LOOP:uint = 22;
      
      protected static const STATE_SKILL_FIVE_END:uint = 23;
      
      protected static const STATE_MOVE_ONE:uint = 30;
      
      protected static const STATE_LIGHT_SPLASH_HIDE:uint = 33;
      
      protected static const STATE_SPEED_WAIT:uint = 34;
      
      private var m_bHasBorn:Boolean = false;
      
      private var m_iCreateShellIdx:int = 0;
      
      private var m_iSplashInPos1:Array = [0,0,0];
      
      private var m_iSplashInPos2:Array = [0,0,0];
      
      private var m_iSplashInPos3:Array = [0,0,0];
      
      private var moveArray:Array = [STATE_MOVE,STATE_SKILL_THREE_LOOP,STATE_SKILL_FIVE_LOOP,STATE_MOVE_ONE];
      
      private var invicibleArray:Array = [STATE_BORN,STATE_HIDE,STATE_NONE];
      
      public function WBEmpty3BossMoveIntruder()
      {
         super();
         _bossStep = 3;
         a_1279 = -52;
         a_1467 = -100;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBEmpty3BossMoveIntruder,WBDesireKingP3BossMovie) as WBEmpty3BossMoveIntruder;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SPEED_WAIT + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_HIDE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_ONE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_OUT + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_IN + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SPEED_IN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SPLASH_OUT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SPLASH_IN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SPEED_TO_DIZZY + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_DIZZY + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_DIZZY_TO_WAITING + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_SPEED_WAIT + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_HIDE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_MOVE_ONE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_OUT + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_IN + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_SPEED_IN + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_SPLASH_OUT + "_" + 1] = 7;
         m_dictBossStateFrameID[STATE_SPLASH_IN + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SPEED_TO_DIZZY + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_DIZZY + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_DIZZY_TO_WAITING + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 1] = 20;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillFour);
         m_vSkillFunction.push(this.SkillFive);
      }
      
      override protected function InitSkillCache() : void
      {
         a_1465 = 0;
         this.m_bHasBorn = false;
         tagCom.AddTag(353);
         this.SkillBorn();
      }
      
      private function SkillBorn() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 6;
         iLastNoY = 4;
         this.m_iCreateShellIdx = m_stRandomSeed.nextInt(2) + 1;
         m_vStateCache.push([STATE_BORN,26,3,4]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillOne() : void
      {
         this.m_bHasBorn = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SPLASH_IN,4,8,m_stRandomSeed.nextInt(4) * 2]);
         m_vStateCache.push([STATE_SKILL_ONE,47]);
         m_vStateCache.push([STATE_WAITING,20]);
      }
      
      private function SkillTwo() : void
      {
         this.m_bHasBorn = true;
         m_vStateCache.length = 0;
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         if(iNoY == 0)
         {
            this.m_iSplashInPos1 = [8,0,2];
            this.m_iSplashInPos2 = [6,2,2];
            this.m_iSplashInPos3 = [4,4,0];
         }
         else if(iNoY == 2)
         {
            if(m_stRandomSeed.nextInt(2) == 0)
            {
               this.m_iSplashInPos1 = [8,2,1];
               this.m_iSplashInPos2 = [6,0,2];
            }
            else
            {
               this.m_iSplashInPos1 = [8,2,2];
               this.m_iSplashInPos2 = [6,4,1];
            }
            this.m_iSplashInPos3 = [4,2,0];
         }
         else if(iNoY == 4)
         {
            if(m_stRandomSeed.nextInt(2) == 0)
            {
               this.m_iSplashInPos1 = [8,4,1];
               this.m_iSplashInPos2 = [6,2,2];
            }
            else
            {
               this.m_iSplashInPos1 = [8,4,2];
               this.m_iSplashInPos2 = [6,6,1];
            }
            this.m_iSplashInPos3 = [4,4,0];
         }
         else if(iNoY == 6)
         {
            this.m_iSplashInPos1 = [8,6,1];
            this.m_iSplashInPos2 = [6,4,1];
            this.m_iSplashInPos3 = [4,2,0];
         }
         m_vStateCache.push([STATE_LIGHT_SPLASH_OUT,13]);
         m_vStateCache.push([STATE_LIGHT_SPLASH_HIDE,17]);
         m_vStateCache.push([STATE_LIGHT_SPLASH_IN,12,this.m_iSplashInPos3[0],this.m_iSplashInPos3[1]]);
         m_vStateCache.push([STATE_SKILL_TWO,46]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,2,this.m_iSplashInPos3[1]]);
         this.SkillThree1();
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         ++this.m_iCreateShellIdx;
         visible = true;
         m_vStateCache.push([STATE_SKILL_THREE_BEGIN,10]);
         m_vStateCache.push([STATE_SKILL_THREE_LOOP,7,6,0.26]);
         m_vStateCache.push([STATE_SKILL_THREE_END,5]);
         m_vStateCache.push([STATE_WAITING,20]);
      }
      
      private function SkillThree1() : void
      {
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillThree3() : void
      {
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillThree2() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SPEED_TO_DIZZY,6]);
         m_vStateCache.push([STATE_DIZZY,20]);
         m_vStateCache.push([STATE_DIZZY_TO_WAITING,9]);
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillFour() : void
      {
         m_vStateCache.length = 0;
         var iNoY:int = 1 + m_stRandomSeed.nextInt(3) * 2;
         m_vStateCache.push([STATE_SKILL_FOUR,45]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,6,iNoY]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,4,iNoY]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,2,iNoY]);
         this.SkillThree3();
      }
      
      private function SkillFive() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_FIVE_END,10]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
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
            case STATE_SKILL_TWO:
               break;
            case STATE_SKILL_THREE_LOOP:
               if(a_1273 == 238)
               {
               }
               break;
            case STATE_SKILL_FIVE_BEGIN:
               if(a_1273 == 312)
               {
               }
               break;
            case STATE_SPLASH_IN:
               if(a_1273 == 94)
               {
                  a_3502(m_stCurrentFieldGrid);
               }
         }
         return true;
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
            InitState();
            a_1460 = true;
            _MAXLifeValue = iLifeValue;
            _Reduce2ShieldLifeValue = _MAXLifeValue * 0.25;
            _ReduceOneStepLifeValue = _MAXLifeValue * 0.1;
         }
         if(m_iBossState != STATE_DEAD && a_1339 <= 0)
         {
            LifeIsZeroHandle(STATE_DEAD);
            return false;
         }
         if(m_iBossState == STATE_DEAD)
         {
            nextFrame();
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
            if(this.IsMoving() && x < 540)
            {
               a_3502(m_stCurrentFieldGrid);
            }
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
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
         var m_bOutRange:Boolean = false;
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
            m_bOutRange = true;
         }
         if(iXGridNo > 8)
         {
            iXGridNo = 8;
            m_bOutRange = true;
         }
         if(iYGridNo < 0)
         {
            iYGridNo = 0;
            m_bOutRange = true;
         }
         if(iYGridNo > 6)
         {
            iYGridNo = 6;
            m_bOutRange = true;
         }
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
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         var iNoX:int = 0;
         var iNoY:int = 0;
         var offsetX:int = 0;
         var offsetY:int = 0;
         switch(iNextState)
         {
            case STATE_SPLASH_IN:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               if(m_vStateCache[0][4] == null)
               {
                  a_1283 = false;
               }
               else
               {
                  a_1283 = m_vStateCache[0][4];
               }
               break;
            case STATE_BORN:
               a_1283 = false;
               visible = true;
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_LIGHT_SPLASH_IN:
               SetIsCannotSee(false);
               a_1283 = false;
               visible = true;
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SPLASH_OUT:
            case STATE_LIGHT_SPLASH_OUT:
            case STATE_WAITING:
               break;
            case STATE_DEAD:
               SetIsCannotSee(true);
               break;
            case STATE_HIDE:
               SetIsCannotSee(true);
               visible = false;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
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
   }
}


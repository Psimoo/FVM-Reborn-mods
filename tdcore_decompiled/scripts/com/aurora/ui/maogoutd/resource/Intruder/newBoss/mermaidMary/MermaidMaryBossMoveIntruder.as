package com.aurora.ui.maogoutd.resource.Intruder.newBoss.mermaidMary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.boss.mermaidMary.MermaidMaryDartShot;
   import flash.utils.Dictionary;
   
   public class MermaidMaryBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 25;
      
      private static const MOVE_FAST_SPEED:Number = 35;
      
      private static const TIED_FRAME_CNT:int = 30;
      
      private static const SING_FRAME_CNT:int = 30;
      
      private static const DART_FRAME_CNT:int = 30;
      
      private static const STATE_MOVE_FAST:uint = 6;
      
      private static const STATE_CHG_TOWARD:uint = 7;
      
      private static const STATE_SKILL_TIDE:uint = 8;
      
      private static const STATE_SKILL_SING:uint = 9;
      
      private static const STATE_SKILL_DART:uint = 10;
      
      private static const STATE_INIT_APPEAR:uint = 11;
      
      private var m_dicSleptAttackFighter:Dictionary;
      
      private var m_szTmpArr:Array;
      
      public function MermaidMaryBossMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width;
         a_1467 = -40;
         m_bSkillIsOrder = true;
         this.m_dicSleptAttackFighter = new Dictionary();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MermaidMaryBossMoveIntruder) as MermaidMaryBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MermaidMaryBossMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return true;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_INIT_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_TIDE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_SING + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_DART + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_INIT_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_INIT_APPEAR + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = m_dictBossStateFrameID[STATE_HIDE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_TIDE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_TIDE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_SING + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SING + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_DART + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_DART + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,1,BattleFieldView.a_1011 - 1,BattleFieldView.a_1012 - 1]);
         m_vStateCache.push([STATE_MOVE,0,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         HavingRestForAwhile(10);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillTide);
         m_vSkillFunction.push(this.CacheSkillSing);
         m_vSkillFunction.push(this.CacheSkillDart);
      }
      
      private function CacheSkillTide() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         if(stTargetFieldGrid == null)
         {
            return;
         }
         m_vStateCache.push([STATE_MOVE,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_TIDE,TIED_FRAME_CNT - 1]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      private function CacheSkillSing() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(0,0,1,iMaxYGridNum - 2,true,-1);
         if(stTargetFieldGrid == null)
         {
            return;
         }
         m_vStateCache.push([STATE_MOVE_FAST,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_SING,SING_FRAME_CNT - 1]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      private function CacheSkillDart() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         if(stTargetFieldGrid == null)
         {
            return;
         }
         m_vStateCache.push([STATE_MOVE_FAST,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_DART,DART_FRAME_CNT - 1]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_HIDE:
               SetIsCannotSee(true);
               break;
            case STATE_INIT_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0,250);
               break;
            case STATE_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_MOVE:
            case STATE_MOVE_FAST:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               break;
            case STATE_SKILL_TIDE:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 18 - 1;
               break;
            case STATE_SKILL_SING:
               m_iLaunchNum = 3;
               m_iLaunchDelayTick = 11 - 1;
               m_iLaunchIntervalTick = 3;
               break;
            case STATE_SKILL_DART:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 17 - 1;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         a_1465 = this.IsFlyState() ? 3 : 0;
         return true;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         if(STATE_MOVE_FAST == iNextState)
         {
            a_1350 = MOVE_FAST_SPEED;
         }
         else
         {
            a_1350 = MOVE_SPEED;
         }
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var iMaxXGridNum:int = 0;
         var iMaxYGridNum:int = 0;
         var stTideInst:TideMouseMoveIntruder = null;
         var stTargetFieldGrid:a_3491 = null;
         var i:* = 0;
         var szFieldGrid:Array = null;
         var stNoteInst:NoteMouseMoveIntruder = null;
         var iTargetYGridNo:int = 0;
         var stDartShot:MermaidMaryDartShot = null;
         var iXPos:Number = NaN;
         var iYPos:Number = NaN;
         var iTmp:int = 0;
         var iNewi:int = 0;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_TIDE:
               iMaxXGridNum = BattleFieldView.a_1011;
               iMaxYGridNum = BattleFieldView.a_1012;
               szFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               for(i = 0; i < iMaxYGridNum; i++)
               {
                  stTideInst = TideMouseMoveIntruder.a_3926() as TideMouseMoveIntruder;
                  if(stTideInst != null)
                  {
                     stTargetFieldGrid = szFieldGrid[i][iMaxXGridNum - 1];
                     stTideInst.a_1797(0,-1);
                     stTideInst.iGlobalMoveFighterID = a_4265();
                     stTideInst.m_stMoveIntruderTypeID = 8388608;
                     stTideInst.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + a_3491.a_1080 * 0.5;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stTideInst,BattleLayerDefine.INTRUDER_WATER_TYPE,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stTideInst,stTargetFieldGrid,false);
                     stTideInst.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stTideInst.height) / 2;
                  }
               }
               break;
            case STATE_SKILL_SING:
               if(m_iLaunchNum == 2)
               {
                  this.m_szTmpArr = [-1,0,1];
                  for(i = 2; i > 0; i--)
                  {
                     iTmp = int(this.m_szTmpArr[i]);
                     iNewi = Math.random() * i;
                     this.m_szTmpArr[i] = this.m_szTmpArr[iNewi];
                     this.m_szTmpArr[iNewi] = iTmp;
                  }
               }
               stNoteInst = NoteMouseMoveIntruder.a_3926() as NoteMouseMoveIntruder;
               if(stNoteInst == null)
               {
                  break;
               }
               iTargetYGridNo = m_stCurrentFieldGrid.m_iYGridNo + this.m_szTmpArr.shift();
               szFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               stTargetFieldGrid = szFieldGrid[iTargetYGridNo][0];
               stNoteInst.a_1797(0,1);
               stNoteInst.SetSleptAttackFighterDictionary(this.m_dicSleptAttackFighter);
               stNoteInst.iGlobalMoveFighterID = a_4265();
               stNoteInst.m_stMoveIntruderTypeID = 8388608;
               stNoteInst.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + a_3491.a_1080 * 0.5;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stNoteInst,BattleLayerDefine.INTRUDER_SKY_TYPE,stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stNoteInst,stTargetFieldGrid,false);
               stNoteInst.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stNoteInst.height) / 2;
               break;
            case STATE_SKILL_DART:
               iMaxXGridNum = BattleFieldView.a_1011;
               iMaxYGridNum = BattleFieldView.a_1012;
               stTargetFieldGrid = GetRandSingleGrid(1,iMaxXGridNum - 2,1,iMaxYGridNum - 2,true,-1);
               if(stTargetFieldGrid == null)
               {
                  break;
               }
               stDartShot = MermaidMaryDartShot.a_4344();
               iXPos = this.x + 10;
               iYPos = this.y - 100;
               stDartShot.a_1797(a_4265(),MOVE_SPEED,1000000,iXPos,iYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
               stDartShot.IsInjured = IsInjured;
               stDartShot.TargetGrid = stTargetFieldGrid;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDartShot,BattleLayerDefine.SHOT_TYPE);
               AddWarningSignEffectToGrid(stTargetFieldGrid,15);
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_TIDE || m_iBossState == STATE_SKILL_SING || m_iBossState == STATE_SKILL_DART);
      }
      
      private function IsFlyState() : Boolean
      {
         return Boolean(STATE_HIDE == m_iBossState || STATE_MOVE == m_iBossState);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_MOVE_FAST;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
      }
   }
}


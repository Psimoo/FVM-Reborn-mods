package com.aurora.ui.maogoutd.resource.Intruder.newBoss.lobsterKnight
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.boss.lobsterKnight.LobsterKnightBubbleShot;
   import com.aurora.ui.maogoutd.resource.shot.boss.lobsterKnight.LobsterKnightFireBlazingShot;
   import com.aurora.ui.maogoutd.resource.shot.boss.lobsterKnight.LobsterKnightFireShot;
   import com.aurora.ui.maogoutd.resource.shot.boss.lobsterKnight.LobsterKnightShrimpBallMephitisShot;
   import flash.utils.Dictionary;
   
   public class LobsterKnightIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 25;
      
      private static const MOVE_FAST_SPEED:Number = 35;
      
      private static const STATE_MOVE_FAST:uint = 6;
      
      private static const STATE_SKILL_FIRE:uint = 7;
      
      private static const STATE_SKILL_BUBBLE:uint = 8;
      
      private static const STATE_SKILL_SHRIMP_BALL:uint = 9;
      
      private static const STATE_CHG_TOWARD:uint = 10;
      
      private var m_bCanSkillFireBlazing:Boolean = false;
      
      private var m_iSkillFireBlazingCurNum:int;
      
      private var m_iSkillFireBlazingTotNum:int;
      
      private var m_iSkillFireBlazingIntervalTime:int;
      
      private var m_iLastSkillFireBlazingTime:int;
      
      private var m_arrHaveMephitisFieldGrid:Array = new Array();
      
      private var m_arrTmpPos:Array = [0,0];
      
      private var m_vBubbleFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var m_stFireFieldGrid:a_3491;
      
      private var m_bIsSkillMoving:Boolean = false;
      
      public function LobsterKnightIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(LobsterKnightIntruder) as LobsterKnightIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return LobsterKnightIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return b;
      }
      
      override public function get width() : Number
      {
         return 322;
      }
      
      override public function get height() : Number
      {
         return 280;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_FIRE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_BUBBLE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_SHRIMP_BALL + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = m_dictBossStateFrameID[STATE_HIDE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_FIRE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_FIRE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_BUBBLE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_BUBBLE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_SHRIMP_BALL + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SHRIMP_BALL + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var szXGridNo:Array = null;
         var stFieldGrid:a_3491 = null;
         var i:int = 0;
         var stFireBlazingShot:LobsterKnightFireBlazingShot = null;
         var bFind:Boolean = false;
         var stShrimpBallMephitisShot:LobsterKnightShrimpBallMephitisShot = null;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         if(this.m_bCanSkillFireBlazing)
         {
            if(iCurrentTime - this.m_iLastSkillFireBlazingTime >= this.m_iSkillFireBlazingIntervalTime)
            {
               ++this.m_iSkillFireBlazingCurNum;
               this.m_iLastSkillFireBlazingTime = iCurrentTime;
               ++this.m_iSkillFireBlazingIntervalTime;
               if(this.m_iSkillFireBlazingIntervalTime > 5)
               {
                  this.m_iSkillFireBlazingIntervalTime = 5;
               }
               szXGridNo = [-this.m_iSkillFireBlazingCurNum,this.m_iSkillFireBlazingCurNum];
               for(i = 0; i < szXGridNo.length; i++)
               {
                  stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stFireFieldGrid.m_iXGridNo + szXGridNo[i],this.m_stFireFieldGrid.m_iYGridNo);
                  stFireBlazingShot = LobsterKnightFireBlazingShot.a_4344();
                  stFireBlazingShot.TargetGrid = stFieldGrid;
                  stFireBlazingShot.a_1797(a_4265(),MOVE_SPEED,1000000,stFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 * 0.5,stFieldGrid.m_iYGridNo * a_3491.a_1081 + a_3491.a_1081 * 0.5 - 70,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFireBlazingShot,BattleLayerDefine.SHOT_TYPE);
               }
            }
            if(this.m_iSkillFireBlazingCurNum == this.m_iSkillFireBlazingTotNum)
            {
               this.m_bCanSkillFireBlazing = false;
            }
         }
         else if(this.m_bIsSkillMoving)
         {
            bFind = false;
            for(i = 0; i < this.m_arrHaveMephitisFieldGrid.length; i++)
            {
               if(this.m_arrHaveMephitisFieldGrid[i][0] == m_stCurrentFieldGrid.m_iXGridNo && this.m_arrHaveMephitisFieldGrid[i][1] == m_stCurrentFieldGrid.m_iYGridNo)
               {
                  bFind = true;
                  break;
               }
            }
            if(!bFind)
            {
               this.m_arrHaveMephitisFieldGrid.push([m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo]);
               stShrimpBallMephitisShot = LobsterKnightShrimpBallMephitisShot.a_4344();
               stShrimpBallMephitisShot.TargetGrid = m_stCurrentFieldGrid;
               stShrimpBallMephitisShot.a_1797(a_4265(),MOVE_SPEED,1000000,m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 * 0.5,m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + a_3491.a_1081 * 0.5 - 50,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stShrimpBallMephitisShot,BattleLayerDefine.SHOT_TYPE);
            }
         }
         return super.a_4216(iCurrentTime);
      }
      
      private function SkillFireBlazing() : void
      {
         this.m_bCanSkillFireBlazing = true;
         this.m_iSkillFireBlazingCurNum = 0;
         this.m_iSkillFireBlazingTotNum = 4;
         this.m_iSkillFireBlazingIntervalTime = 1;
         this.m_iLastSkillFireBlazingTime = 0;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,6 - 1,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         HavingRestForAwhile(30);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillBubble);
         m_vSkillFunction.push(this.CacheSkillFire);
         m_vSkillFunction.push(this.CacheSkillShrimpBall);
      }
      
      private function CacheSkillBubble() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         stTargetFieldGrid = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         m_vStateCache.push([STATE_MOVE,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_BUBBLE,43 - 1]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      private function CacheSkillFire() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         stTargetFieldGrid = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         m_vStateCache.push([STATE_MOVE,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_FIRE,43 - 1]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      private function CacheSkillShrimpBall() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_MOVE,0,iMaxXGridNum - 1,m_iStartShowGridNo]);
         stTargetFieldGrid = GetRandSingleGrid(0,0,0,iMaxYGridNum - 1,true,-1);
         m_vStateCache.push([STATE_SKILL_SHRIMP_BALL,28 - 1,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_WAITING,5]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SKILL_SHRIMP_BALL,28 - 1,iMaxXGridNum - 1,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_WAITING,5]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,10]);
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
            case STATE_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_HIDE:
               SetIsCannotSee(true,false);
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
            case STATE_SKILL_BUBBLE:
               m_iLaunchNum = 5;
               m_iLaunchDelayTick = 11 - 1;
               m_iLaunchIntervalTick = 6;
               break;
            case STATE_SKILL_FIRE:
               m_iLaunchNum = 2;
               m_iLaunchDelayTick = 17;
               m_iLaunchIntervalTick = 17;
               break;
            case STATE_SKILL_SHRIMP_BALL:
               this.m_arrTmpPos = [m_vStateCache[0][2],m_vStateCache[0][3]];
               m_iLaunchNum = 3;
               m_iLaunchDelayTick = 9 - 1;
               m_iLaunchIntervalTick = 15;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
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
         var stBubbleShot:LobsterKnightBubbleShot = null;
         var i:int = 0;
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         var stFireShot:LobsterKnightFireShot = null;
         var fStartPosX:Number = NaN;
         var fStartPosY:Number = NaN;
         var fTargetPosX:Number = NaN;
         var fTargetPosY:Number = NaN;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_SKILL_BUBBLE:
               if(m_iLaunchNum == 4)
               {
                  this.m_vBubbleFieldGrid.length = 0;
                  for(i = 0; i < iMaxXGridNum; i++)
                  {
                     for(j = 0; j < iMaxYGridNum; j++)
                     {
                        stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
                        if(stFieldGrid.m_stBaseToolDefense != null && stFieldGrid.m_stBaseToolDefense.iToolType == 3)
                        {
                           this.m_vBubbleFieldGrid.push(stFieldGrid);
                        }
                     }
                  }
                  for(i = 0; i < 5; i++)
                  {
                     if(i >= this.m_vBubbleFieldGrid.length)
                     {
                        break;
                     }
                     j = int(m_stRandomSeed.nextInt(this.m_vBubbleFieldGrid.length - i));
                     stFieldGrid = this.m_vBubbleFieldGrid[j];
                     this.m_vBubbleFieldGrid[j] = this.m_vBubbleFieldGrid[this.m_vBubbleFieldGrid.length - 1 - i];
                     this.m_vBubbleFieldGrid[this.m_vBubbleFieldGrid.length - 1 - i] = stFieldGrid;
                  }
               }
               if(this.m_vBubbleFieldGrid.length <= 0)
               {
                  break;
               }
               stFieldGrid = this.m_vBubbleFieldGrid.pop();
               stBubbleShot = LobsterKnightBubbleShot.a_4344();
               stBubbleShot.TargetGrid = stFieldGrid;
               stBubbleShot.a_1797(a_4265(),MOVE_SPEED,1000000,stFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 * 0.5,stFieldGrid.m_iYGridNo * a_3491.a_1081 + a_3491.a_1081 * 0.5 - 50,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBubbleShot,BattleLayerDefine.SHOT_TYPE);
               AddWarningSignEffectToGrid(stFieldGrid,15);
               break;
            case STATE_SKILL_FIRE:
               if(m_iLaunchNum == 1)
               {
                  this.m_stFireFieldGrid = GetRandSingleGrid(4,4,0,iMaxYGridNum - 1,true,-1);
                  AddWarningSignEffectToGrid(this.m_stFireFieldGrid,25);
               }
               else if(m_iLaunchNum == 0)
               {
                  stFireShot = LobsterKnightFireShot.a_4344();
                  stFireShot.TargetGrid = this.m_stFireFieldGrid;
                  stFireShot.a_1797(a_4265(),MOVE_SPEED,1000000,this.m_stFireFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 * 0.5 + 60,this.m_stFireFieldGrid.m_iYGridNo * a_3491.a_1081 + a_3491.a_1081 * 0.5 - 160,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  stFireShot.SetOverCallBackFunc(this.SkillFireBlazing);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFireShot,BattleLayerDefine.SHOT_TYPE);
               }
               break;
            case STATE_SKILL_SHRIMP_BALL:
               if(m_iLaunchNum == 2)
               {
                  fStartPosX = getPosXByXGridNo(m_stCurrentFieldGrid.m_iXGridNo);
                  fStartPosY = getPosYByYGridNo(m_stCurrentFieldGrid.m_iYGridNo);
                  fTargetPosX = getPosXByXGridNo(this.m_arrTmpPos[0]);
                  fTargetPosY = getPosYByYGridNo(this.m_arrTmpPos[1]);
                  m_fMoveSpeedX = (fTargetPosX - fStartPosX) / m_iLaunchIntervalTick;
                  m_fMoveSpeedY = (fTargetPosY - fStartPosY) / m_iLaunchIntervalTick;
                  this.m_bIsSkillMoving = true;
                  this.m_arrHaveMephitisFieldGrid.length = 0;
               }
               else if(m_iLaunchNum == 1)
               {
                  m_fMoveSpeedX = m_fMoveSpeedY = 0;
                  m_iLaunchIntervalTick = 1;
               }
               else if(m_iLaunchNum == 0)
               {
                  this.m_bIsSkillMoving = false;
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_BUBBLE || m_iBossState == STATE_SKILL_FIRE || m_iBossState == STATE_SKILL_SHRIMP_BALL);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_MOVE_FAST || m_iBossState == STATE_SKILL_SHRIMP_BALL && this.m_bIsSkillMoving;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}


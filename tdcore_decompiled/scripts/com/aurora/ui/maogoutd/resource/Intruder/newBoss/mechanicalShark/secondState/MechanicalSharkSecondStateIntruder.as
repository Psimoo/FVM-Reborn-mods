package com.aurora.ui.maogoutd.resource.Intruder.newBoss.mechanicalShark.secondState
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   
   public class MechanicalSharkSecondStateIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 25;
      
      private static const MOVE_FAST_SPEED:Number = 35;
      
      private static const STATE_MOVE_FAST:uint = 6;
      
      private static const STATE_SKILL_SUMMON:uint = 7;
      
      private static const STATE_SKILL_CYCLONE:uint = 8;
      
      private static const STATE_CHARGE:uint = 9;
      
      private static const STATE_SKILL_DASH:uint = 10;
      
      private static const STATE_BRAKE:uint = 11;
      
      private static const STATE_CHG_TOWARD:uint = 12;
      
      public function MechanicalSharkSecondStateIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MechanicalSharkSecondStateIntruder) as MechanicalSharkSecondStateIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MechanicalSharkSecondStateIntruderMovie;
      }
      
      override public function get width() : Number
      {
         return 345;
      }
      
      override public function get height() : Number
      {
         return 210;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_SUMMON + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_CYCLONE + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_CHARGE + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_DASH + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_BRAKE + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 21;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = m_dictBossStateFrameID[STATE_HIDE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_SUMMON + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SUMMON + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_CYCLONE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_CYCLONE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_CHARGE + "_" + 1] = m_dictBossStateFrameID[STATE_CHARGE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_DASH + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_DASH + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_BRAKE + "_" + 1] = m_dictBossStateFrameID[STATE_BRAKE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,6 - 1,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         HavingRestForAwhile(30);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillCyclone);
         m_vSkillFunction.push(this.CacheSkillDash);
         m_vSkillFunction.push(this.CacheSkillSummon);
      }
      
      private function CacheSkillCyclone() : void
      {
         m_vStateCache.push([STATE_MOVE_FAST,0,0,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_CYCLONE,17 * 2 - 1]);
         m_vStateCache.push([STATE_HIDE,6 - 1]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_APPEAR,6,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_WAITING,20]);
      }
      
      private function CacheSkillDash() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var szRandomRange:Array = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var szRandomRanges:Array = [[[iMaxXGridNum - 1,iMaxXGridNum - 1],[iMaxYGridNum - 2,iMaxYGridNum - 1]],[[0,0],[2,4]],[[iMaxXGridNum - 1,iMaxXGridNum - 1],[0,1]]];
         var vTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
         var i:int = 0;
         var iMaxTryTime:int = 100;
         do
         {
            szRandomRange = szRandomRanges[vTargetFieldGrid.length];
            stTargetFieldGrid = GetRandSingleGrid(szRandomRange[0][0],szRandomRange[0][1],szRandomRange[1][0],szRandomRange[1][1],true,-1);
            if(stTargetFieldGrid != null)
            {
               vTargetFieldGrid.push(stTargetFieldGrid);
            }
            i++;
         }
         while(!(vTargetFieldGrid.length == 3 || i > iMaxTryTime));
         if(vTargetFieldGrid.length < 3)
         {
            return;
         }
         m_vStateCache.push([STATE_MOVE,0,vTargetFieldGrid[0].m_iXGridNo,vTargetFieldGrid[0].m_iYGridNo]);
         m_vStateCache.push([STATE_CHARGE,19 - 1]);
         m_vStateCache.push([STATE_SKILL_DASH,8 - 1,0,vTargetFieldGrid[0].m_iYGridNo]);
         m_vStateCache.push([STATE_HIDE,6 - 1]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_APPEAR,6 - 1,vTargetFieldGrid[1].m_iXGridNo,vTargetFieldGrid[1].m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_DASH,8 - 1,iMaxXGridNum - 1,vTargetFieldGrid[1].m_iYGridNo]);
         m_vStateCache.push([STATE_HIDE,6 - 1]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_APPEAR,6 - 1,vTargetFieldGrid[2].m_iXGridNo,vTargetFieldGrid[2].m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_DASH,8 - 1,0,vTargetFieldGrid[2].m_iYGridNo]);
         m_vStateCache.push([STATE_HIDE,6 - 1]);
         m_vStateCache.push([STATE_APPEAR,6 - 1,iMaxXGridNum - 1,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      private function CacheSkillSummon() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_MOVE,0,iMaxXGridNum - 1,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_SKILL_SUMMON,30 - 1]);
         m_vStateCache.push([STATE_WAITING,20]);
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
            case STATE_SKILL_DASH:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               if(iNextState == STATE_SKILL_DASH)
               {
                  iNextValue = setMoveToPosition(fPosX,fPosY) + 1;
               }
               else
               {
                  iNextValue = setMoveToPosition(fPosX,fPosY);
               }
               break;
            case STATE_CHG_TOWARD:
               SetIsCannotSee(true);
               a_1283 = !a_1283;
               break;
            case STATE_SKILL_CYCLONE:
               SetIsCannotSee(false);
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 17 * 2 - 1;
               break;
            case STATE_SKILL_SUMMON:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 30 - 1;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         if(STATE_SKILL_DASH == iNextState || STATE_MOVE_FAST == iNextState)
         {
            a_1350 = MOVE_FAST_SPEED;
         }
         else
         {
            a_1350 = MOVE_SPEED;
         }
      }
      
      override protected function IsCanLaunchShot(iCurrentTime:int) : Boolean
      {
         if(!this.IsSkillState() || !IsInBattle())
         {
            return false;
         }
         if(m_iBossState == STATE_SKILL_DASH)
         {
            return true;
         }
         return super.IsCanLaunchShot(iCurrentTime);
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var iMaxXGridNum:int = 0;
         var iMaxYGridNum:int = 0;
         var szFieldGrid:Array = null;
         var stStartFieldGrid:a_3491 = null;
         var szWayPoint:Array = null;
         var i:int = 0;
         var stCycloneInst:CycloneMouseMoveIntruder = null;
         var stMouse:a_4206 = null;
         var stFieldGrid:a_3491 = null;
         if(!this.IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_CYCLONE:
               iMaxXGridNum = BattleFieldView.a_1011;
               iMaxYGridNum = BattleFieldView.a_1012;
               szFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               stStartFieldGrid = szFieldGrid[m_iStartShowGridNo][0];
               if(stStartFieldGrid == null)
               {
                  break;
               }
               szWayPoint = [[[0,3],[4,0],[iMaxXGridNum - 1,3]],[[0,3],[4,iMaxYGridNum - 1],[iMaxXGridNum - 1,3]]];
               for(i = 0; i < szWayPoint.length; i++)
               {
                  stCycloneInst = CycloneMouseMoveIntruder.a_3926() as CycloneMouseMoveIntruder;
                  stCycloneInst.a_1797(0,-1);
                  stCycloneInst.SetWaypoint(szWayPoint[i]);
                  stCycloneInst.iGlobalMoveFighterID = a_4265();
                  stCycloneInst.m_stMoveIntruderTypeID = 8388608;
                  stCycloneInst.x = a_3491.a_1080 * stStartFieldGrid.m_iXGridNo + a_3491.a_1080 * 0.5;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stCycloneInst,BattleLayerDefine.INTRUDER_WATER_TYPE,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stCycloneInst,stStartFieldGrid,false);
                  stCycloneInst.y = a_3491.a_1081 * stStartFieldGrid.m_iYGridNo + (a_3491.a_1081 - stCycloneInst.height) / 2;
               }
               break;
            case STATE_SKILL_DASH:
               if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.a_3492())
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_SUMMON:
               iMaxXGridNum = BattleFieldView.a_1011;
               iMaxYGridNum = BattleFieldView.a_1012;
               for(i = 0; i < iMaxYGridNum; i++)
               {
                  stMouse = a_4255.getInstance().a_4256(i % 2 == 0 ? 8388626 : 8388627);
                  if(null == stMouse)
                  {
                     throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (i % 2 == 0 ? 8388626 : 8388627).toString(16));
                  }
                  stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iMaxXGridNum - 1,i);
                  AddOutMoveIntruder(stMouse,stFieldGrid,-1,0.5,true);
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_CYCLONE || m_iBossState == STATE_SKILL_DASH || m_iBossState == STATE_SKILL_SUMMON);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_MOVE_FAST || m_iBossState == STATE_SKILL_DASH && m_iLaunchRunTick > 1;
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


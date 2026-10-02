package com.aurora.ui.maogoutd.resource.Intruder.newBoss.lightningJellyfish
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   
   public class LightningJellyfishIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 25;
      
      private static const MOVE_FAST_SPEED:Number = 35;
      
      private static const STATE_MOVE_FAST:uint = 6;
      
      private static const STATE_SKILL_ROW_ELECTRIC_SHOCK:uint = 7;
      
      private static const STATE_SKILL_COLUMN_ELECTRIC_SHOCK:uint = 8;
      
      private static const STATE_SKILL_PHOTOSPHERE:uint = 9;
      
      public static const m_arrPhotospherePosOffset:Array = [[-40,31],[0,50],[42,18]];
      
      private var m_arrElectricShockPos:Array = new Array();
      
      private var m_vPhotosphereFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function LightningJellyfishIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(LightningJellyfishIntruder) as LightningJellyfishIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return LightningJellyfishIntruderMovie;
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
         return 370;
      }
      
      override public function get height() : Number
      {
         return 240;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ROW_ELECTRIC_SHOCK + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_PHOTOSPHERE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_COLUMN_ELECTRIC_SHOCK + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE_FAST + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_ROW_ELECTRIC_SHOCK + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_ROW_ELECTRIC_SHOCK + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_PHOTOSPHERE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_PHOTOSPHERE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_COLUMN_ELECTRIC_SHOCK + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_COLUMN_ELECTRIC_SHOCK + "_" + 0] + 1;
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
         m_vSkillFunction.push(this.CacheSkillRowElectricShock);
         m_vSkillFunction.push(this.CacheSkillColumnElectricShock);
         m_vSkillFunction.push(this.CacheSkillPhotosphere);
      }
      
      private function CacheSkillRowElectricShock() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(5,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         m_vStateCache.push([STATE_MOVE,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_ROW_ELECTRIC_SHOCK,48 - 1]);
         m_vStateCache.push([STATE_WAITING,10]);
         this.m_arrElectricShockPos.length = 0;
         for(var i:int = 0; i < 4; i++)
         {
            this.m_arrElectricShockPos.push([stTargetFieldGrid.m_iXGridNo - 2 - i,stTargetFieldGrid.m_iYGridNo]);
         }
      }
      
      private function CacheSkillColumnElectricShock() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(0,iMaxXGridNum - 1,0,3,true,-1);
         m_vStateCache.push([STATE_MOVE,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_COLUMN_ELECTRIC_SHOCK,31 - 1]);
         m_vStateCache.push([STATE_WAITING,10]);
         this.m_arrElectricShockPos.length = 0;
         for(var i:int = 0; i < 4; i++)
         {
            this.m_arrElectricShockPos.push([stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo + i]);
         }
      }
      
      private function CacheSkillPhotosphere() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         m_vStateCache.push([STATE_MOVE,0,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_PHOTOSPHERE,42 - 1]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
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
            case STATE_MOVE:
            case STATE_MOVE_FAST:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_ROW_ELECTRIC_SHOCK:
               m_iLaunchNum = 4;
               m_iLaunchDelayTick = 27 - 1;
               m_iLaunchIntervalTick = 18 / (m_iLaunchNum - 1);
               break;
            case STATE_SKILL_COLUMN_ELECTRIC_SHOCK:
               m_iLaunchNum = 4;
               m_iLaunchDelayTick = 16 - 1;
               m_iLaunchIntervalTick = 12 / (m_iLaunchNum - 1);
               break;
            case STATE_SKILL_PHOTOSPHERE:
               m_iLaunchNum = 3;
               m_iLaunchDelayTick = 19 - 1;
               m_iLaunchIntervalTick = 12 / (m_iLaunchNum - 1);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         if(STATE_SKILL_PHOTOSPHERE == iNextState || STATE_MOVE_FAST == iNextState)
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
         var arrPos:Array = null;
         var stTargetFieldGrid:a_3491 = null;
         var stPhotosphereInst:PhotosphereMouseMoveIntruder = null;
         var iMaxXGridNum:int = 0;
         var iMaxYGridNum:int = 0;
         var i:int = 0;
         var j:int = 0;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_ROW_ELECTRIC_SHOCK:
            case STATE_SKILL_COLUMN_ELECTRIC_SHOCK:
               if(this.m_arrElectricShockPos.length <= 0)
               {
                  break;
               }
               arrPos = this.m_arrElectricShockPos.shift();
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(arrPos[0],arrPos[1]);
               if(stTargetFieldGrid != null)
               {
                  this.a_3502(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_PHOTOSPHERE:
               if(m_iLaunchNum == 2)
               {
                  iMaxXGridNum = BattleFieldView.a_1011;
                  iMaxYGridNum = BattleFieldView.a_1012;
                  this.m_vPhotosphereFieldGrid.length = 0;
                  for(i = 0; i < iMaxXGridNum; i++)
                  {
                     for(j = 0; j < iMaxYGridNum; j++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
                        if(stTargetFieldGrid.m_iFieldGridType == 0)
                        {
                           this.m_vPhotosphereFieldGrid.push(stTargetFieldGrid);
                        }
                     }
                  }
                  for(i = 0; i < 5; i++)
                  {
                     if(i >= this.m_vPhotosphereFieldGrid.length)
                     {
                        break;
                     }
                     j = int(m_stRandomSeed.nextInt(this.m_vPhotosphereFieldGrid.length - i));
                     stTargetFieldGrid = this.m_vPhotosphereFieldGrid[j];
                     this.m_vPhotosphereFieldGrid[j] = this.m_vPhotosphereFieldGrid[this.m_vPhotosphereFieldGrid.length - 1 - i];
                     this.m_vPhotosphereFieldGrid[this.m_vPhotosphereFieldGrid.length - 1 - i] = stTargetFieldGrid;
                  }
               }
               if(this.m_vPhotosphereFieldGrid.length <= 0)
               {
                  break;
               }
               stTargetFieldGrid = this.m_vPhotosphereFieldGrid.pop();
               stPhotosphereInst = PhotosphereMouseMoveIntruder.a_3926() as PhotosphereMouseMoveIntruder;
               stPhotosphereInst.a_1797(0,-1);
               stPhotosphereInst.iGlobalMoveFighterID = a_4265();
               stPhotosphereInst.m_stMoveIntruderTypeID = 8388608;
               stPhotosphereInst.x = a_3491.a_1080 * m_stCurrentFieldGrid.m_iXGridNo + a_3491.a_1080 * 0.5;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPhotosphereInst,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPhotosphereInst,stTargetFieldGrid,false);
               stPhotosphereInst.y = a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - stPhotosphereInst.height) / 2;
               stPhotosphereInst.SetMaxLifeValue(a_1339 / 10);
               stPhotosphereInst.SetFieldGrid(m_stCurrentFieldGrid,m_arrPhotospherePosOffset[m_iLaunchNum][0],m_arrPhotospherePosOffset[m_iLaunchNum][1],stTargetFieldGrid);
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ROW_ELECTRIC_SHOCK || m_iBossState == STATE_SKILL_COLUMN_ELECTRIC_SHOCK || m_iBossState == STATE_SKILL_PHOTOSPHERE);
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
      
      override protected function CacheNextSkill() : void
      {
         var iPos:int = 0;
         iHorizontalDirect = 1;
         iVerticalDirect = 1;
         if(0 == m_vSkillID.length)
         {
            m_vSkillID.push(m_stRandomSeed.nextInt(2));
            m_vSkillID.push(m_stRandomSeed.nextInt(2));
            m_vSkillID.push(m_stRandomSeed.nextInt(2));
            m_vSkillID.push(2);
         }
         if(m_bSkillIsOrder)
         {
            iPos = 0;
         }
         else
         {
            iPos = int(m_stRandomSeed.nextInt(m_vSkillID.length));
         }
         var iSkillID:int = m_vSkillID[iPos];
         m_vSkillID.splice(iPos,1);
         m_vSkillFunction[iSkillID]();
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


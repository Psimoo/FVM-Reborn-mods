package com.aurora.ui.maogoutd.resource.Intruder.newBoss.lightningJellyfish
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.utils.Dictionary;
   
   public class PhotosphereMouseMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 25;
      
      private static const STATE_SKILL_KILL:uint = 6;
      
      private static const STATE_SKILL_DEVOUR:uint = 7;
      
      private var m_stStartGrid:a_3491;
      
      private var m_iStartGridOffsetX:int;
      
      private var m_iStartGridOffsetY:int;
      
      private var m_stTargetGrid:a_3491;
      
      private var m_iOldFieldGridType:int;
      
      public function PhotosphereMouseMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PhotosphereMouseMoveIntruder,PhotosphereMouseMoveIntruderMovie) as PhotosphereMouseMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         super.a_3940();
         return true;
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
         return 170;
      }
      
      override public function get height() : Number
      {
         return 100;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SKILL_DEVOUR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0];
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE + "_" + 0];
         m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_KILL + "_" + 0];
         m_dictBossStateFrameID[STATE_SKILL_DEVOUR + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_DEVOUR + "_" + 0];
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      public function SetMaxLifeValue(v:int) : void
      {
         m_iMaxLife.Value = v;
      }
      
      override protected function setLifeValue() : void
      {
         a_1339 = m_iMaxLife.Value;
         numHardRate = 1;
      }
      
      public function SetFieldGrid(startGrid:a_3491, offsetX:int, offsetY:int, targetGrid:a_3491) : void
      {
         this.m_stStartGrid = startGrid;
         this.m_iStartGridOffsetX = offsetX;
         this.m_iStartGridOffsetY = offsetY;
         this.m_stTargetGrid = targetGrid;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         return super.a_4216(iCurrentTime);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,3 - 1,this.m_stStartGrid.m_iXGridNo,this.m_stStartGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_MOVE,0,this.m_stTargetGrid.m_iXGridNo,this.m_stTargetGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_KILL,1]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillDevour);
      }
      
      private function CacheSkillDevour() : void
      {
         m_vStateCache.push([STATE_SKILL_DEVOUR,4 - 1]);
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
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],this.m_iStartGridOffsetX,this.m_iStartGridOffsetY);
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_KILL:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 1;
               break;
            case STATE_SKILL_DEVOUR:
               m_iLaunchNum = 4;
               m_iLaunchDelayTick = 1;
               m_iLaunchIntervalTick = 1;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stBaseEnergy:a_4157 = null;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_KILL:
               this.a_3502(m_stCurrentFieldGrid);
               this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
               if(m_stCurrentFieldGrid.m_iFieldGridType != 1 || m_stCurrentFieldGrid.m_iFieldGridType != 4)
               {
                  m_stCurrentFieldGrid.m_iFieldGridType = 3;
               }
               break;
            case STATE_SKILL_DEVOUR:
               if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector))
               {
                  for each(stBaseEnergy in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector.slice())
                  {
                     stBaseEnergy.a_4159(x,y);
                  }
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_KILL || m_iBossState == STATE_SKILL_DEVOUR);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
      }
   }
}


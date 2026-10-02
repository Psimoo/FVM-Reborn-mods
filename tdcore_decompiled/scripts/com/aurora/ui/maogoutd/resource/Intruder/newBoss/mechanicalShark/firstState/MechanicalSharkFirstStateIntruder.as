package com.aurora.ui.maogoutd.resource.Intruder.newBoss.mechanicalShark.firstState
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.boss.mechanicalShark.firstState.MechanicalSharkFirstStateFireShot;
   import flash.utils.Dictionary;
   
   public class MechanicalSharkFirstStateIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 25;
      
      private static const MOVE_SKILL_DASH_SPEED:Number = 35;
      
      private static const STATE_SKILL_SUMMON:uint = 6;
      
      private static const STATE_SKILL_FIRE:uint = 7;
      
      private static const STATE_CHARGE:uint = 8;
      
      private static const STATE_SKILL_DASH:uint = 9;
      
      private static const STATE_BRAKE:uint = 10;
      
      private static const STATE_CHG_TOWARD:uint = 11;
      
      public function MechanicalSharkFirstStateIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MechanicalSharkFirstStateIntruder) as MechanicalSharkFirstStateIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MechanicalSharkFirstStateIntruderMovie;
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
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_SUMMON + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_FIRE + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_CHARGE + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_DASH + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_BRAKE + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_MOVE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = m_dictBossStateFrameID[STATE_HIDE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_SUMMON + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SUMMON + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_FIRE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_FIRE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_CHARGE + "_" + 1] = m_dictBossStateFrameID[STATE_CHARGE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_SKILL_DASH + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_DASH + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_BRAKE + "_" + 1] = m_dictBossStateFrameID[STATE_BRAKE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,6,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         HavingRestForAwhile(30);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillFire);
         m_vSkillFunction.push(this.CacheSkillDash);
         m_vSkillFunction.push(this.CacheSkillSummon);
      }
      
      private function CacheSkillFire() : void
      {
         m_vStateCache.push([STATE_SKILL_FIRE,36 - 1]);
         m_vStateCache.push([STATE_WAITING,20]);
      }
      
      private function CacheSkillDash() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         m_vStateCache.push([STATE_MOVE,0,iMaxXGridNum - 1,iMaxYGridNum - 1]);
         m_vStateCache.push([STATE_SKILL_DASH,8 - 1,0,iMaxYGridNum - 1]);
         m_vStateCache.push([STATE_HIDE,6 - 1]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_APPEAR,6 - 1,0,0]);
         m_vStateCache.push([STATE_SKILL_DASH,8 - 1,iMaxXGridNum - 1,0]);
         m_vStateCache.push([STATE_BRAKE,12 - 1]);
         m_vStateCache.push([STATE_HIDE,6 - 1]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_APPEAR,6 - 1,iMaxXGridNum - 1,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_WAITING,20]);
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
            case STATE_SKILL_DASH:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               if(iNextState == STATE_MOVE)
               {
                  iNextValue = setMoveToPosition(fPosX,fPosY);
               }
               else
               {
                  iNextValue = setMoveToPosition(fPosX,fPosY) + 1;
               }
               break;
            case STATE_CHG_TOWARD:
               SetIsCannotSee(true);
               a_1283 = !a_1283;
               break;
            case STATE_SKILL_FIRE:
               m_iLaunchNum = 2;
               m_iLaunchDelayTick = 23 - 1;
               m_iLaunchIntervalTick = 8;
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
         if(STATE_SKILL_DASH == iNextState)
         {
            a_1350 = MOVE_SKILL_DASH_SPEED;
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
         var stTargetFieldGrid:a_3491 = null;
         var stFireShot:MechanicalSharkFirstStateFireShot = null;
         var i:int = 0;
         var uMouseID:uint = 0;
         var stMouse:a_4206 = null;
         var stFieldGrid:a_3491 = null;
         if(!this.IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_FIRE:
               iMaxXGridNum = BattleFieldView.a_1011;
               iMaxYGridNum = BattleFieldView.a_1012;
               stTargetFieldGrid = GetRandSingleGrid(1,iMaxXGridNum - 2,1,iMaxYGridNum - 1,true,-1);
               if(stTargetFieldGrid == null)
               {
                  break;
               }
               stFireShot = MechanicalSharkFirstStateFireShot.a_4344();
               stFireShot.TargetGrid = stTargetFieldGrid;
               stFireShot.a_1797(a_4265(),MOVE_SPEED,1000000,this.x - 80,this.y + 130,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFireShot,BattleLayerDefine.SHOT_TYPE);
               AddWarningSignEffectToGrid(stTargetFieldGrid,15);
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
                  if(i != m_iStartShowGridNo)
                  {
                     uMouseID = 8388775;
                     stMouse = a_4255.getInstance().a_4256(uMouseID);
                     if(null == stMouse)
                     {
                        throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + uMouseID.toString(16));
                     }
                     stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iMaxXGridNum - 1,i);
                     AddOutMoveIntruder(stMouse,stFieldGrid,-1,0.5,true);
                  }
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_FIRE || m_iBossState == STATE_SKILL_DASH || m_iBossState == STATE_SKILL_SUMMON);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_DASH && m_iLaunchRunTick > 1;
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


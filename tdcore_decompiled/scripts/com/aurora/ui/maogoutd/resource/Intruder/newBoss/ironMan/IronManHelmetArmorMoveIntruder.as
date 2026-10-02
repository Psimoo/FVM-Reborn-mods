package com.aurora.ui.maogoutd.resource.Intruder.newBoss.ironMan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.IronManLaserEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class IronManHelmetArmorMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const STATE_LEFT_START_ATTACK:uint = 7;
      
      private static const STATE_SKILL_LEFT_LASER:uint = 8;
      
      private static const STATE_LEFT_END_ATTACK:uint = 9;
      
      private static const STATE_LEFT_DOWN_START_ATTACK:uint = 10;
      
      private static const STATE_SKILL_LEFT_DOWN_LASER:uint = 11;
      
      private static const STATE_LEFT_DOWN_END_ATTACK:uint = 12;
      
      private static const STATE_RIGHT_START_ATTACK:uint = 13;
      
      private static const STATE_SKILL_RIGHT_LASER:uint = 14;
      
      private static const STATE_RIGHT_END_ATTACK:uint = 15;
      
      private static const STATE_RIGHT_DOWN_START_ATTACK:uint = 16;
      
      private static const STATE_SKILL_RIGHT_DOWN_LASER:uint = 17;
      
      private static const STATE_RIGHT_DOWN_END_ATTACK:uint = 18;
      
      private static const SKILL_LASER_NUM:int = 1;
      
      private static const SKILL_LASER_TICK:int = 19;
      
      private var m_iIsInjured:int;
      
      public function IronManHelmetArmorMoveIntruder()
      {
         super();
         a_1279 = -110 + 15 - 30;
         a_1467 = -55 + 10;
      }
      
      public static function a_3926() : IronManHelmetArmorMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IronManHelmetArmorMoveIntruder) as IronManHelmetArmorMoveIntruder;
      }
      
      override public function get height() : Number
      {
         return 220;
      }
      
      override public function get width() : Number
      {
         return 306;
      }
      
      override protected function getBossFrameStateKey() : String
      {
         return m_iBossState + "_" + this.m_iIsInjured;
      }
      
      public function set ArmorState(iIsInjured:int) : void
      {
         this.m_iIsInjured = iIsInjured;
      }
      
      override protected function getBindMovie() : Class
      {
         return IronManHelmetArmorMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1475 = false;
         a_1481 = false;
         a_1464 = true;
         m_bIsNoChangeCannotSee = true;
         return true;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo]);
         HavingRestForAwhile(10);
      }
      
      private function CacheSkillLaser() : void
      {
         m_vStateCache.push([STATE_LEFT_START_ATTACK,6]);
         m_vStateCache.push([STATE_SKILL_LEFT_LASER,SKILL_LASER_NUM * SKILL_LASER_TICK]);
         m_vStateCache.push([STATE_LEFT_END_ATTACK,2]);
         HavingRestForAwhile(10);
         m_vStateCache.push([STATE_RIGHT_START_ATTACK,6]);
         m_vStateCache.push([STATE_SKILL_RIGHT_LASER,SKILL_LASER_NUM * SKILL_LASER_TICK]);
         m_vStateCache.push([STATE_RIGHT_END_ATTACK,2]);
         HavingRestForAwhile(10);
         m_vStateCache.push([STATE_LEFT_DOWN_START_ATTACK,6]);
         m_vStateCache.push([STATE_SKILL_LEFT_DOWN_LASER,SKILL_LASER_NUM * SKILL_LASER_TICK]);
         m_vStateCache.push([STATE_LEFT_DOWN_END_ATTACK,2]);
         HavingRestForAwhile(10);
         m_vStateCache.push([STATE_RIGHT_DOWN_START_ATTACK,6]);
         m_vStateCache.push([STATE_SKILL_RIGHT_DOWN_LASER,SKILL_LASER_NUM * SKILL_LASER_TICK]);
         m_vStateCache.push([STATE_RIGHT_DOWN_END_ATTACK,2]);
         HavingRestForAwhile(10);
         m_vStateCache.push([STATE_DEAD,12]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillLaser);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_LEFT_START_ATTACK + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_LEFT_LASER + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_LEFT_END_ATTACK + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_LEFT_DOWN_START_ATTACK + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_LEFT_DOWN_LASER + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_LEFT_DOWN_END_ATTACK + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_RIGHT_START_ATTACK + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_RIGHT_LASER + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_RIGHT_END_ATTACK + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_RIGHT_DOWN_START_ATTACK + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_RIGHT_DOWN_LASER + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_RIGHT_DOWN_END_ATTACK + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 15;
         var iAddFrameID:int = 15;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = iAddFrameID + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = iAddFrameID + 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = iAddFrameID + 2;
         m_dictBossStateFrameID[STATE_LEFT_START_ATTACK + "_" + 1] = iAddFrameID + 3;
         m_dictBossStateFrameID[STATE_SKILL_LEFT_LASER + "_" + 1] = iAddFrameID + 4;
         m_dictBossStateFrameID[STATE_LEFT_END_ATTACK + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_LEFT_DOWN_START_ATTACK + "_" + 1] = iAddFrameID + 6;
         m_dictBossStateFrameID[STATE_SKILL_LEFT_DOWN_LASER + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_LEFT_DOWN_END_ATTACK + "_" + 1] = iAddFrameID + 8;
         m_dictBossStateFrameID[STATE_RIGHT_START_ATTACK + "_" + 1] = iAddFrameID + 9;
         m_dictBossStateFrameID[STATE_SKILL_RIGHT_LASER + "_" + 1] = iAddFrameID + 10;
         m_dictBossStateFrameID[STATE_RIGHT_END_ATTACK + "_" + 1] = iAddFrameID + 11;
         m_dictBossStateFrameID[STATE_RIGHT_DOWN_START_ATTACK + "_" + 1] = iAddFrameID + 12;
         m_dictBossStateFrameID[STATE_SKILL_RIGHT_DOWN_LASER + "_" + 1] = iAddFrameID + 13;
         m_dictBossStateFrameID[STATE_RIGHT_DOWN_END_ATTACK + "_" + 1] = iAddFrameID + 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = iAddFrameID + 15;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_SKILL_LEFT_LASER == m_iBossState || STATE_SKILL_LEFT_DOWN_LASER == m_iBossState || STATE_SKILL_RIGHT_LASER == m_iBossState || STATE_SKILL_RIGHT_DOWN_LASER == m_iBossState;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_LEFT_LASER:
               this.RealeaseLaser(true,false);
               break;
            case STATE_SKILL_LEFT_DOWN_LASER:
               this.RealeaseLaser(true,true);
               break;
            case STATE_SKILL_RIGHT_LASER:
               this.RealeaseLaser(false,false);
               break;
            case STATE_SKILL_RIGHT_DOWN_LASER:
               this.RealeaseLaser(false,true);
               break;
            default:
               trace(">>>>>>" + this.toString() + "->CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
      }
      
      private function RealeaseLaser(bIsLeft:Boolean, bIsDown:Boolean) : void
      {
         var fStartX:Number = NaN;
         var fStartY:Number = NaN;
         var stTargetFieldGrid:a_3491 = null;
         var stIronManLaserEffect:IronManLaserEffect = null;
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         var iMaxYGrid:int = BattleFieldView.a_1012 - 1;
         var iCurXGrid:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iCurYGrid:int = m_stCurrentFieldGrid.m_iYGridNo;
         if(!bIsDown)
         {
            if(bIsLeft)
            {
               stTargetFieldGrid = GetRandSingleGrid(0,iCurXGrid - 2,iCurYGrid - 1,iCurYGrid - 1,true);
               fStartX = (iCurXGrid - 1) * a_3491.a_1080 + 5;
               fStartY = (iCurYGrid - 0.5) * a_3491.a_1081 + 40;
            }
            else
            {
               stTargetFieldGrid = GetRandSingleGrid(iCurXGrid + 3,iMaxXGrid - 1,iCurYGrid - 1,iCurYGrid - 1,true);
               fStartX = (iCurXGrid + 3.5) * a_3491.a_1080 - 15;
               fStartY = (iCurYGrid - 0.5) * a_3491.a_1081;
            }
         }
         else if(bIsLeft)
         {
            stTargetFieldGrid = GetRandSingleGrid(iCurXGrid - 1,iCurXGrid - 1,iCurYGrid + 1,iMaxYGrid,true);
            fStartX = (iCurXGrid - 0.5) * a_3491.a_1080 - 3;
            fStartY = (iCurYGrid + 0.5) * a_3491.a_1081 + 5;
         }
         else
         {
            stTargetFieldGrid = GetRandSingleGrid(iCurXGrid + 2,iCurXGrid + 2,iCurYGrid + 1,iMaxYGrid,true);
            fStartX = (iCurXGrid + 2.5) * a_3491.a_1080 - 5;
            fStartY = (iCurYGrid + 0.5) * a_3491.a_1081;
         }
         if(null == stTargetFieldGrid)
         {
            return;
         }
         stIronManLaserEffect = IronManLaserEffect.a_3926();
         stIronManLaserEffect.a_1797(a_1283);
         stIronManLaserEffect.x = fStartX;
         stIronManLaserEffect.y = fStartY;
         stIronManLaserEffect.SetAttackTarget(stTargetFieldGrid,bIsLeft,bIsDown);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stIronManLaserEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE,m_stCurrentFieldGrid);
         stIronManLaserEffect.play();
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
         switch(iNextState)
         {
            case STATE_HIDE:
               SetIsCannotSee(true);
               break;
            case STATE_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = 24;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_LEFT_LASER:
            case STATE_SKILL_LEFT_DOWN_LASER:
            case STATE_SKILL_RIGHT_LASER:
            case STATE_SKILL_RIGHT_DOWN_LASER:
               m_iLaunchNum = SKILL_LASER_NUM;
               m_iLaunchDelayTick = 11;
               m_iLaunchIntervalTick = SKILL_LASER_TICK;
               break;
            case STATE_DEAD:
               this.KillMySelf();
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         a_1465 = this.IsFlyState() ? 3 : 0;
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      public function KillMySelf() : void
      {
         a_1339 = 0;
         this.LifeIsZeroHandle(STATE_DEAD);
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         m_iBossState = iDeadState;
         GotoAndStopFrame(m_dictBossStateFrameID[this.getBossFrameStateKey()] - 1);
         play();
      }
      
      override protected function UpdateBossBloodProgress() : void
      {
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return false;
      }
      
      private function IsFlyState() : Boolean
      {
         return true;
      }
   }
}


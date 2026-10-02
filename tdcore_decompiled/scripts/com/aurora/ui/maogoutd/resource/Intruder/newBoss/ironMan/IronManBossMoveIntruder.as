package com.aurora.ui.maogoutd.resource.Intruder.newBoss.ironMan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.HitCardBombEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.ironMan.IronManMissileShot;
   import flash.utils.Dictionary;
   
   public class IronManBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const STATE_FLY_DOWN:uint = 6;
      
      private static const STATE_LANDING:uint = 7;
      
      private static const STATE_TAKE_OFF:uint = 8;
      
      private static const STATE_FLY_UP:uint = 9;
      
      private static const STATE_CHARGE_FLIGHT:uint = 10;
      
      private static const STATE_SKILL_FLIGHT_COLLISION:uint = 11;
      
      private static const STATE_SKILL_BURST:uint = 12;
      
      private static const STATE_WATING_NUDITY:uint = 13;
      
      private static const STATE_COMBINATION_OF_ARMOR:uint = 14;
      
      private static const STATE_EXTENDED_BARREL:uint = 15;
      
      private static const STATE_SKILL_LAUNCH_MISSILES:uint = 16;
      
      private static const STATE_BACK_BARREL:uint = 17;
      
      private static const SKILL_BURST_TICK:int = 3;
      
      private static const SKILL_MISSILE_NUM:int = 3;
      
      private static const OUT_GRID_NUM:int = 2;
      
      private static const MOVE_SPEED:Number = 25;
      
      private var m_stHelmetArmorMoveIntruder:IronManHelmetArmorMoveIntruder;
      
      public function IronManBossMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.3 * this.width;
         a_1467 = -40;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(IronManBossMoveIntruder) as IronManBossMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(null != this.m_stHelmetArmorMoveIntruder)
         {
            this.m_stHelmetArmorMoveIntruder.a_3432();
            this.m_stHelmetArmorMoveIntruder = null;
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return IronManBossMoveIntruderMovie;
      }
      
      override public function get height() : Number
      {
         return 210;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         HavingRestForAwhile(10);
      }
      
      private function HideMySelf(iTickNum:int = 0) : void
      {
         m_vStateCache.push([STATE_TAKE_OFF,6]);
         m_vStateCache.push([STATE_FLY_UP]);
         m_vStateCache.push([STATE_HIDE,iTickNum]);
      }
      
      private function ShowMySelf(iXGridNo:int, iYGridNo:int, iTickNum:int = 0) : void
      {
         m_vStateCache.push([STATE_APPEAR,iXGridNo,-OUT_GRID_NUM]);
         m_vStateCache.push([STATE_FLY_DOWN,iXGridNo,iYGridNo]);
         m_vStateCache.push([STATE_LANDING,9]);
         HavingRestForAwhile(iTickNum);
      }
      
      private function CacheSkillCollision() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         var iMaxYGrid:int = BattleFieldView.a_1012 - 1;
         this.HideMySelf();
         this.ShowMySelf(6,iMaxYGrid,5);
         m_vStateCache.push([STATE_CHARGE_FLIGHT,10]);
         m_vStateCache.push([STATE_SKILL_FLIGHT_COLLISION,6,-OUT_GRID_NUM]);
         this.ShowMySelf(3,0,5);
         m_vStateCache.push([STATE_CHARGE_FLIGHT,10]);
         m_vStateCache.push([STATE_SKILL_FLIGHT_COLLISION,3,iMaxYGrid + OUT_GRID_NUM]);
         this.ShowMySelf(iMaxXGrid,m_iStartShowGridNo,10);
      }
      
      private function get IsNudity() : Boolean
      {
         return STATE_SKILL_BURST == m_iBossState || STATE_WATING_NUDITY == m_iBossState;
      }
      
      private function CacheSkillBrust() : void
      {
         m_vStateCache.push([STATE_SKILL_BURST,45]);
         m_vStateCache.push([STATE_WATING_NUDITY,205]);
         m_vStateCache.push([STATE_COMBINATION_OF_ARMOR,29]);
         HavingRestForAwhile(10);
      }
      
      private function CacheSkillMissile() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         m_vStateCache.push([STATE_MOVE,iMaxXGrid - 3,m_iStartShowGridNo - 2]);
         m_vStateCache.push([STATE_MOVE,3,m_iStartShowGridNo + 2]);
         m_vStateCache.push([STATE_MOVE,iMaxXGrid,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_LANDING,9]);
         m_vStateCache.push([STATE_EXTENDED_BARREL,23]);
         m_vStateCache.push([STATE_SKILL_LAUNCH_MISSILES,6 * SKILL_MISSILE_NUM]);
         m_vStateCache.push([STATE_BACK_BARREL,5]);
         HavingRestForAwhile(40);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillCollision);
         m_vSkillFunction.push(this.CacheSkillBrust);
         m_vSkillFunction.push(this.CacheSkillMissile);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_FLY_DOWN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_LANDING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_TAKE_OFF + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_FLY_UP + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_CHARGE_FLIGHT + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_FLIGHT_COLLISION + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_BURST + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_WATING_NUDITY + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_COMBINATION_OF_ARMOR + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_EXTENDED_BARREL + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_LAUNCH_MISSILES + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_BACK_BARREL + "_" + 0] = 14;
         var iAddFrameID:int = 14;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_FLY_DOWN + "_" + 1] = iAddFrameID + 1;
         m_dictBossStateFrameID[STATE_LANDING + "_" + 1] = iAddFrameID + 2;
         m_dictBossStateFrameID[STATE_TAKE_OFF + "_" + 1] = iAddFrameID + 3;
         m_dictBossStateFrameID[STATE_FLY_UP + "_" + 1] = iAddFrameID + 4;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_CHARGE_FLIGHT + "_" + 1] = iAddFrameID + 6;
         m_dictBossStateFrameID[STATE_SKILL_FLIGHT_COLLISION + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = iAddFrameID + 8;
         m_dictBossStateFrameID[STATE_SKILL_BURST + "_" + 1] = iAddFrameID + 9;
         m_dictBossStateFrameID[STATE_WATING_NUDITY + "_" + 1] = iAddFrameID + 10;
         m_dictBossStateFrameID[STATE_COMBINATION_OF_ARMOR + "_" + 1] = iAddFrameID + 11;
         m_dictBossStateFrameID[STATE_EXTENDED_BARREL + "_" + 1] = iAddFrameID + 12;
         m_dictBossStateFrameID[STATE_SKILL_LAUNCH_MISSILES + "_" + 1] = iAddFrameID + 13;
         m_dictBossStateFrameID[STATE_BACK_BARREL + "_" + 1] = iAddFrameID + 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = iAddFrameID * 2 + 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = iAddFrameID * 2 + 2;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = this.IsNudity ? 1 : 0;
         if(null != this.m_stHelmetArmorMoveIntruder && Boolean(iIsNudity))
         {
            this.m_stHelmetArmorMoveIntruder.KillMySelf();
         }
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_SKILL_BURST == m_iBossState || STATE_SKILL_FLIGHT_COLLISION == m_iBossState || STATE_SKILL_LAUNCH_MISSILES == m_iBossState;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_BURST:
               this.RealeaseArmor();
               break;
            case STATE_SKILL_FLIGHT_COLLISION:
               if(ClearFieldGridDefenseCard(m_stCurrentFieldGrid))
               {
                  AddBaseEffectToGrid(m_stCurrentFieldGrid,HitCardBombEffect.a_3926());
               }
               break;
            case STATE_SKILL_LAUNCH_MISSILES:
               this.RealeaseMissile();
               break;
            default:
               trace(">>>>>>" + this.toString() + "->CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
      }
      
      private function RealeaseArmor() : void
      {
         var stFieldGrid:a_3491 = GetRandSingleGrid(2,BattleFieldView.a_1011 - 5,1,BattleFieldView.a_1012 - 2,false,-1);
         if(null == stFieldGrid)
         {
            return;
         }
         this.m_stHelmetArmorMoveIntruder = IronManHelmetArmorMoveIntruder.a_3926();
         var iIsInjured:int = 0;
         if(a_1339 < m_iInjuredLife * numHardRate)
         {
            iIsInjured = 1;
         }
         this.m_stHelmetArmorMoveIntruder.ArmorState = iIsInjured;
         this.m_stHelmetArmorMoveIntruder.a_1797(a_4265(),-1);
         AddOutMoveIntruder(this.m_stHelmetArmorMoveIntruder,stFieldGrid);
      }
      
      private function RealeaseMissile() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(2,iMaxXGridNum - 3,1,iMaxYGridNum - 2,true,-1);
         if(null == stTargetFieldGrid)
         {
            return;
         }
         var stIronManMissileShot:IronManMissileShot = IronManMissileShot.a_4344();
         var iXPos:Number = this.x + 10;
         var iYPos:Number = this.y - 100;
         stIronManMissileShot.a_1797(a_4265(),MOVE_SPEED,1000000,iXPos,iYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
         stIronManMissileShot.TargetGrid = stTargetFieldGrid;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stIronManMissileShot,BattleLayerDefine.SHOT_TYPE);
         AddWarningSignEffectToGrid(stTargetFieldGrid,35);
      }
      
      override protected function IsMoving() : Boolean
      {
         return STATE_MOVE == m_iBossState || STATE_SKILL_FLIGHT_COLLISION == m_iBossState || STATE_FLY_DOWN == m_iBossState || STATE_FLY_UP == m_iBossState;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         if(STATE_MOVE == iNextState)
         {
            a_1350 = 12;
         }
         else
         {
            a_1350 = MOVE_SPEED;
         }
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var fFlyPosX:Number = NaN;
         var fFlyPosY:Number = NaN;
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
            case STATE_APPEAR:
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = 0;
               break;
            case STATE_MOVE:
            case STATE_SKILL_FLIGHT_COLLISION:
            case STATE_FLY_DOWN:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               if(STATE_SKILL_FLIGHT_COLLISION == iNextState)
               {
                  m_iLaunchNum = iNextValue;
                  m_iLaunchDelayTick = 1;
                  m_iLaunchIntervalTick = 1;
                  ClearFieldGridDefenseCard(m_stCurrentFieldGrid);
               }
               break;
            case STATE_FLY_UP:
               fFlyPosX = getPosXByXGridNo(m_stCurrentFieldGrid.m_iXGridNo);
               fFlyPosY = getPosYByYGridNo(-OUT_GRID_NUM);
               iNextValue = setMoveToPosition(fFlyPosX,fFlyPosY);
               break;
            case STATE_SKILL_BURST:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 43;
               m_iLaunchIntervalTick = 1;
               break;
            case STATE_SKILL_LAUNCH_MISSILES:
               m_iLaunchNum = SKILL_MISSILE_NUM;
               m_iLaunchDelayTick = 3;
               m_iLaunchIntervalTick = 6;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         a_1465 = this.IsFlyState() ? 3 : 0;
         return true;
      }
      
      private function IsFlyState() : Boolean
      {
         return Boolean(STATE_HIDE == m_iBossState || STATE_FLY_DOWN == m_iBossState || STATE_FLY_UP == m_iBossState || STATE_SKILL_FLIGHT_COLLISION == m_iBossState || STATE_MOVE == m_iBossState || STATE_COMBINATION_OF_ARMOR == m_iBossState);
      }
   }
}


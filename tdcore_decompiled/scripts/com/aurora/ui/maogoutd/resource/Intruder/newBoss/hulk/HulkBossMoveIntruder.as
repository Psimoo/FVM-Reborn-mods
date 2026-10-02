package com.aurora.ui.maogoutd.resource.Intruder.newBoss.hulk
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.FloorCrackEffect;
   import com.aurora.ui.maogoutd.resource.effect.HitGroundEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   import com.aurora.ui.maogoutd.resource.shot.boss.hulk.HulkPunchShot;
   import flash.utils.Dictionary;
   
   public class HulkBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static var m_dictJumpFrame:Dictionary;
      
      private static const STATE_APPEARANCES_MOVE:uint = 6;
      
      private static const STATE_APPEARANCES_WAITING:uint = 7;
      
      private static const STATE_TRANSFIGURATION:uint = 8;
      
      private static const STATE_JUMP_PREPARE:uint = 9;
      
      private static const STATE_JUMP2:uint = 10;
      
      private static const STATE_JUMP4:uint = 11;
      
      private static const STATE_JUMP5:uint = 12;
      
      private static const STATE_JUMP8:uint = 13;
      
      private static const STATE_JUMP_LANDING:uint = 14;
      
      private static const STATE_SKILL_HIT_GROUND:uint = 15;
      
      private static const STATE_CHANGE_BALL:uint = 16;
      
      private static const STATE_SKILL_SCROLL:uint = 17;
      
      private static const STATE_SKILL_CHARGE_BOXING:uint = 18;
      
      private var m_arrBoomDir:Array = [[-1,0],[0,0],[1,0],[0,-1],[0,1]];
      
      public function HulkBossMoveIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = a_3491.a_1080 / 8;
         m_iStartShowGridNo = 3;
         a_1279 = -190;
         a_1467 = a_3491.a_1081 * 2;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HulkBossMoveIntruder) as HulkBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HulkBossMoveIntruderMovie;
      }
      
      override public function get height() : Number
      {
         return 310;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,BattleFieldView.a_1011 + 2,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_APPEARANCES_MOVE,BattleFieldView.a_1011 - 1,m_iStartShowGridNo]);
         m_vStateCache.push([STATE_APPEARANCES_WAITING,5]);
         m_vStateCache.push([STATE_TRANSFIGURATION,61]);
         HavingRestForAwhile(10);
      }
      
      private function CacheJump(iState:uint, iXGridNo:int, iYGridNo:int) : void
      {
         m_vStateCache.push([STATE_JUMP_PREPARE,2]);
         m_vStateCache.push([iState,iXGridNo,iYGridNo]);
         m_vStateCache.push([STATE_JUMP_LANDING,2]);
      }
      
      private function CacheSkillHitGround() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         this.CacheJump(STATE_JUMP4,iMaxXGrid - 3,m_iStartShowGridNo);
         m_vStateCache.push([STATE_SKILL_HIT_GROUND,22]);
         this.CacheJump(STATE_JUMP4,iMaxXGrid,m_iStartShowGridNo);
         HavingRestForAwhile(10);
      }
      
      private function CacheSkillScroll() : void
      {
         var iYGridNo:int = 0;
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         var iMaxYGrid:int = BattleFieldView.a_1012 - 1;
         var arrYGridNo:Array = [];
         arrYGridNo.push(1 + m_stRandomSeed.nextInt(3));
         arrYGridNo.push(iMaxYGrid - 2 + m_stRandomSeed.nextInt(3));
         for(var i:int = 0; i < arrYGridNo.length; i++)
         {
            iYGridNo = int(arrYGridNo[i]);
            this.CacheJump(STATE_JUMP4,iMaxXGrid - 3,iYGridNo);
            m_vStateCache.push([STATE_CHANGE_BALL,6]);
            m_vStateCache.push([STATE_SKILL_SCROLL,0,iYGridNo]);
            HavingRestForAwhile(5);
            this.CacheJump(STATE_JUMP8,iMaxXGrid,m_iStartShowGridNo);
            HavingRestForAwhile(10);
         }
      }
      
      private function CacheSkillChargeBoxing() : void
      {
         var iMaxXGrid:int = BattleFieldView.a_1011 - 1;
         var iMaxYGrid:int = BattleFieldView.a_1012 - 1;
         var iYGridNo:int = 2;
         this.CacheJump(STATE_JUMP2,iMaxXGrid,iYGridNo);
         m_vStateCache.push([STATE_SKILL_CHARGE_BOXING,48]);
         HavingRestForAwhile(5);
         this.CacheJump(STATE_JUMP4,iMaxXGrid,iMaxYGrid);
         m_vStateCache.push([STATE_SKILL_CHARGE_BOXING,48]);
         HavingRestForAwhile(5);
         this.CacheJump(STATE_JUMP4,iMaxXGrid,m_iStartShowGridNo);
         HavingRestForAwhile(10);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillHitGround);
         m_vSkillFunction.push(this.CacheSkillScroll);
         m_vSkillFunction.push(this.CacheSkillChargeBoxing);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEARANCES_MOVE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEARANCES_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_TRANSFIGURATION + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_JUMP_PREPARE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_JUMP2 + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_JUMP4 + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_JUMP5 + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_JUMP8 + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_JUMP_LANDING + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_HIT_GROUND + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_CHANGE_BALL + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_SCROLL + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_CHARGE_BOXING + "_" + 0] = 20;
         var iAddFrameID:int = 20 - 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = iAddFrameID + 4;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = iAddFrameID + 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_APPEARANCES_MOVE + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_APPEARANCES_WAITING + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_TRANSFIGURATION + "_" + 1] = iAddFrameID + 3;
         m_dictBossStateFrameID[STATE_JUMP_PREPARE + "_" + 1] = iAddFrameID + 7;
         m_dictBossStateFrameID[STATE_JUMP2 + "_" + 1] = iAddFrameID + 14;
         m_dictBossStateFrameID[STATE_JUMP4 + "_" + 1] = iAddFrameID + 8;
         m_dictBossStateFrameID[STATE_JUMP5 + "_" + 1] = iAddFrameID + 17;
         m_dictBossStateFrameID[STATE_JUMP8 + "_" + 1] = iAddFrameID + 11;
         m_dictBossStateFrameID[STATE_JUMP_LANDING + "_" + 1] = iAddFrameID + 9;
         m_dictBossStateFrameID[STATE_SKILL_HIT_GROUND + "_" + 1] = iAddFrameID + 19;
         m_dictBossStateFrameID[STATE_CHANGE_BALL + "_" + 1] = iAddFrameID + 5;
         m_dictBossStateFrameID[STATE_SKILL_SCROLL + "_" + 1] = iAddFrameID + 6;
         m_dictBossStateFrameID[STATE_SKILL_CHARGE_BOXING + "_" + 1] = iAddFrameID + 20;
         m_dictBossStateFrameID[STATE_DEAD] = 2 + iAddFrameID * 2 + 1;
         if(null == m_dictJumpFrame)
         {
            m_dictJumpFrame = new Dictionary(true);
            m_dictJumpFrame[STATE_JUMP2] = 4;
            m_dictJumpFrame[STATE_JUMP4] = 5;
            m_dictJumpFrame[STATE_JUMP5] = 6;
            m_dictJumpFrame[STATE_JUMP8] = 8;
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return STATE_SKILL_SCROLL == m_iBossState || STATE_SKILL_CHARGE_BOXING == m_iBossState || STATE_SKILL_HIT_GROUND == m_iBossState;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var stBaseBossShot:BaseBossShot = null;
         var stFieldGrid:a_3491 = null;
         var iXPos:int = 0;
         var iYPos:int = 0;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_CHARGE_BOXING:
               stBaseBossShot = HulkPunchShot.a_4344();
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
               iXPos = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               iYPos = (stFieldGrid.m_iYGridNo + 1) * a_3491.a_1081;
               stBaseBossShot.a_1797(a_4265(),0,0,iXPos,iYPos,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseBossShot,BattleLayerDefine.INTRUDER_BOTTOM_TYPE,stFieldGrid);
               break;
            case STATE_SKILL_HIT_GROUND:
               this.RealeaseHitGroundEffect();
               break;
            case STATE_SKILL_SCROLL:
               ClearFieldGridDefenseCard(m_stCurrentFieldGrid);
               ClearDefenseCardByGridNo(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
               break;
            default:
               trace(">>>>>>" + this.toString() + "->CheckIsLaunchSkill:: 不可能事件！！！ m_iBossState = " + m_iBossState);
               return false;
         }
         return true;
      }
      
      private function RealeaseHitGroundEffect() : void
      {
         var stBattleFieldView:BattleFieldView = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stHitGroundEffect:HitGroundEffect = null;
         stBattleFieldView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         var iCenterXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo - 2;
         var iCenterYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         for(var i:int = 0; i < this.m_arrBoomDir.length; i++)
         {
            iXGridNo = iCenterXGridNo + this.m_arrBoomDir[i][0];
            iYGridNo = iCenterYGridNo + this.m_arrBoomDir[i][1];
            stHitGroundEffect = HitGroundEffect.a_3926();
            stHitGroundEffect.a_1797(!stBattleFieldView.isOwnBattleField);
            stHitGroundEffect.x = (iXGridNo + 0.5) * a_3491.a_1080 - stHitGroundEffect.width * 0.5;
            stHitGroundEffect.y = (iYGridNo + 1) * a_3491.a_1081 - stHitGroundEffect.height;
            stBattleFieldView.AddToBattleView(stHitGroundEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE);
            stHitGroundEffect.play();
            ClearDefenseCardByGridNo(iXGridNo,iYGridNo);
         }
         stBattleFieldView.a_3466();
      }
      
      override protected function IsMoving() : Boolean
      {
         return STATE_MOVE == m_iBossState || STATE_APPEARANCES_MOVE == m_iBossState || STATE_JUMP2 == m_iBossState || STATE_JUMP4 == m_iBossState || STATE_JUMP5 == m_iBossState || STATE_JUMP8 == m_iBossState || STATE_SKILL_SCROLL == m_iBossState;
      }
      
      private function setMoveByFieldGrid(iDestXGridNo:int, iDestYGridNo:int, iMoveTick:int) : void
      {
         var fPosX:Number = getPosXByXGridNo(iDestXGridNo);
         var fPosY:Number = getPosYByYGridNo(iDestYGridNo);
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         if(iMoveTick > 0)
         {
            m_fMoveSpeedY = fDistanceY / iMoveTick;
            m_fMoveSpeedX = fDistanceX / iMoveTick;
            return;
         }
         throw Error(this.toString() + "::setMoveByFieldGrid iMoveTick is 0!!!");
      }
      
      private function setMoveInfo(iXGridNo:int, iYGridNo:int, fMoveSpeed:Number = -0.1234) : int
      {
         var fPosX:Number = getPosXByXGridNo(m_vStateCache[0][1]);
         var fPosY:Number = getPosYByYGridNo(m_vStateCache[0][2]);
         return setMoveToPosition(fPosX,fPosY,fMoveSpeed);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFloorCrackEffect:FloorCrackEffect = null;
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
               iNextValue = 0;
               break;
            case STATE_MOVE:
            case STATE_APPEARANCES_MOVE:
               iNextValue = this.setMoveInfo(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_JUMP2:
            case STATE_JUMP4:
            case STATE_JUMP5:
            case STATE_JUMP8:
               iNextValue = int(m_dictJumpFrame[iNextState]);
               this.setMoveByFieldGrid(m_vStateCache[0][1],m_vStateCache[0][2],iNextValue);
               break;
            case STATE_SKILL_CHARGE_BOXING:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 26;
               m_iLaunchIntervalTick = 4;
               break;
            case STATE_SKILL_HIT_GROUND:
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 8;
               m_iLaunchIntervalTick = 4;
               break;
            case STATE_SKILL_SCROLL:
               m_iLaunchNum = 1000;
               m_iLaunchDelayTick = 1;
               m_iLaunchIntervalTick = 1;
               ClearFieldGridDefenseCard(m_stCurrentFieldGrid);
               iNextValue = this.setMoveInfo(m_vStateCache[0][1],m_vStateCache[0][2],a_3491.a_1080 * 0.5);
               break;
            case STATE_JUMP_LANDING:
               iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
               iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
               stFloorCrackEffect = FloorCrackEffect.a_3926();
               stFloorCrackEffect.a_1797(!m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField);
               stFloorCrackEffect.x = (iXGridNo + 0.5) * a_3491.a_1080 - stFloorCrackEffect.width * 0.5 + 35;
               stFloorCrackEffect.y = (iYGridNo + 0.5) * a_3491.a_1081 - stFloorCrackEffect.height * 0.5 + 40;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFloorCrackEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE);
               stFloorCrackEffect.play();
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         a_1465 = this.IsFlyState() ? 3 : 0;
         return true;
      }
      
      private function IsFlyState() : Boolean
      {
         return Boolean(STATE_HIDE == m_iBossState || STATE_JUMP2 == m_iBossState || STATE_JUMP4 == m_iBossState || STATE_JUMP5 == m_iBossState || STATE_JUMP8 == m_iBossState);
      }
   }
}


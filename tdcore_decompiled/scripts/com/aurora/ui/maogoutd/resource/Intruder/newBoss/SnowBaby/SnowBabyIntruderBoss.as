package com.aurora.ui.maogoutd.resource.Intruder.newBoss.SnowBaby
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class SnowBabyIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_STANDBY:uint = 6;
      
      private static const STATE_MOVE:uint = 7;
      
      private static const STATE_DRILL_OUT:uint = 8;
      
      private static const STATE_DRILL_IN:uint = 9;
      
      private static const STATE_SKILL_SPRINT:uint = 10;
      
      private static const STATE_SKILL_SHAKE:uint = 11;
      
      private static const STATE_SKILL_ROLL:uint = 12;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 13;
      
      private static const STATE_CHG_TOWARD:uint = 14;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_OutArray:Array = new Array(0,2,4,6);
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var tempDefenseArr:Array = new Array(286458240,286458254,286458255,286396464,286396478,286396479);
      
      public function SnowBabyIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 45;
         a_1467 = -65;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SnowBabyIntruderBoss) as SnowBabyIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return SnowBabyIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bFirst = true;
         this.m_bCanBeAttack = true;
         return b;
      }
      
      override public function get width() : Number
      {
         return 100;
      }
      
      override public function get height() : Number
      {
         return 165;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DRILL_OUT + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_DRILL_IN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_SPRINT + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_SHAKE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ROLL + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 7 + 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 7 + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 7 + 2;
         m_dictBossStateFrameID[STATE_DRILL_OUT + "_" + 1] = 7 + 3;
         m_dictBossStateFrameID[STATE_DRILL_IN + "_" + 1] = 7 + 4;
         m_dictBossStateFrameID[STATE_SKILL_SPRINT + "_" + 1] = 7 + 5;
         m_dictBossStateFrameID[STATE_SKILL_SHAKE + "_" + 1] = 7 + 6;
         m_dictBossStateFrameID[STATE_SKILL_ROLL + "_" + 1] = 7 + 7;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = 7 + 1;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 15;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,8,m_stCurrentFieldGrid.m_iYGridNo,0]);
         m_vStateCache.push([STATE_DRILL_OUT,10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.sprintSkill);
         m_vSkillFunction.push(this.shakeSkill);
         m_vSkillFunction.push(this.rollSkill);
      }
      
      private function sprintSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_SPRINT,20]);
         m_vStateCache.push([STATE_APPEAR,0,m_stCurrentFieldGrid.m_iYGridNo,-4]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_DRILL_IN,12]);
         m_vStateCache.push([STATE_MOVE,4,this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)],-6]);
         m_vStateCache.push([STATE_DRILL_OUT,10]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
      }
      
      private function shakeSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_SHAKE,15]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      private function rollSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_ROLL,18]);
         m_vStateCache.push([STATE_APPEAR,0,m_stCurrentFieldGrid.m_iYGridNo,-5]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_DRILL_IN,12]);
         m_vStateCache.push([STATE_MOVE,8,m_stRandomSeed.nextInt(7),0]);
         m_vStateCache.push([STATE_DRILL_OUT,10]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
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
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_DRILL_OUT:
               if(263 < x && x < 265)
               {
                  this.x = 264;
               }
               this.SetIsCannotSee(false);
               break;
            case STATE_DRILL_IN:
               this.SetIsCannotSee(true);
               break;
            case STATE_MOVE:
               this.visible = true;
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
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
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.visible = true;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_MOVE != m_iBossState && a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_DRILL_OUT:
               this.a_3502(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_SHAKE:
               if(a_1273 == 75 || a_1273 == 171)
               {
                  this.FrozenFieldGridDefense(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_SPRINT:
               if(a_1273 == 42 || a_1273 == 138)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 0) : int(m_stCurrentFieldGrid.m_iXGridNo - 0);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 47 || a_1273 == 143)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 1) : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 48 || a_1273 == 144)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 2) : int(m_stCurrentFieldGrid.m_iXGridNo - 2);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 49 || a_1273 == 145)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 3) : int(m_stCurrentFieldGrid.m_iXGridNo - 3);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 57 || a_1273 == 153)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 8) : int(m_stCurrentFieldGrid.m_iXGridNo - 8);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_ROLL:
               if(a_1273 == 84 || a_1273 == 180)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 0) : int(m_stCurrentFieldGrid.m_iXGridNo - 0);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 85 || a_1273 == 181)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 1) : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 87 || a_1273 == 183)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 2) : int(m_stCurrentFieldGrid.m_iXGridNo - 2);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 89 || a_1273 == 184)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 3) : int(m_stCurrentFieldGrid.m_iXGridNo - 3);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 91 || a_1273 == 186)
               {
                  m_iXGridNo = a_1283 ? int(m_stCurrentFieldGrid.m_iXGridNo + 4) : int(m_stCurrentFieldGrid.m_iXGridNo - 4);
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
         }
         return true;
      }
      
      protected function FrozenFieldGridDefense(a_1334:a_3491) : Boolean
      {
         var xIndex:int = 0;
         if(a_1334 == null)
         {
            return false;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.FrozenCard(stFieldGridVector[yIndex][xIndex]);
            }
         }
         return true;
      }
      
      private function FrozenCard(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBaseToolDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseToolDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stProtector)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stProtector.a_3512()) == -1)
            {
               stFieldGrid.m_stProtector.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stAttackFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stAttackFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBoomDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stBoomDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stFlowerDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stFlowerDefense.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stBaseAuxiliaryFighter.a_3512()) == -1)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen = true;
            }
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            if(this.tempDefenseArr.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stTrayDefense.m_isShowFrozen = true;
            }
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_SPRINT || m_iBossState == STATE_SKILL_SHAKE || m_iBossState == STATE_SKILL_ROLL);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
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
         var iSkillNum:int = 0;
         var i:int = 0;
         if(0 == m_vSkillID.length)
         {
            iSkillNum = m_iSkillNum.Value;
            for(i = 0; i < iSkillNum; i++)
            {
               m_vSkillID.push(i);
            }
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
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,2,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}


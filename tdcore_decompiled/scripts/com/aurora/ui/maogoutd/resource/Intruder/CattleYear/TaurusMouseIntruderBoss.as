package com.aurora.ui.maogoutd.resource.Intruder.CattleYear
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.FrostGiants.IceEarthHole;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.utils.Dictionary;
   
   public class TaurusMouseIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 30;
      
      private static const STATE_SKILL_BORN:uint = 6;
      
      private static const STATE_FLASH_OUT:uint = 7;
      
      private static const STATE_CHG_TOWARD:uint = 8;
      
      private static const STATE_SKILL_ONE_ONE:uint = 9;
      
      private static const STATE_SKILL_ONE_TWO:uint = 10;
      
      private static const STATE_SKILL_ONE_THREE:uint = 11;
      
      private static const STATE_SKILL_TWO_ONE:uint = 12;
      
      private static const STATE_SKILL_TWO_TWO:uint = 13;
      
      private static const STATE_SKILL_TWO_THREE:uint = 14;
      
      private static const STATE_SKILL_THREE:uint = 15;
      
      private static const STATE_CHG_TOWARD_SKILL_BORN:uint = 16;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_OutArrayFirst:Array = new Array([0,0],[0,1],[1,0],[1,1],[2,0],[2,1]);
      
      private var m_OutArraySecond:Array = new Array([6,1],[6,2],[7,1],[7,2],[8,1],[8,2]);
      
      private var m_OutArrayThird:Array = new Array([0,4],[0,5],[1,4],[1,5],[2,4],[2,5]);
      
      private var m_OutArrayFourTh:Array = new Array([6,5],[6,6],[7,5],[7,6],[8,5],[8,6]);
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      public function TaurusMouseIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width + 2;
         a_1467 = -75;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TaurusMouseIntruderBoss) as TaurusMouseIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaurusMouseIntruderBossMovie;
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
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_CHG_TOWARD_SKILL_BORN + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE_ONE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_TWO + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_THREE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_ONE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_TWO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_THREE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 21;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 11 + 0;
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 1] = 11 + 0;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = 11 + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 11 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 11 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD_SKILL_BORN + "_" + 1] = 11 + 2;
         m_dictBossStateFrameID[STATE_SKILL_ONE_ONE + "_" + 1] = 11 + 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE_TWO + "_" + 1] = 11 + 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_THREE + "_" + 1] = 11 + 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO_ONE + "_" + 1] = 11 + 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_TWO + "_" + 1] = 11 + 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_THREE + "_" + 1] = 11 + 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 11 + 9;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 21;
      }
      
      override protected function InitSkillCache() : void
      {
         a_1350;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_BORN,8,0,0]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.JumpSkill);
         m_vSkillFunction.push(this.RunSkill);
         m_vSkillFunction.push(this.absorbFlameSkill);
      }
      
      private function JumpSkill() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.push([STATE_SKILL_ONE_ONE,3]);
         do
         {
            m_iXGridNo = int(this.m_OutArrayFirst[m_stRandomSeed.nextInt(this.m_OutArrayFirst.length)][0]);
            m_iYGridNo = int(this.m_OutArrayFirst[m_stRandomSeed.nextInt(this.m_OutArrayFirst.length)][1]);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_SKILL_ONE_TWO,3,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_ONE_THREE,12]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,5]);
         m_vStateCache.push([STATE_SKILL_ONE_ONE,3]);
         do
         {
            m_iXGridNo = int(this.m_OutArraySecond[m_stRandomSeed.nextInt(this.m_OutArraySecond.length)][0]);
            m_iYGridNo = int(this.m_OutArraySecond[m_stRandomSeed.nextInt(this.m_OutArraySecond.length)][1]);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_SKILL_ONE_TWO,3,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_ONE_THREE,12]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,5]);
         m_vStateCache.push([STATE_SKILL_ONE_ONE,3]);
         do
         {
            m_iXGridNo = int(this.m_OutArrayThird[m_stRandomSeed.nextInt(this.m_OutArrayThird.length)][0]);
            m_iYGridNo = int(this.m_OutArrayThird[m_stRandomSeed.nextInt(this.m_OutArrayThird.length)][1]);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_SKILL_ONE_TWO,3,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_ONE_THREE,12]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,5]);
         m_vStateCache.push([STATE_SKILL_ONE_ONE,3]);
         do
         {
            m_iXGridNo = int(this.m_OutArrayFourTh[m_stRandomSeed.nextInt(this.m_OutArrayFourTh.length)][0]);
            m_iYGridNo = int(this.m_OutArrayFourTh[m_stRandomSeed.nextInt(this.m_OutArrayFourTh.length)][1]);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_SKILL_ONE_TWO,3,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_ONE_THREE,12]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,5]);
         m_vStateCache.push([STATE_SKILL_ONE_ONE,3]);
         m_vStateCache.push([STATE_SKILL_ONE_TWO,3,0,6]);
         m_vStateCache.push([STATE_SKILL_ONE_THREE,12]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT,5]);
         m_vStateCache.push([STATE_CHG_TOWARD_SKILL_BORN,0]);
         m_iYGridNo = int(m_stRandomSeed.nextInt(7));
         m_vStateCache.push([STATE_SKILL_BORN,0,m_iYGridNo,0]);
      }
      
      private function RunSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_TWO_ONE,20]);
         m_vStateCache.push([STATE_SKILL_TWO_TWO,8,m_stCurrentFieldGrid.m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_TWO_THREE,3]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
         m_vStateCache.push([STATE_SKILL_ONE_ONE,3]);
         m_vStateCache.push([STATE_SKILL_ONE_TWO,3,0,3]);
         m_vStateCache.push([STATE_SKILL_ONE_THREE,12]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
      }
      
      private function absorbFlameSkill() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE,50]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
         m_vStateCache.push([STATE_SKILL_ONE_ONE,3]);
         m_vStateCache.push([STATE_SKILL_ONE_TWO,3,8,0]);
         m_vStateCache.push([STATE_SKILL_ONE_THREE,12]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var MPosX:Number = NaN;
         var MPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         this.UpdateSeeByFighterByState(iNextState);
         visible = true;
         switch(iNextState)
         {
            case STATE_SKILL_BORN:
               iNextValue = 5;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_ONE_TWO:
               this.a_1581 = m_vStateCache[0][1];
               this.a_4349(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_TWO_TWO:
               MPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               MPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(MPosX,MPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               break;
            case STATE_CHG_TOWARD_SKILL_BORN:
               a_1283 = !a_1283;
               visible = false;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function UpdateSeeByFighterByState(iNextState:int) : void
      {
         if(iNextState == STATE_SKILL_ONE_TWO || iNextState == STATE_SKILL_TWO_TWO || iNextState == STATE_SKILL_BORN)
         {
            SetCannotSeeByFighter(true);
         }
         else
         {
            SetCannotSeeByFighter(false);
         }
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
      
      protected function a_4349(m_iXGridNo:int, m_iYGridNo:int) : Boolean
      {
         var numDistanceX:Number = Math.abs(getPosXByXGridNo(m_iXGridNo) - x);
         var numDistanceY:Number = Math.abs(getPosYByYGridNo(m_iYGridNo) - y);
         this.m_numXSpeed = (getPosXByXGridNo(m_iXGridNo) - x) / this.a_1581;
         this.m_numYSpeed = (getPosYByYGridNo(m_iYGridNo) - y) / this.a_1581;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         if(this.a_1581 > 0 && m_iBossState == STATE_SKILL_ONE_TWO)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
            if(bIsCanChangeToFieldGrid)
            {
               trace("飞行到 iXGridNo:" + iXGridNo + ">>>iYGridNo:" + iYGridNo);
            }
         }
         super.a_4216(iCurrentTime);
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
         if(bIsCanChangeToFieldGrid)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
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
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var stBaseEnergy:a_4157 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame>>>>" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_BORN:
               if(a_1273 == 3 || a_1273 == 144)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE_THREE:
               if(a_1273 == 46 || a_1273 == 187)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_TWO_TWO:
               break;
            case STATE_SKILL_THREE:
               if(a_1273 >= 100 && a_1273 <= 134 || a_1273 >= 241 && a_1273 <= 275)
               {
                  if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector))
                  {
                     for each(stBaseEnergy in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector.slice())
                     {
                        stBaseEnergy.a_4159(x,y);
                     }
                  }
               }
         }
         return true;
      }
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         for(var i:int = 0; i < 5; i++)
         {
            do
            {
               m_iXGridNo = m_stRandomSeed.nextInt(4) + 1;
               m_iYGridNo = int(m_stRandomSeed.nextInt(7));
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_stBaseLander != null);
            this.randomField[i] = stTargetFieldGrid;
         }
      }
      
      protected function ClearFrozenFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         this.m_isAddHole = stFieldGrid.m_isShowFrozen;
         if(null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,1,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense && stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         if(this.m_isAddHole)
         {
            this.addEarthHole(stFieldGrid);
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_BORN || m_iBossState == STATE_SKILL_ONE_ONE || m_iBossState == STATE_SKILL_ONE_TWO || m_iBossState == STATE_SKILL_ONE_THREE || m_iBossState == STATE_SKILL_TWO_ONE || m_iBossState == STATE_SKILL_TWO_TWO || m_iBossState == STATE_SKILL_TWO_THREE || m_iBossState == STATE_SKILL_THREE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_SKILL_TWO_TWO;
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
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stIceEarthHole:IceEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         var m_iOldFieldGridType:int = stFieldGrid.m_iFieldGridType;
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         stIceEarthHole = IceEarthHole.a_3926();
         stIceEarthHole.m_stCurrentFieldGrid = m_stCurrentFieldGrid;
         stIceEarthHole.a_1797(a_1283);
         stIceEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
         stIceEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stIceEarthHole.width);
         stIceEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stIceEarthHole.height) - 15;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stIceEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stIceEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stIceEarthHole.play();
         stFieldGrid.m_stMouseEarthHole = stIceEarthHole;
         if(a_1283)
         {
            stIceEarthHole.x = BattleFieldView.a_1013 - stIceEarthHole.x;
         }
      }
      
      protected function ClearPigBarrierField(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
   }
}


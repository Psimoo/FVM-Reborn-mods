package com.aurora.ui.maogoutd.resource.Intruder.Desert.HermitCrabBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class HermitCrabIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_SKILL_BORN:uint = 6;
      
      private static const STATE_DRILL_OUT:uint = 7;
      
      private static const STATE_DRILL_IN:uint = 8;
      
      private static const STATE_SKILL_One:uint = 9;
      
      private static const STATE_SKILL_Two:uint = 10;
      
      private static const STATE_SKILL_Three:uint = 11;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 12;
      
      private static const STATE_CHG_TOWARD:uint = 13;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var m_iYGridArray:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      public function HermitCrabIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 87;
         a_1467 = -170;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HermitCrabIntruderBoss) as HermitCrabIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return HermitCrabIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bCanBeAttack = true;
         a_1339 = 50000;
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
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_DRILL_OUT + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_DRILL_IN + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 6 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 6 + 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 6 + 4;
         m_dictBossStateFrameID[STATE_DRILL_OUT + "_" + 1] = 6 + 5;
         m_dictBossStateFrameID[STATE_DRILL_IN + "_" + 1] = 6 + 3;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 1] = 6 + 6;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 1] = 6 + 7;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 1] = 6 + 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 14;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_BORN,8,m_stRandomSeed.nextInt(2) + 2,0]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_One,28]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_DRILL_IN,17]);
         m_vStateCache.push([STATE_MOVE,4,3,0]);
         m_vStateCache.push([STATE_DRILL_OUT,25]);
         m_vStateCache.push([STATE_SKILL_Two,29]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_DRILL_IN,17]);
         m_vStateCache.push([STATE_MOVE,8,m_stRandomSeed.nextInt(2) + 2,0]);
         m_vStateCache.push([STATE_DRILL_OUT,25]);
         m_vStateCache.push([STATE_SKILL_One,28]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_DRILL_IN,17]);
         m_vStateCache.push([STATE_MOVE,4,3,0]);
         m_vStateCache.push([STATE_DRILL_OUT,25]);
         m_vStateCache.push([STATE_SKILL_Two,29]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,0,m_stRandomSeed.nextInt(2) + 2,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_DRILL_OUT,25]);
         m_vStateCache.push([STATE_SKILL_One,28]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_DRILL_IN,17]);
         m_vStateCache.push([STATE_MOVE,8,m_stRandomSeed.nextInt(2) + 2,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_DRILL_OUT,25]);
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
            case STATE_SKILL_BORN:
               iNextValue = 15;
               this.SetIsCannotSee(true);
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_DRILL_OUT:
               this.SetIsCannotSee(true);
               break;
            case STATE_DRILL_IN:
               this.SetIsCannotSee(true);
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(true);
               this.visible = true;
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               this.SetIsCannotSee(false);
               a_1283 = !a_1283;
               break;
            default:
               this.SetIsCannotSee(false);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
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
         if(this.a_1581 > 0 && this.m_isJumping)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
         }
         super.a_4216(iCurrentTime);
         return true;
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
         var i:int = 0;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         trace("m_iCurrentFrame::" + a_1273);
         switch(m_iBossState)
         {
            case STATE_DRILL_OUT:
               this.a_3502(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_One:
               if(a_1273 == 103 || a_1273 == 223)
               {
                  this.randomFieldGrid();
                  for(i = 0; i < this.randomField.length; i++)
                  {
                     stStartFieldGrid = this.randomField[i];
                     stBaseMoveIntruder = HermitCrabStoneIntruder.a_3926();
                     stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
                     stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                     stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
                  }
               }
               break;
            case STATE_SKILL_Two:
               if(a_1273 == 131 || a_1273 == 251)
               {
                  xStart = m_stCurrentFieldGrid.m_iXGridNo - 1;
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1;
                  yStart = m_stCurrentFieldGrid.m_iYGridNo - 1;
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        this.a_3502(stTargetFieldGrid);
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
         while(this.m_iYGridArray.length > 0)
         {
            this.m_iYGridArray.pop();
         }
         for(var i:int = 0; i < 3; i++)
         {
            do
            {
               m_iXGridNo = m_stRandomSeed.nextInt(4) + 1;
               do
               {
                  m_iYGridNo = m_stRandomSeed.nextInt(4) + 1;
               }
               while(this.m_iYGridArray.indexOf(m_iYGridNo) != -1);
               trace("1");
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_stBaseLander != null);
            this.m_iYGridArray.push(m_iYGridNo);
            this.randomField.push(stTargetFieldGrid);
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
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_One || m_iBossState == STATE_SKILL_Two || m_iBossState == STATE_SKILL_Three);
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


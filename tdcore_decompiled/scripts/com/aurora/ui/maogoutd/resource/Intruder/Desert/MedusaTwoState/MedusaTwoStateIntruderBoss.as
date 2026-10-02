package com.aurora.ui.maogoutd.resource.Intruder.Desert.MedusaTwoState
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   
   public class MedusaTwoStateIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_SKILL_One:uint = 6;
      
      private static const STATE_SKILL_Two:uint = 7;
      
      private static const STATE_SKILL_Three:uint = 8;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 9;
      
      private static const STATE_CHG_TOWARD:uint = 10;
      
      private static const STATE_SKILL_ThreeStart:uint = 11;
      
      private static const STATE_SKILL_ThreeEnd:uint = 12;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_OutArray:Array = new Array([8,1],[8,3],[8,5]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var SkillTimes:int;
      
      public function MedusaTwoStateIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 55;
         a_1467 = -75;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MedusaTwoStateIntruderBoss) as MedusaTwoStateIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return MedusaTwoStateIntruderBossMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.ms_iShihuaTime = 5;
         }
         super.a_3940();
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1271 = true;
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
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ThreeStart + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ThreeEnd + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 7 + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 7 + 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 7 + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 7 + 2;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 1] = 7 + 3;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 1] = 7 + 4;
         m_dictBossStateFrameID[STATE_SKILL_ThreeStart + "_" + 1] = 7 + 5;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 1] = 7 + 6;
         m_dictBossStateFrameID[STATE_SKILL_ThreeEnd + "_" + 1] = 7 + 7;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 15;
      }
      
      override protected function InitSkillCache() : void
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.ms_iShihuaTime = 8;
         }
         this.SetIsCannotSee(false);
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,8,3,60]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_MOVE,8,this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][1],0]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillOne() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_One,17]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_iYGridNo = m_stRandomSeed.nextInt(6) + 1;
         m_vStateCache.push([STATE_MOVE,-1,m_iYGridNo,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_Two,19]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      private function SkillThree() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,8,this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][1],0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_One,17]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_iYGridNo = m_stRandomSeed.nextInt(3) + 2;
         m_vStateCache.push([STATE_MOVE,6,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_ThreeStart,6]);
         m_vStateCache.push([STATE_SKILL_Three,12 * 10 - 5]);
         m_vStateCache.push([STATE_SKILL_ThreeEnd,4]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_MOVE,this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][0],this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][1],0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
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
            case STATE_MOVE:
               this.visible = true;
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               break;
            case STATE_SKILL_Three:
               this.SkillTimes = 0;
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
         if(iXGridNo == 8 && (iYGridNo == 1 || iYGridNo == 3 || iYGridNo == 5))
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         else if(iXGridNo == 0 && (iYGridNo == 1 || iYGridNo == 5))
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         else if(iXGridNo == 6 && iYGridNo == 3)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_SKILL_One:
               if(a_1273 == 35 || a_1273 == 132)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_Two:
               if(a_1273 == 55 || a_1273 == 152)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_ThreeStart:
            case STATE_SKILL_ThreeEnd:
               break;
            case STATE_SKILL_Three:
               if(a_1273 == 83 || a_1273 == 179)
               {
                  if(this.SkillTimes < 5)
                  {
                     this.ActionSkillThree();
                     ++this.SkillTimes;
                  }
               }
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
      
      private function ActionSkillOne() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var m_iXGridNo:int = getXGridNoByPosX();
         var m_iYGridNo:int = getYGridNoByPosY();
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo - 1);
         if(stStartFieldGrid)
         {
            stLastWaitShot = DisruptArrowShot.a_4344();
            stLastWaitShot.a_1797(a_4265(),-10,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 0,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         if(stStartFieldGrid)
         {
            stLastWaitShot = DisruptArrowShot.a_4344();
            stLastWaitShot.a_1797(a_4265(),-10,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 0,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo + 1);
         if(stStartFieldGrid)
         {
            stLastWaitShot = DisruptArrowShot.a_4344();
            stLastWaitShot.a_1797(a_4265(),-10,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 10,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
      
      private function ActionSkillTwo() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 2;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.ShihuaCard(stTargetFieldGrid);
            }
         }
      }
      
      private function ActionSkillThree() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = m_stCurrentFieldGrid.m_iXGridNo - 2;
         var xEnd:int = m_stCurrentFieldGrid.m_iXGridNo + 2;
         var yStart:int = m_stCurrentFieldGrid.m_iYGridNo - 2;
         var yEnd:int = m_stCurrentFieldGrid.m_iYGridNo + 2;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.SputterHurtDefense(stTargetFieldGrid,50);
            }
         }
      }
      
      private function ShihuaCard(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_isShihua = true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_isShihua = true;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_isShihua = true;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_isShihua = true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_isShihua = true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_isShihua = true;
         }
         stFieldGrid.SetNewSlotShihuaBoth(true);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_isShihua = true;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function SputterHurtDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.a_3969(value);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.a_3969(value);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,value,-1);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(value);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.a_3969(value);
         }
         return true;
      }
   }
}


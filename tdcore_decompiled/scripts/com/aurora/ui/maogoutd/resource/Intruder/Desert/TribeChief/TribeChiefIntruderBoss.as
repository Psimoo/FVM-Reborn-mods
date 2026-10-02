package com.aurora.ui.maogoutd.resource.Intruder.Desert.TribeChief
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class TribeChiefIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 10;
      
      private static const STATE_SKILL_OneStart:uint = 6;
      
      private static const STATE_SKILL_OneMove:uint = 7;
      
      private static const STATE_SKILL_OneStop:uint = 8;
      
      private static const STATE_SKILL_TWOUP:uint = 9;
      
      private static const STATE_SKILL_TWODOWN:uint = 10;
      
      private static const STATE_SKILL_Three:uint = 11;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 12;
      
      private static const STATE_CHG_TOWARD:uint = 13;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_OutArray:Array = new Array([8,3],[8,6]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var clearField:a_3491;
      
      public function TribeChiefIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 25 - 66 + 6;
         a_1467 = -105 - 15;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TribeChiefIntruderBoss) as TribeChiefIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return TribeChiefIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bCanBeAttack = true;
         a_1339 = 60000;
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
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SKILL_OneStart + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_OneMove + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_OneStop + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_TWOUP + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWODOWN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 8 + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 8 + 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 8 + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 8 + 2;
         m_dictBossStateFrameID[STATE_SKILL_OneStart + "_" + 1] = 8 + 3;
         m_dictBossStateFrameID[STATE_SKILL_OneMove + "_" + 1] = 8 + 4;
         m_dictBossStateFrameID[STATE_SKILL_OneStop + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_SKILL_TWOUP + "_" + 1] = 8 + 6;
         m_dictBossStateFrameID[STATE_SKILL_TWODOWN + "_" + 1] = 8 + 7;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 1] = 8 + 8;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 15;
      }
      
      override protected function InitSkillCache() : void
      {
         this.SetIsCannotSee(false);
         m_vStateCache.length = 0;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(11) > 5 ? 0 : 1;
         m_vStateCache.push([STATE_APPEAR,8,this.m_OutArray[m_iYGridNo][1],70]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_OneStart,10]);
         m_vStateCache.push([STATE_SKILL_OneMove,-1,m_stCurrentFieldGrid.m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_OneStop,13]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         var m_iYGridNo:int = m_stRandomSeed.nextInt(11) > 5 ? 1 : 4;
         m_vStateCache.push([STATE_MOVE,-1,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_OneStart,10]);
         m_vStateCache.push([STATE_SKILL_OneMove,8,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_OneStop,13]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(11) > 5 ? 2 : 4;
         m_vStateCache.push([STATE_MOVE,8,m_iYGridNo,0]);
         if(m_iYGridNo == 2)
         {
            m_vStateCache.push([STATE_SKILL_TWOUP,25]);
         }
         else
         {
            m_vStateCache.push([STATE_SKILL_TWODOWN,25]);
         }
         m_vStateCache.push([STATE_WAITING,2 * 20]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,8,m_stRandomSeed.nextInt(7),0]);
         m_vStateCache.push([STATE_SKILL_Three,23]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         var m_iYGridNo:int = m_stRandomSeed.nextInt(11) > 5 ? 0 : 1;
         m_vStateCache.push([STATE_MOVE,8,this.m_OutArray[m_iYGridNo][1],0]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var MPosX:Number = NaN;
         var MPosY:Number = NaN;
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
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_OneMove:
               MPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               MPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(MPosX,MPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
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
         if(iNextState == STATE_SKILL_OneMove)
         {
            a_1350 = 2 * MOVE_SPEED;
         }
         else
         {
            a_1350 = MOVE_SPEED;
         }
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING && m_iBossState != STATE_SKILL_OneMove)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_OneStart:
               this.clearField = null;
               break;
            case STATE_SKILL_OneMove:
               this.ActionSkillOne();
               break;
            case STATE_SKILL_TWOUP:
               if(a_1273 == 64 || a_1273 == 170)
               {
                  m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 5;
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - 1;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.ActionSkillTwo(stTargetFieldGrid);
               }
               else if(a_1273 == 79 || a_1273 == 205)
               {
                  m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 5;
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - 1;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  if(10 == stTargetFieldGrid.m_iFieldGridType)
                  {
                     stTargetFieldGrid.m_iFieldGridType = 0;
                  }
               }
               break;
            case STATE_SKILL_TWODOWN:
               if(a_1273 == 90 || a_1273 == 196)
               {
                  m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 5;
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 1;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  this.ActionSkillTwo(stTargetFieldGrid);
               }
               else if(a_1273 == 105 || a_1273 == 231)
               {
                  m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 5;
                  m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 1;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  if(10 == stTargetFieldGrid.m_iFieldGridType)
                  {
                     stTargetFieldGrid.m_iFieldGridType = 0;
                  }
               }
               break;
            case STATE_SKILL_Three:
               if(a_1273 == 119 || a_1273 == 245)
               {
                  xStart = 6;
                  xEnd = 8;
                  yStart = 0;
                  yEnd = 6;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        this.ActionSkillThree(stTargetFieldGrid);
                     }
                  }
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_OneMove || m_iBossState == STATE_SKILL_Three);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_OneMove;
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
         var stTargetFieldGrid:a_3491 = null;
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var TopFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo - 1);
         if(stTargetFieldGrid != null && this.clearField != stTargetFieldGrid)
         {
            this.clearField = stTargetFieldGrid;
            this.a_3502(stTargetFieldGrid);
            if(TopFieldGrid != null)
            {
               this.a_3502(TopFieldGrid);
            }
         }
      }
      
      private function ActionSkillTwo(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         if(stFieldGrid == null)
         {
            return;
         }
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 10;
         }
         var xStart:int = stFieldGrid.m_iXGridNo - 1;
         var xEnd:int = stFieldGrid.m_iXGridNo + 1;
         var yStart:int = stFieldGrid.m_iYGridNo - 1;
         var yEnd:int = stFieldGrid.m_iYGridNo + 1;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.a_3502(stTargetFieldGrid);
            }
         }
      }
      
      private function ActionSkillThree(stTempFieldGrid:a_3491) : void
      {
         var stSleepingEffect:DizzinessEffect = null;
         this.CureFieldGridDefense(stTempFieldGrid,50);
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            stTempFieldGrid.m_stAttackFighter.a_3958(200);
            stSleepingEffect = DizzinessEffect.a_3926();
            stSleepingEffect.a_1797(false);
            stSleepingEffect.a_3958 = 10;
            stSleepingEffect.x = stTempFieldGrid.m_stAttackFighter.x + stTempFieldGrid.m_stAttackFighter.width * 0.4 - 30;
            stSleepingEffect.y = stTempFieldGrid.m_stAttackFighter.y - 10;
            stTempFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSleepingEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
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
      
      protected function CureFieldGridDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
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


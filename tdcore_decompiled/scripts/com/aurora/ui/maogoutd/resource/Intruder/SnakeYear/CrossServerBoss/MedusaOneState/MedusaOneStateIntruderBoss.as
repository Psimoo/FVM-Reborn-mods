package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerBoss.MedusaOneState
{
   import com.aurora.protocol.game.maogoutd.CVanishEnemy;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class MedusaOneStateIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_SKILL_One:uint = 6;
      
      private static const STATE_SKILL_Two:uint = 7;
      
      private static const STATE_SKILL_Three:uint = 8;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 9;
      
      private static const STATE_CHG_TOWARD:uint = 10;
      
      private static const STATE_SKILL_Two2:uint = 11;
      
      private static const STATE_DEAD2:uint = 12;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var m_iTargetNoY:int = -1;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function MedusaOneStateIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 25;
         a_1467 = -75;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MedusaOneStateIntruderBoss) as MedusaOneStateIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return MedusaOneStateIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bCanBeAttack = true;
         this.m_bHasHandleDie = false;
         return b;
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
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
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_Two2 + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_DEAD2 + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 5 + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 5 + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 1] = 5 + 3;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 1] = 5 + 4;
         m_dictBossStateFrameID[STATE_SKILL_Two2 + "_" + 1] = 5 + 4;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 1] = 5 + 5;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_DEAD2 + "_" + 1] = 11;
      }
      
      override protected function InitSkillCache() : void
      {
         this.SetIsCannotSee(false);
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,8,3,60]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         m_vStateCache.push([STATE_MOVE,8,m_stRandomSeed.nextInt(7),0]);
      }
      
      private function HandleDie() : void
      {
         var stEnemyVanish:CVanishEnemy = null;
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         if(m_stCurrentFieldGrid)
         {
            stEnemyVanish = new CVanishEnemy();
            stEnemyVanish.m_iEnemyID = a_1459;
            stEnemyVanish.m_iEnemyTypeID = m_stMoveIntruderTypeID - 8388608;
            stEnemyVanish.m_byYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
            stEnemyVanish.m_byXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            a_1088.a_2061(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_byTeamNo,[stEnemyVanish]);
         }
         m_bPostEnemy = false;
         m_vStateCache.push([STATE_SKILL_Two2,19]);
         m_vStateCache.push([STATE_DEAD2,11]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_One,17]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         this.m_iTargetNoY = m_stRandomSeed.nextInt(11) >= 5 ? 1 : 5;
         m_vStateCache.push([STATE_MOVE,-1,this.m_iTargetNoY,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_Two,19]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         m_vStateCache.push([STATE_MOVE,6,3,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_Three,53]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_MOVE,8,m_stRandomSeed.nextInt(7),0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               a_3940();
               return false;
            }
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
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            InitState();
            a_1460 = true;
         }
         if(this.m_bHasHandleDie == false && a_1339 <= 0)
         {
            this.HandleDie();
            return false;
         }
         if(m_iRestTick > 0)
         {
            nextFrame();
            if(this.IsMoving())
            {
               this.MoveMySelf();
            }
            this.CheckIsCanLaunchSkill(iCurrentTime);
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
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
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_One:
               if(a_1273 == 32 || a_1273 == 147)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_Two:
               if(a_1273 == 55 || a_1273 == 169)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_Two2:
               if(a_1273 == 55 || a_1273 == 169)
               {
                  this.ActionSkillTwo2();
               }
               break;
            case STATE_SKILL_Three:
               if(a_1273 == 83 || a_1273 == 198)
               {
                  xStart = 5;
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
         var stTargetFieldGrid:a_3491 = null;
         for(var xIndex:int = 4; xIndex <= 8; xIndex++)
         {
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,m_stCurrentFieldGrid.m_iYGridNo);
            this.a_3502(stTargetFieldGrid);
         }
      }
      
      private function ActionSkillTwo() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var yStart:int = this.m_iTargetNoY - 1;
         var yEnd:int = this.m_iTargetNoY + 1;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = 0; xIndex <= 3; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.ShihuaCard(stTargetFieldGrid);
            }
         }
      }
      
      private function ActionSkillTwo2() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         for(var yIndex:int = 0; yIndex <= 6; yIndex++)
         {
            for(xIndex = 0; xIndex <= 8; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.ShihuaCard(stTargetFieldGrid);
            }
         }
      }
      
      private function ActionSkillThree(stTempFieldGrid:a_3491) : void
      {
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            stTempFieldGrid.m_stAttackFighter.SleepTime2(20 * 20);
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
         stFieldGrid.SetNewSlotShihuaBoth(true);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_isShihua = true;
         }
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


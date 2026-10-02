package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.boss.RockKing
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.FlyingFire.BurnBuffShot;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public class RockKingIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (1 * 20);
      
      private static const STATE_BORN_MOVE:uint = 6;
      
      private static const STATE_BORN_MOVE_LOOP:uint = 7;
      
      private static const STATE_BORN_MOVE_OVER:uint = 8;
      
      private static const STATE_SKILL_JAZZKISS:uint = 9;
      
      private static const STATE_SKILL_ROCKSPIRIT:uint = 10;
      
      private static const STATE_SKILL_MOONWALK_ONE:uint = 11;
      
      private static const STATE_SKILL_MOONWALK_TWO:uint = 12;
      
      private static const STATE_SKILL_MOONWALK_THREE:uint = 13;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 14;
      
      private static const STATE_CHG_TOWARD:uint = 15;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_OutArray:Array = new Array([1,1],[1,3],[1,5],[4,1],[4,3],[4,5]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var m_index:int;
      
      private var randomField:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      public function RockKingIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 5;
         m_iYDisplayCenterPos = 28;
         a_1467 = -65;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RockKingIntruderBoss) as RockKingIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return RockKingIntruderBossMovie;
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
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_BORN_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_BORN_MOVE_LOOP + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_BORN_MOVE_OVER + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_JAZZKISS + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ROCKSPIRIT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_MOONWALK_ONE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_MOONWALK_TWO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_MOONWALK_THREE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 8 + 1;
         m_dictBossStateFrameID[STATE_BORN_MOVE + "_" + 1] = 8 + 2;
         m_dictBossStateFrameID[STATE_BORN_MOVE_LOOP + "_" + 1] = 8 + 3;
         m_dictBossStateFrameID[STATE_BORN_MOVE_OVER + "_" + 1] = 8 + 4;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_SKILL_JAZZKISS + "_" + 1] = 8 + 6;
         m_dictBossStateFrameID[STATE_SKILL_ROCKSPIRIT + "_" + 1] = 8 + 7;
         m_dictBossStateFrameID[STATE_SKILL_MOONWALK_ONE + "_" + 1] = 8 + 8;
         m_dictBossStateFrameID[STATE_SKILL_MOONWALK_TWO + "_" + 1] = 8 + 8;
         m_dictBossStateFrameID[STATE_SKILL_MOONWALK_THREE + "_" + 1] = 8 + 8;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 17;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,12,3,0]);
         m_vStateCache.push([STATE_MOVE,7,3,0]);
         m_vStateCache.push([STATE_BORN_MOVE,7]);
         m_vStateCache.push([STATE_BORN_MOVE_LOOP,9]);
         m_vStateCache.push([STATE_BORN_MOVE_OVER,2]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.JazzKiss);
         m_vSkillFunction.push(this.RockSpirit);
         m_vSkillFunction.push(this.MoonWalk);
      }
      
      private function JazzKiss() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_JAZZKISS,34]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
      }
      
      private function RockSpirit() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,1,3,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILL_ROCKSPIRIT,46]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
      }
      
      private function MoonWalk() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_MOONWALK_ONE,7,3,0]);
         m_vStateCache.push([STATE_SKILL_MOONWALK_TWO,1,3,0]);
         m_vStateCache.push([STATE_SKILL_MOONWALK_THREE,7,3,0]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
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
            case STATE_SKILL_JAZZKISS:
               this.SetIsCannotSee(false);
               break;
            case STATE_SKILL_MOONWALK_ONE:
            case STATE_SKILL_MOONWALK_TWO:
            case STATE_SKILL_MOONWALK_THREE:
            case STATE_MOVE:
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
            case STATE_SKILL_JAZZKISS:
               if(a_1273 == 70 || a_1273 == 202)
               {
                  xStart = 0;
                  xEnd = 8;
                  yStart = 0;
                  yEnd = 6;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        this.ActionSkillSleep(stTargetFieldGrid);
                     }
                  }
                  setTimeout(this.ActionSkillOneCallMouse,1000);
               }
               break;
            case STATE_SKILL_ROCKSPIRIT:
               if(a_1273 == 119 || a_1273 == 250)
               {
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,2);
                  this.addHatMouse(stStartFieldGrid);
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,4);
                  this.addHatMouse(stStartFieldGrid);
               }
               if(a_1273 == 120 || a_1273 == 251)
               {
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,1);
                  this.addHatMouse(stStartFieldGrid);
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3);
                  this.addHatMouse(stStartFieldGrid);
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,5);
                  this.addHatMouse(stStartFieldGrid);
               }
               if(a_1273 == 121 || a_1273 == 252)
               {
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,0);
                  this.addHatMouse(stStartFieldGrid);
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,3);
                  this.addHatMouse(stStartFieldGrid);
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,6);
                  this.addHatMouse(stStartFieldGrid);
               }
               break;
            case STATE_SKILL_MOONWALK_THREE:
         }
         return true;
      }
      
      private function ActionSkillOneCallMouse() : void
      {
         var stStartFieldGrid:a_3491 = null;
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,0);
         this.RealeaseMouse(8389315,stStartFieldGrid);
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,1);
         this.RealeaseMouse(8389315,stStartFieldGrid);
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,5);
         this.RealeaseMouse(8389315,stStartFieldGrid);
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,6);
         this.RealeaseMouse(8389315,stStartFieldGrid);
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,2);
         this.RealeaseMouse(8389321,stStartFieldGrid);
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,3);
         this.RealeaseMouse(8389321,stStartFieldGrid);
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,4);
         this.RealeaseMouse(8389321,stStartFieldGrid);
      }
      
      private function ActionSkillSleep(stTempFieldGrid:a_3491) : void
      {
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            stTempFieldGrid.m_stAttackFighter.SleepTime2(100);
         }
      }
      
      private function addHatMouse(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         var tempIndex:int = 0;
         if(stFieldGrid == null)
         {
            return false;
         }
         do
         {
            tempIndex = m_stRandomSeed.nextInt(3) + 1;
         }
         while(tempIndex == this.m_index && tempIndex > 3);
         this.m_index = tempIndex;
         stBaseMoveIntruder = HatMouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            HatMouseMoveIntruder(stBaseMoveIntruder).m_index = this.m_index;
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
         }
         return true;
      }
      
      private function RealeaseMouse(stMouseID:int, stFieldGrid:a_3491) : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(!stFieldGrid)
         {
            throw Error(toString() + "::RealeaseMouse->iXGridNo = " + stFieldGrid.m_iXGridNo + "  iYGridNo = " + stFieldGrid.m_iYGridNo);
         }
         trace("::RealeaseMouse->iXGridNo = " + stFieldGrid.m_iXGridNo + "  iYGridNo = " + stFieldGrid.m_iYGridNo);
         stBaseMoveIntruder = a_4255.getInstance().a_4256(stMouseID);
         if(null == stBaseMoveIntruder)
         {
            throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + stMouseID.toString(16));
         }
         stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
         stBaseMoveIntruder.m_stMoveIntruderTypeID = stMouseID;
         stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
         stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
         stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
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
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_BORN_MOVE || m_iBossState == STATE_SKILL_JAZZKISS || m_iBossState == STATE_SKILL_ROCKSPIRIT || m_iBossState == STATE_SKILL_MOONWALK_ONE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_MOONWALK_ONE || m_iBossState == STATE_SKILL_MOONWALK_TWO || m_iBossState == STATE_SKILL_MOONWALK_THREE || m_iBossState == STATE_MOVE);
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
         var a_1598:a_3491 = null;
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
         var bIsCanChangeToFieldGrid:Boolean = false;
         if(stNextFieldGrid != null && m_stCurrentFieldGrid != null && (stNextFieldGrid.m_iXGridNo != m_stCurrentFieldGrid.m_iXGridNo || stNextFieldGrid.m_iYGridNo != m_stCurrentFieldGrid.m_iYGridNo))
         {
            bIsCanChangeToFieldGrid = true;
         }
         ChangeToFieldGrid(stNextFieldGrid);
         if(bIsCanChangeToFieldGrid && m_iBossState == STATE_SKILL_MOONWALK_ONE)
         {
            this.a_3502(m_stCurrentFieldGrid);
            a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
            this.addBurnEffect(a_1598);
            a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
            this.addBurnEffect(a_1598);
         }
         if(bIsCanChangeToFieldGrid && m_iBossState == STATE_SKILL_MOONWALK_TWO)
         {
            this.a_3502(m_stCurrentFieldGrid);
            a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 2);
            this.RealeaseMouse(8389315,a_1598);
            a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 2);
            this.RealeaseMouse(8389315,a_1598);
         }
         if(bIsCanChangeToFieldGrid && m_iBossState == STATE_SKILL_MOONWALK_THREE)
         {
            this.a_3502(m_stCurrentFieldGrid);
            a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
            this.RealeaseMouse(8389321,a_1598);
            a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
            this.RealeaseMouse(8389321,a_1598);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      private function addBurnEffect(stFieldGrid:a_3491) : void
      {
         var stLastWaitShot:a_4348 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         if(stFieldGrid != null)
         {
            stLastWaitShot = BurnBuffShot.a_4344();
            BurnBuffShot(stLastWaitShot).WaitTime = 15;
            BurnBuffShot(stLastWaitShot).stTargetFieldGrid = stFieldGrid;
            iPosX = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            iPosY = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stLastWaitShot.a_1797(0,0,50,iPosX,iPosY,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid,false,1,0);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
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
   }
}


package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.boss.BellGuard
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.Desert.TribeChief.DizzinessEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public class BellTowerGuardIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 10;
      
      private static const STATE_MOVEBEGIN:uint = 6;
      
      private static const STATE_MOVEOVER:uint = 7;
      
      private static const STATE_SKILLONE:uint = 9;
      
      private static const STATE_SKILLONE_DROP:uint = 10;
      
      private static const STATE_RELEASECLOCK_ONE:uint = 11;
      
      private static const STATE_RELEASECLOCK_TWO:uint = 12;
      
      private static const STATE_RELEASECLOCK_THREE:uint = 13;
      
      private static const STATE_SKILLTWO_OVER:uint = 14;
      
      private static const STATE_SKILLTHREE_ONE:uint = 15;
      
      private static const STATE_SKILLTHREE_TWO:uint = 16;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 17;
      
      private static const STATE_CHG_TOWARD:uint = 18;
      
      private static const STATE_MOVECLEARCARD:uint = 19;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_OutArray:Array = new Array([2,3],[3,3],[4,5],[5,3],[6,3],[2,4],[3,4],[4,4],[5,4],[6,4]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var m_index:int;
      
      public function BellTowerGuardIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 50;
         a_1467 = -65;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BellTowerGuardIntruderBoss) as BellTowerGuardIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return BellTowerGuardIntruderBossMovie;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
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
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVEBEGIN + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVECLEARCARD + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVEOVER + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILLONE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILLONE_DROP + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_RELEASECLOCK_ONE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_RELEASECLOCK_TWO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_RELEASECLOCK_THREE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILLTWO_OVER + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILLTHREE_ONE + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILLTHREE_TWO + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 25;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 12 + 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 12 + 1;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 12 + 1;
         m_dictBossStateFrameID[STATE_MOVEBEGIN + "_" + 1] = 12 + 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 12 + 3;
         m_dictBossStateFrameID[STATE_MOVECLEARCARD + "_" + 1] = 12 + 3;
         m_dictBossStateFrameID[STATE_MOVEOVER + "_" + 1] = 12 + 4;
         m_dictBossStateFrameID[STATE_SKILLONE + "_" + 1] = 12 + 5;
         m_dictBossStateFrameID[STATE_SKILLONE_DROP + "_" + 1] = 12 + 6;
         m_dictBossStateFrameID[STATE_RELEASECLOCK_ONE + "_" + 1] = 12 + 7;
         m_dictBossStateFrameID[STATE_RELEASECLOCK_TWO + "_" + 1] = 12 + 8;
         m_dictBossStateFrameID[STATE_RELEASECLOCK_THREE + "_" + 1] = 12 + 9;
         m_dictBossStateFrameID[STATE_SKILLTWO_OVER + "_" + 1] = 12 + 10;
         m_dictBossStateFrameID[STATE_SKILLTHREE_ONE + "_" + 1] = 12 + 11;
         m_dictBossStateFrameID[STATE_SKILLTHREE_TWO + "_" + 1] = 12 + 12;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 25;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,12,5,0]);
         m_vStateCache.push([STATE_MOVEBEGIN,8]);
         m_vStateCache.push([STATE_MOVE,8,5,0]);
         m_vStateCache.push([STATE_MOVEOVER,7]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.TimeStaticSkill);
         m_vSkillFunction.push(this.RealeaseClock);
         m_vSkillFunction.push(this.TimeWindUp);
      }
      
      private function TimeStaticSkill() : void
      {
         var index:int = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILLONE,22]);
         index = int(m_stRandomSeed.nextInt(this.m_OutArray.length));
         m_vStateCache.push([STATE_APPEAR,this.m_OutArray[index][0],this.m_OutArray[index][1],0]);
         m_vStateCache.push([STATE_SKILLONE_DROP,12]);
      }
      
      private function RealeaseClock() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVEBEGIN,8]);
         m_vStateCache.push([STATE_MOVE,0,3,0]);
         m_vStateCache.push([STATE_MOVEOVER,7]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_RELEASECLOCK_ONE,19]);
         m_vStateCache.push([STATE_RELEASECLOCK_TWO,12]);
         m_vStateCache.push([STATE_RELEASECLOCK_THREE,14]);
         m_vStateCache.push([STATE_SKILLTWO_OVER,6]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      private function TimeWindUp() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVEBEGIN,8]);
         m_vStateCache.push([STATE_MOVE,8,1,0]);
         m_vStateCache.push([STATE_MOVEOVER,7]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILLTHREE_ONE,13]);
         m_vStateCache.push([STATE_MOVEBEGIN,8]);
         m_vStateCache.push([STATE_MOVECLEARCARD,8,5,0]);
         m_vStateCache.push([STATE_MOVEOVER,7]);
         m_vStateCache.push([STATE_SKILLTHREE_ONE,13]);
         m_vStateCache.push([STATE_MOVEBEGIN,8]);
         m_vStateCache.push([STATE_MOVECLEARCARD,4,3,0]);
         m_vStateCache.push([STATE_MOVEOVER,7]);
         m_vStateCache.push([STATE_SKILLTHREE_TWO,43]);
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
         this.UpdateSpeedByState(iNextState);
         this.SetIsCannotSee(true);
         switch(iNextState)
         {
            case STATE_APPEAR:
               iNextValue = 0;
               this.visible = false;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_MOVEBEGIN:
               this.visible = true;
               break;
            case STATE_MOVE:
            case STATE_MOVECLEARCARD:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILLONE_DROP:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_SKILLTHREE_ONE:
            case STATE_SKILLTHREE_TWO:
            case STATE_SKILLONE:
            case STATE_RELEASECLOCK_ONE:
            case STATE_RELEASECLOCK_TWO:
            case STATE_RELEASECLOCK_THREE:
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
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
            case STATE_SKILLONE:
               if(a_1273 == 54 || a_1273 == 246)
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
                        this.DeepSleep(stTargetFieldGrid);
                     }
                  }
               }
               break;
            case STATE_SKILLONE_DROP:
               if(a_1273 == 70 || a_1273 == 262)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_RELEASECLOCK_ONE:
               if(a_1273 == 99 || a_1273 == 291)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,1);
                  if(stTargetFieldGrid != null)
                  {
                     if(stTargetFieldGrid.m_stMouseObstacle)
                     {
                        stTargetFieldGrid.m_stMouseObstacle.a_3432();
                        stTargetFieldGrid.m_stMouseObstacle = null;
                     }
                     if(stTargetFieldGrid.m_iFieldGridType == 0)
                     {
                        this.addClockMouse(stTargetFieldGrid);
                     }
                  }
               }
               break;
            case STATE_RELEASECLOCK_TWO:
               if(a_1273 == 112 || a_1273 == 304)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,2);
                  if(stTargetFieldGrid != null)
                  {
                     if(stTargetFieldGrid.m_stMouseObstacle)
                     {
                        stTargetFieldGrid.m_stMouseObstacle.a_3432();
                        stTargetFieldGrid.m_stMouseObstacle = null;
                     }
                     if(stTargetFieldGrid.m_iFieldGridType == 0)
                     {
                        this.addClockMouse(stTargetFieldGrid);
                     }
                  }
               }
               break;
            case STATE_RELEASECLOCK_THREE:
               if(a_1273 == 127 || a_1273 == 319)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,5);
                  if(stTargetFieldGrid != null)
                  {
                     if(stTargetFieldGrid.m_stMouseObstacle)
                     {
                        stTargetFieldGrid.m_stMouseObstacle.a_3432();
                        stTargetFieldGrid.m_stMouseObstacle = null;
                     }
                     if(stTargetFieldGrid.m_iFieldGridType == 0)
                     {
                        this.addClockMouse(stTargetFieldGrid);
                     }
                  }
               }
               break;
            case STATE_SKILLTHREE_ONE:
               if(a_1273 == 144 || a_1273 == 336)
               {
                  this.addEffectOne(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILLTHREE_TWO:
               if(a_1273 == 174 || a_1273 == 366)
               {
                  this.addEffectTwo(m_stCurrentFieldGrid);
               }
         }
         return true;
      }
      
      private function ActionSkillOne() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = m_stCurrentFieldGrid.m_iXGridNo - 1;
         var xEnd:int = m_stCurrentFieldGrid.m_iXGridNo + 1;
         var yStart:int = m_stCurrentFieldGrid.m_iYGridNo - 1;
         var yEnd:int = m_stCurrentFieldGrid.m_iYGridNo + 1;
         var stFieldGridVector:Array = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.a_3502(stTargetFieldGrid);
            }
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILLONE || m_iBossState == STATE_SKILLTHREE_ONE || m_iBossState == STATE_SKILLTHREE_TWO || m_iBossState == STATE_SKILLONE_DROP);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_MOVECLEARCARD;
      }
      
      private function DeepSleep(stTempFieldGrid:a_3491) : void
      {
         var stSleepingEffect:DizzinessEffect = null;
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            stTempFieldGrid.m_stAttackFighter.a_3958(3 * 20);
            stSleepingEffect = DizzinessEffect.a_3926();
            stSleepingEffect.a_1797(false);
            stSleepingEffect.a_3958 = 3;
            stSleepingEffect.x = stTempFieldGrid.m_stAttackFighter.x + stTempFieldGrid.m_stAttackFighter.width * 0.4 - 30;
            stSleepingEffect.y = stTempFieldGrid.m_stAttackFighter.y - 10;
            stTempFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSleepingEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
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
      
      private function addEffectOne(stFieldGrid:a_3491) : void
      {
         var xStart:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stEffect:SpeedUpFirstEffect = null;
         var xIndex:int = 0;
         this.a_3502(stFieldGrid);
         xStart = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 6;
         if(stFieldGrid)
         {
            stEffect = SpeedUpFirstEffect.a_3926();
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,stFieldGrid.m_iYGridNo);
               stTargetFieldGrid.m_SpeedBool = true;
               setTimeout(this.ClearSpeedBool,5 * 1000,stTargetFieldGrid);
            }
         }
      }
      
      private function addEffectTwo(stFieldGrid:a_3491) : void
      {
         var yStart:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stEffect:SpeedUpSecondEffect = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         this.a_3502(stFieldGrid);
         var xStart:int = 0;
         var xEnd:int = 8;
         yStart = 0;
         var yEnd:int = 6;
         if(stFieldGrid)
         {
            stEffect = SpeedUpSecondEffect.a_3926();
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  stTargetFieldGrid.m_SpeedBool = true;
                  setTimeout(this.ClearSpeedBool,10 * 1000,stTargetFieldGrid);
               }
            }
         }
      }
      
      private function ClearSpeedBool(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         stFieldGrid.m_SpeedBool = false;
         trace("清理m_iXGridNo:" + stFieldGrid.m_iXGridNo + "m_iXGridNo:" + stFieldGrid.m_iYGridNo + "加速效果");
         return true;
      }
      
      private function addClockMouse(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:ClockDiscMouseMoveIntruder = null;
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
         stBaseMoveIntruder = ClockDiscMouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.m_index = this.m_index;
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
         }
         return true;
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
         if(bIsCanChangeToFieldGrid && m_iBossState == STATE_MOVECLEARCARD)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
      }
   }
}


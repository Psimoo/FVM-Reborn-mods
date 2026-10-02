package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.ExploreWayBoss
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.SleepingEffect;
   import flash.utils.Dictionary;
   
   public class ExploreWayIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 10;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SPECIAL_WAITING:uint = 7;
      
      private static const STATE_FLASH_OUT:uint = 8;
      
      private static const STATE_FLASH_IN:uint = 9;
      
      private static const STATE_SKILL_ONE:uint = 10;
      
      private static const STATE_SKILL_TWO:uint = 11;
      
      private static const STATE_SKILL_THREE_START:uint = 12;
      
      private static const STATE_SKILL_THREE_READYLOOP:uint = 13;
      
      private static const STATE_SKILL_THREE_SHOT:uint = 14;
      
      private static const STATE_SKILL_THREE_PARALYSISSTART:uint = 15;
      
      private static const STATE_SKILL_THREE_PARALYSISLOOP:uint = 16;
      
      private static const STATE_SKILL_THREE_PARALYSISEND:uint = 17;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 18;
      
      private static const STATE_CHG_TOWARD:uint = 19;
      
      private static const STATE_APPEAR_SEE:uint = 20;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function ExploreWayIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = 71;
         a_1467 = 14;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ExploreWayIntruderBoss) as ExploreWayIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return ExploreWayIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
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
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR_SEE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE_START + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_READYLOOP + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_SHOT + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_PARALYSISSTART + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE_PARALYSISLOOP + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_THREE_PARALYSISEND + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 28;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 13 + 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = 13 + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 13 + 2;
         m_dictBossStateFrameID[STATE_APPEAR_SEE + "_" + 1] = 13 + 2;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 1] = 13 + 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 13 + 4;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = 13 + 5;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 1] = 13 + 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 13 + 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 13 + 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE_START + "_" + 1] = 13 + 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_READYLOOP + "_" + 1] = 13 + 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_SHOT + "_" + 1] = 13 + 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_PARALYSISSTART + "_" + 1] = 13 + 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE_PARALYSISLOOP + "_" + 1] = 13 + 13;
         m_dictBossStateFrameID[STATE_SKILL_THREE_PARALYSISEND + "_" + 1] = 13 + 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 28;
      }
      
      override protected function set a_1460(value:Boolean) : void
      {
         super.a_1460 = value;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 8;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(5) + 1;
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_WAITING,3 * 10]);
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
         m_vStateCache.push([STATE_SKILL_ONE,27]);
         var m_iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo - 5;
         var m_iYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         m_vStateCache.push([STATE_APPEAR_SEE,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_WAITING,3 * 20 - 24]);
         m_vStateCache.push([STATE_SPECIAL_WAITING,24]);
      }
      
      private function SkillTwo() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         var m_iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo;
         do
         {
            m_iYGridNo = m_stRandomSeed.nextInt(3) + 2;
         }
         while(m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo);
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_TWO,40]);
         m_vStateCache.push([STATE_WAITING,3 * 10]);
         m_vStateCache.push([STATE_FLASH_OUT,6]);
         m_vStateCache.push([STATE_CHG_CAN_BE_ATTACK,3 * 10]);
      }
      
      private function SkillThree() : void
      {
         var m_iSecondY:int = 0;
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 8;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(4) + 1;
         m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_FLASH_IN,5]);
         m_vStateCache.push([STATE_SKILL_THREE_START,10]);
         m_vStateCache.push([STATE_SKILL_THREE_READYLOOP,3 * 10]);
         m_vStateCache.push([STATE_SKILL_THREE_SHOT,13]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         do
         {
            m_iSecondY = m_iYGridNo + (m_stRandomSeed.nextInt(2) > 0 ? 2 : -2);
         }
         while(m_iSecondY > 5 || m_iSecondY < 1);
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iSecondY,0]);
      }
      
      private function BoomSkill() : void
      {
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 8;
         m_vStateCache.push([STATE_SKILL_THREE_PARALYSISSTART,2]);
         m_vStateCache.push([STATE_SKILL_THREE_PARALYSISLOOP,3 * 10]);
         m_vStateCache.push([STATE_SKILL_THREE_PARALYSISEND,15]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
         do
         {
            m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + (m_stRandomSeed.nextInt(2) > 0 ? 2 : -2);
         }
         while(m_iYGridNo > 5 || m_iYGridNo < 1);
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
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
            case STATE_BORN:
               this.SetIsCannotSee(true);
               iNextValue = 40;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_APPEAR:
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = false;
               break;
            case STATE_APPEAR_SEE:
               this.SetIsCannotSee(false);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_FLASH_IN:
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_CHG_CAN_BE_ATTACK:
               this.SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
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
         this.SetIsCannotSee(true);
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
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 21)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 111 || a_1273 == 307)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 5,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 116 || a_1273 == 312)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
                  ChangeToFieldGrid(stTargetFieldGrid);
               }
               else if(a_1273 == 117 || a_1273 == 313)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
                  ChangeToFieldGrid(stTargetFieldGrid);
               }
               else if(a_1273 == 118 || a_1273 == 314)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
                  ChangeToFieldGrid(stTargetFieldGrid);
               }
               else if(a_1273 == 124 || a_1273 == 320)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_FLASH_IN:
               if(a_1273 == 94 || a_1273 == 290)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 151 || a_1273 == 347)
               {
                  this.ActionSkillTwo(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_THREE_SHOT:
               if(a_1273 == 192 || a_1273 == 388)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 4,m_stCurrentFieldGrid.m_iYGridNo);
                  this.ActionSkillOne(stTargetFieldGrid);
               }
         }
         return true;
      }
      
      private function ActionSkillTwo(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         if(stFieldGrid)
         {
            yStart = stFieldGrid.m_iYGridNo - 2 < 0 ? 0 : int(stFieldGrid.m_iYGridNo - 2);
            xStart = stFieldGrid.m_iXGridNo - 2 < 0 ? 0 : int(stFieldGrid.m_iXGridNo - 2);
            yEnd = stFieldGrid.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(stFieldGrid.m_iYGridNo + 2);
            xEnd = stFieldGrid.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(stFieldGrid.m_iXGridNo + 2);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  this.SleepCard(stTargetFieldGrid);
               }
            }
         }
      }
      
      private function SleepCard(stFieldGrid:a_3491) : void
      {
         var stSleepingEffect:SleepingEffect = null;
         if(Boolean(stFieldGrid) && null != stFieldGrid.m_stAttackFighter)
         {
            stFieldGrid.m_stAttackFighter.a_3958(10 * 20);
            stSleepingEffect = SleepingEffect.a_3926();
            stSleepingEffect.a_1797(false);
            stSleepingEffect.a_3958 = 10;
            stSleepingEffect.x = stFieldGrid.m_stAttackFighter.x + stFieldGrid.m_stAttackFighter.width * 0.5 - 31;
            stSleepingEffect.y = stFieldGrid.m_stAttackFighter.y - 10;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSleepingEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
            stFieldGrid.m_stSleepingEffect = stSleepingEffect;
         }
      }
      
      private function ActionSkillOne(stFieldGrid:a_3491) : void
      {
         var tempX2:int = 0;
         var tempY2:int = 0;
         var stLastWaitShot:ExploreWayBombShot = null;
         if(stFieldGrid)
         {
            stLastWaitShot = ExploreWayBombShot.a_4344() as ExploreWayBombShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            tempX2 = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            tempY2 = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            stLastWaitShot.a_1797(0,10,50,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_TWO);
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
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         if(m_iBossState == STATE_SKILL_THREE_START || m_iBossState == STATE_SKILL_THREE_READYLOOP)
         {
            this.BoomSkill();
            this.SwitchState(-1);
         }
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
   }
}


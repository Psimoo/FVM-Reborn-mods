package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.TravelRecordPlayer
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class TravelRecordPlayerIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (0.3 * 20);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_LAND_WAITING:uint = 7;
      
      private static const STATE_LANDTOAIR:uint = 8;
      
      private static const STATE_AIR_WAITING:uint = 9;
      
      private static const STATE_AIRTOLAND:uint = 10;
      
      private static const STATE_SKILLONE_BEGIN:uint = 11;
      
      private static const STATE_SKILLONE_LOOP:uint = 12;
      
      private static const STATE_SKILLONE_END:uint = 13;
      
      private static const STATE_SKILL_TWO:uint = 14;
      
      private static const STATE_SKILL_THREE:uint = 15;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 16;
      
      private static const STATE_CHG_TOWARD:uint = 17;
      
      protected var a_1312:int = 4;
      
      protected var a_1311:int = 1000;
      
      private var m_BornArray:Array = new Array([8,2],[8,3],[8,4]);
      
      private var m_SkillIndex:int;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_TotalLifeValue:int;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var randomY:Array = new Array();
      
      public function TravelRecordPlayerIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -79;
         a_1467 = -68;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TravelRecordPlayerIntruderBoss) as TravelRecordPlayerIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return TravelRecordPlayerIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.m_SkillIndex = -1;
         a_1283 = false;
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
         m_dictBossStateFrameID[STATE_LAND_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_LANDTOAIR + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_AIR_WAITING + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_AIRTOLAND + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILLONE_BEGIN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILLONE_LOOP + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILLONE_END + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_LAND_WAITING + "_" + 1] = 2 + 10;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 2 + 10;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 4 + 10;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = 2 + 10;
         m_dictBossStateFrameID[STATE_LANDTOAIR + "_" + 1] = 3 + 10;
         m_dictBossStateFrameID[STATE_AIR_WAITING + "_" + 1] = 4 + 10;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 5 + 10;
         m_dictBossStateFrameID[STATE_AIRTOLAND + "_" + 1] = 6 + 10;
         m_dictBossStateFrameID[STATE_SKILLONE_BEGIN + "_" + 1] = 7 + 10;
         m_dictBossStateFrameID[STATE_SKILLONE_LOOP + "_" + 1] = 8 + 10;
         m_dictBossStateFrameID[STATE_SKILLONE_END + "_" + 1] = 9 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 10 + 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 11 + 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 22;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][0]);
         var m_iYGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][1]);
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_LAND_WAITING,2 * 10]);
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
         m_vStateCache.push([STATE_LANDTOAIR,10]);
         var m_iXGridNo:int = int(m_stRandomSeed.nextInt(3));
         var m_iYGridNo:int = m_stRandomSeed.nextInt(5) + 1;
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         if(!a_1283)
         {
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_SKILLONE_BEGIN,10]);
         m_vStateCache.push([STATE_SKILLONE_LOOP,17]);
         m_vStateCache.push([STATE_SKILLONE_END,22]);
         m_vStateCache.push([STATE_LAND_WAITING,5 * 10]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_LANDTOAIR,10]);
         var m_iXGridNo:int = m_stRandomSeed.nextInt(3) + 5;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(2) + 1;
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         if(a_1283)
         {
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_AIRTOLAND,8]);
         m_vStateCache.push([STATE_SKILL_TWO,45]);
         m_vStateCache.push([STATE_APPEAR,m_iXGridNo - 5,m_iYGridNo + 3,0]);
         m_vStateCache.push([STATE_LAND_WAITING,2 * 10]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_LANDTOAIR,10]);
         var m_iXGridNo:int = m_stRandomSeed.nextInt(5) + 4;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(3) + 2;
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         if(a_1283)
         {
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_SKILL_THREE,30]);
         m_vStateCache.push([STATE_AIR_WAITING,5 * 10]);
         m_vStateCache.push([STATE_AIRTOLAND,8]);
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
               iNextValue = 38;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               break;
            case STATE_APPEAR:
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_LAND_WAITING:
               this.SetIsCannotSee(false);
               a_1465 = 0;
               break;
            case STATE_LANDTOAIR:
               a_1465 = 3;
               break;
            case STATE_SKILL_TWO:
               this.ActionSkillThwo();
               break;
            case STATE_AIRTOLAND:
               a_1465 = 0;
               break;
            case STATE_MOVE:
               a_1465 = 3;
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               break;
            default:
               this.SetIsCannotSee(false);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_iTableID * 100,1000);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         this.visible = true;
         this.ChangeToFieldGrid(stNextFieldGrid);
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
         if(!a_1460)
         {
            InitState();
            a_1460 = true;
            this.m_TotalLifeValue = iLifeValue;
         }
         if(this.a_1581 > 0 && this.m_isJumping)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = this.ChangeToFieldGrid(stNextFieldGrid);
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return a_1339 > 0;
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
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 35)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_AIRTOLAND:
               if(a_1273 == 88 || a_1273 == 271)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILLONE_END:
               if(a_1273 == 139 || a_1273 == 321)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILLONE_LOOP:
               if(iCurrentTime % 2 == 0)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 155 || a_1273 == 336)
               {
                  stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  bIsCanChangeToFieldGrid = this.ChangeToFieldGrid(stNextFieldGrid);
                  if(bIsCanChangeToFieldGrid)
                  {
                     this.a_3502(stNextFieldGrid);
                  }
               }
               else if(a_1273 == 157 || a_1273 == 338)
               {
                  stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  bIsCanChangeToFieldGrid = this.ChangeToFieldGrid(stNextFieldGrid);
                  if(bIsCanChangeToFieldGrid)
                  {
                     this.a_3502(stNextFieldGrid);
                  }
               }
               else if(a_1273 == 176 || a_1273 == 357)
               {
                  stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  bIsCanChangeToFieldGrid = this.ChangeToFieldGrid(stNextFieldGrid);
                  if(bIsCanChangeToFieldGrid)
                  {
                     this.a_3502(stNextFieldGrid);
                  }
               }
               else if(a_1273 == 181 || a_1273 == 362)
               {
                  stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  bIsCanChangeToFieldGrid = this.ChangeToFieldGrid(stNextFieldGrid);
                  if(bIsCanChangeToFieldGrid)
                  {
                     this.a_3502(stNextFieldGrid);
                  }
               }
               else if(a_1273 == 182 || a_1273 == 363)
               {
                  stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  bIsCanChangeToFieldGrid = this.ChangeToFieldGrid(stNextFieldGrid);
                  if(bIsCanChangeToFieldGrid)
                  {
                     this.a_3502(stNextFieldGrid);
                  }
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 214 || a_1273 == 395)
               {
                  this.ActionSkillThree();
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
         while(this.randomY.length > 0)
         {
            this.randomY.pop();
         }
         for(var i:int = 0; i < 4; i++)
         {
            do
            {
               m_iXGridNo = m_stRandomSeed.nextInt(2) + 6;
               m_iYGridNo = int(m_stRandomSeed.nextInt(7));
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || this.randomY.indexOf(m_iYGridNo) != -1);
            this.randomField.push(stTargetFieldGrid);
            this.randomY.push(m_iYGridNo);
         }
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
         var bIsCanChangeToFieldGrid:Boolean = this.ChangeToFieldGrid(stNextFieldGrid);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILLONE_LOOP || m_iBossState == STATE_SKILL_TWO || m_iBossState == STATE_SKILL_THREE);
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
      
      override protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return false;
         }
         ChangeFieldGrid(stNextFieldGrid);
         return true;
      }
      
      private function ActionSkillOne() : void
      {
         var yIndex:int = 0;
         var stTempFieldGrid:a_3491 = null;
         for(var xIndex:int = 0; xIndex < BattleFieldView.a_1011; xIndex++)
         {
            for(yIndex = 0; yIndex < BattleFieldView.a_1012; yIndex++)
            {
               stTempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
               if(Boolean(stTempFieldGrid) && Boolean(null != stTempFieldGrid.m_stAttackFighter) && !stTempFieldGrid.m_stAttackFighter.m_isSleep)
               {
                  stTempFieldGrid.m_stAttackFighter.SleepTime2(10 * 20);
                  stTempFieldGrid.m_stAttackFighter.m_isSleep = true;
               }
            }
         }
      }
      
      private function ActionSkillThwo() : void
      {
         var stArrowEffect:ArrowEffect = null;
         if(m_stCurrentFieldGrid)
         {
            stArrowEffect = ArrowEffect.a_3926();
            stArrowEffect.a_1797(false);
            stArrowEffect.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 - 18;
            stArrowEffect.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + 12;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stArrowEffect,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
            stArrowEffect.play();
         }
      }
      
      private function ActionSkillThree() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(m_stCurrentFieldGrid)
         {
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
            stBaseMoveIntruder = MoonMoveIntruder.a_3926();
            if(stTargetFieldGrid != null)
            {
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stTargetFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 5;
               stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false);
               if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stBaseMoveIntruder,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
               }
            }
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


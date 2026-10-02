package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.AbuSoren
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class AbuSorenIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE:uint = 7;
      
      private static const STATE_SKILL_TWO:uint = 8;
      
      private static const STATE_SKILL_THREE:uint = 9;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 10;
      
      private static const STATE_CHG_TOWARD:uint = 11;
      
      private static var intervalId:uint = 0;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var counter:uint = 0;
      
      private var m_arrMouse:Array = new Array();
      
      public function AbuSorenIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = 23;
         a_1467 = 65;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AbuSorenIntruderBoss) as AbuSorenIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return AbuSorenIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return b;
      }
      
      override protected function InitState() : void
      {
         setLifeValue();
         this.SetIsCannotSee(true);
         stop();
         m_vSkillID.length = 0;
         a_1465 = 3;
         m_iRestTick = 0;
         m_iBossState = STATE_NONE;
         this.SetRandomSeed();
         this.InitSkillCache();
         InitShadow();
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
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = 5 + 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 5 + 4;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 5 + 5;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 5 + 6;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 12;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,4,3,0]);
         m_vStateCache.push([STATE_WAITING,1 * 20]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillOne);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,8,3,0]);
         m_vStateCache.push([STATE_SKILL_ONE,20]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_MOVE,8,3,0]);
         m_vStateCache.push([STATE_SKILL_TWO,20]);
         m_vStateCache.push([STATE_WAITING,3 * 20]);
      }
      
      private function SkillThree() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         do
         {
            m_iXGridNo = m_stRandomSeed.nextInt(4) + 2;
            m_iYGridNo = m_stRandomSeed.nextInt(2) + 2;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_THREE,35]);
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
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_BORN:
               this.SetIsCannotSee(true);
               iNextValue = 44;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(true);
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
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
               if(a_1273 == 2)
               {
                  this.BornSkill();
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 68 || a_1273 == 165)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 92 || a_1273 == 189)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 125 || a_1273 == 222)
               {
                  this.ActionSkillThree();
               }
         }
         return true;
      }
      
      private function addTornadoShot() : void
      {
         var m_iYGridNo:int = 0;
         var m_iXGridNo:int = 0;
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         ++this.counter;
         if(this.counter == 4)
         {
            trace("Clearing Interval");
            clearInterval(intervalId);
         }
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         var shotMoveSpeed:int = -a_3491.a_1080 / (1 * 20);
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo - 1,m_iYGridNo - 1);
         switch(this.counter)
         {
            case 1:
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               break;
            case 2:
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 2;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - 1;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 2;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 1;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               break;
            case 3:
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 4;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - 2;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 4;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 4;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 2;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               break;
            case 4:
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 6;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - 3;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 6;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - 1;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 6;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 1;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 6;
               m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 3;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(stStartFieldGrid)
               {
                  stLastWaitShot = TornadoShot.a_4344();
                  TornadoShot(stLastWaitShot).m_moveTimes = 2 * 20;
                  stLastWaitShot.a_1797(a_4265(),shotMoveSpeed,1000000,(stStartFieldGrid.m_iXGridNo + 1) * a_3491.a_1080 - 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
         }
      }
      
      private function randomFieldGrid() : void
      {
         var n:int;
         var i:int;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         n = 0;
         for(i = 0; i < 5; i++)
         {
            n = 0;
            try
            {
               while(true)
               {
                  m_iXGridNo = m_stRandomSeed.nextInt(3) + 5;
                  m_iYGridNo = int(m_stRandomSeed.nextInt(6));
                  n++;
                  if(n > 50)
                  {
                     break;
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  if(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_iFieldGridType != 0)
                  {
                     continue;
                  }
                  if(n != 51)
                  {
                     this.randomField.push(stTargetFieldGrid);
                  }
               }
               §§goto(addr010f);
            }
            catch(error:Error)
            {
               trace("没有格子种虫茧");
               break;
            }
         }
      }
      
      private function CanAddMouseEarthHole() : Boolean
      {
         var xIndex:int = 0;
         var stFieldGridi:a_3491 = null;
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         var yStart:int = 0;
         var xStart:int = 5;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         loop0:
         for(var yIndex:int = yStart; yIndex <= yEnd; )
         {
            xIndex = xStart;
            while(true)
            {
               if(xIndex > xEnd)
               {
                  yIndex++;
                  continue loop0;
               }
               stFieldGridi = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
               if(stFieldGridi != null)
               {
                  if(this.randomField.indexOf(stFieldGridi) == -1 && stFieldGridi.m_stMouseEarthHole == null && stFieldGridi.m_iFieldGridType == 0 && !(stFieldGridi.m_stAttackFighter is a_3924))
                  {
                     break;
                  }
               }
               xIndex++;
            }
            return true;
         }
         return false;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ONE || m_iBossState == STATE_SKILL_TWO || m_iBossState == STATE_SKILL_THREE || m_iBossState == STATE_SKILL_THREE);
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
      
      private function BornSkill() : void
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
      
      private function ActionSkillOne() : void
      {
         this.counter = 0;
         this.addTornadoShot();
         intervalId = setInterval(this.addTornadoShot,2 * 1000);
      }
      
      private function ActionSkillTwo() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         this.randomFieldGrid();
         while(this.m_arrMouse.length > 0)
         {
            stBaseMoveIntruder = this.m_arrMouse.pop();
            stBaseMoveIntruder.a_4212();
         }
         for(var i:int = 0; i < this.randomField.length; i++)
         {
            stStartFieldGrid = this.randomField[i];
            stBaseMoveIntruder = ChrysalisMoveIntruder.a_3926();
            if(Boolean(stBaseMoveIntruder) && Boolean(stStartFieldGrid))
            {
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = stStartFieldGrid.m_iYGridNo * a_3491.a_1081;
               stStartFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
               this.m_arrMouse.push(stBaseMoveIntruder);
            }
         }
      }
      
      private function ActionSkillThree() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         var yStart:int = m_stCurrentFieldGrid.m_iYGridNo - 2 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 2);
         var xStart:int = m_stCurrentFieldGrid.m_iXGridNo - 2 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 2);
         var yEnd:int = m_stCurrentFieldGrid.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 2);
         var xEnd:int = m_stCurrentFieldGrid.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 2);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.addEffect(stTargetFieldGrid);
            }
         }
      }
      
      private function addEffect(stFieldGrid:a_3491) : void
      {
         var stEffect:DenseFogEffect = null;
         if(stFieldGrid != null)
         {
            stEffect = DenseFogEffect.a_3926();
            stEffect.m_TargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE,stFieldGrid);
            stEffect.play();
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
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
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_iTableID * 100,1000);
      }
   }
}


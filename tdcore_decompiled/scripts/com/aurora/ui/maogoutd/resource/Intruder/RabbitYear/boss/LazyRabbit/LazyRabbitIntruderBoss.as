package com.aurora.ui.maogoutd.resource.Intruder.RabbitYear.boss.LazyRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class LazyRabbitIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE:uint = 7;
      
      private static const STATE_WAITING_ONE:uint = 8;
      
      private static const STATE_SKILL_TWO_BEGIN:uint = 9;
      
      private static const STATE_SKILL_TWO_APPEAR:uint = 10;
      
      private static const STATE_SKILL_TWO_MOVE_DOWN:uint = 11;
      
      private static const STATE_SKILL_TWO_MOVE_UP:uint = 12;
      
      private static const STATE_SKILL_THREE:uint = 13;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 14;
      
      private static const STATE_CHG_TOWARD:uint = 15;
      
      private static const STATE_WAITING_HIDE:uint = 16;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_BornArray:Array = new Array([6,1],[4,3],[6,5]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var m_ShoveShot:ShovelEarthHoleShot;
      
      private var m_RadishShot:RadishEarthHoleShot;
      
      public function LazyRabbitIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -67 - 6;
         a_1467 = 10 - 12;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(LazyRabbitIntruderBoss) as LazyRabbitIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return LazyRabbitIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bFirst = true;
         this.m_bCanBeAttack = true;
         a_1465 = 1;
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
         m_dictBossStateFrameID[STATE_WAITING_HIDE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_WAITING_ONE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_APPEAR + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_MOVE_DOWN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_MOVE_UP + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 9 + 2;
         m_dictBossStateFrameID[STATE_WAITING_HIDE + "_" + 1] = 9 + 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 9 + 3;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 9 + 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 9 + 4;
         m_dictBossStateFrameID[STATE_WAITING_ONE + "_" + 1] = 9 + 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 9 + 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_APPEAR + "_" + 1] = 9 + 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_MOVE_DOWN + "_" + 1] = 9 + 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_MOVE_UP + "_" + 1] = 9 + 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 9 + 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 20;
      }
      
      override protected function InitSkillCache() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         m_vStateCache.length = 0;
         m_iXGridNo = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][0]);
         m_iYGridNo = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][1]);
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.HarvestSkill);
         m_vSkillFunction.push(this.PursuitSkill);
         m_vSkillFunction.push(this.BlusterSkill);
      }
      
      private function HarvestSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_ONE,35]);
      }
      
      private function PursuitSkill() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,14]);
         m_vStateCache.push([STATE_SKILL_TWO_APPEAR,40]);
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         while(iLoopCnt < 150 && iCnt < 3)
         {
            m_iXGridNo = m_stRandomSeed.nextInt(6) + 2;
            if(this.randomField.indexOf(m_iXGridNo) == -1)
            {
               this.randomField.push(m_iXGridNo);
               iCnt++;
            }
            iLoopCnt++;
         }
         this.randomField.sort();
         m_vStateCache.push([STATE_APPEAR,this.randomField[0],2,0]);
         m_vStateCache.push([STATE_SKILL_TWO_MOVE_DOWN,27]);
         m_vStateCache.push([STATE_WAITING_HIDE,1.5 * 20]);
         m_vStateCache.push([STATE_APPEAR,this.randomField[1],4,0]);
         m_vStateCache.push([STATE_SKILL_TWO_MOVE_UP,27]);
         m_vStateCache.push([STATE_WAITING_HIDE,1.5 * 20]);
         m_vStateCache.push([STATE_APPEAR,this.randomField[2],2,0]);
         m_vStateCache.push([STATE_SKILL_TWO_MOVE_DOWN,27]);
      }
      
      private function BlusterSkill() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_iYGridNo = m_stRandomSeed.nextInt(5) + 1;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,8,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_THREE,67]);
         m_vStateCache.push([STATE_WAITING,4 * 20]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
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
               iNextValue = 62;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               a_1465 = 1;
               this.SetIsCannotSee(true);
               break;
            case STATE_APPEAR:
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               break;
            case STATE_SKILL_ONE:
               this.randomThiefMouse();
               a_1465 = 0;
               this.SetIsCannotSee(false);
               break;
            case STATE_SKILL_TWO_BEGIN:
               this.randomSmllHelloMouse();
            case STATE_SKILL_TWO_MOVE_DOWN:
            case STATE_SKILL_TWO_MOVE_UP:
               a_1465 = 1;
               this.SetIsCannotSee(true);
               break;
            case STATE_SKILL_THREE:
               a_1465 = 0;
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
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 2)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 104 || a_1273 == 363)
               {
                  this.ActionSkillOne();
               }
               if(a_1273 == 106 || a_1273 == 365)
               {
                  this.ActionSkillOne();
               }
               if(a_1273 == 111 || a_1273 == 370)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_TWO_BEGIN:
               if(a_1273 == 157 || a_1273 == 416)
               {
                  this.addSmllHelloMouse(0);
               }
               break;
            case STATE_SKILL_TWO_APPEAR:
               if(a_1273 == 174 || a_1273 == 433)
               {
                  this.addSmllHelloMouse(1);
               }
               else if(a_1273 == 171 || a_1273 == 431)
               {
                  this.addShoveShot();
               }
               else if(a_1273 == 188 || a_1273 == 447)
               {
                  this.addRadishShot();
               }
               break;
            case STATE_SKILL_TWO_MOVE_DOWN:
               if(a_1273 == 202 || a_1273 == 461)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.addSoilLayer(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 207 || a_1273 == 466)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  this.addSoilLayer(stTargetFieldGrid);
               }
               else if(a_1273 == 215 || a_1273 == 474)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  this.addSoilLayer(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_TWO_MOVE_UP:
               if(a_1273 == 230 || a_1273 == 490)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.addSoilLayer(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 239 || a_1273 == 498)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.addSoilLayer(stTargetFieldGrid);
               }
               else if(a_1273 == 247 || a_1273 == 506)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.addSoilLayer(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 256 || a_1273 == 515)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 6,m_stCurrentFieldGrid.m_iYGridNo);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 257 || a_1273 == 516)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 271 || a_1273 == 530)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 272 || a_1273 == 531)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 274 || a_1273 == 533)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 275 || a_1273 == 534)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 277 || a_1273 == 536)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 278 || a_1273 == 538)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 315 || a_1273 == 574)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 6,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  ClearFieldGridDefenseCard(stTargetFieldGrid);
               }
               else if(a_1273 == 296 || a_1273 == 556)
               {
                  if(this.m_ShoveShot != null)
                  {
                     this.m_ShoveShot.a_4350();
                  }
                  if(this.m_RadishShot != null)
                  {
                     this.m_RadishShot.a_4350();
                  }
               }
         }
         return true;
      }
      
      private function ActionSkillOne() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(this.randomField.length > 0)
         {
            stTargetFieldGrid = this.randomField.pop();
            stBaseMoveIntruder = RabbitThiefMoveIntruder.a_3926();
            if(Boolean(stBaseMoveIntruder) && Boolean(stTargetFieldGrid))
            {
               stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
               stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.EFFECTS_BASE_TYPE);
            }
         }
      }
      
      private function randomThiefMouse() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         while(iLoopCnt < 150 && iCnt < 3)
         {
            m_iXGridNo = m_stRandomSeed.nextInt(6) + 3;
            m_iYGridNo = m_stRandomSeed.nextInt(3) + 2;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null && this.randomField.indexOf(stTargetFieldGrid) == -1)
            {
               if(stTargetFieldGrid.a_3494() != null && !(stTargetFieldGrid.m_stAttackFighter is a_3924))
               {
                  this.randomField.push(stTargetFieldGrid);
                  iCnt++;
               }
            }
            iLoopCnt++;
         }
         for(var i:int = iCnt; i < 3; i++)
         {
            m_iXGridNo = m_stRandomSeed.nextInt(6) + 3;
            m_iYGridNo = m_stRandomSeed.nextInt(3) + 2;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null && this.randomField.indexOf(stTargetFieldGrid) == -1)
            {
               this.randomField.push(stTargetFieldGrid);
            }
         }
      }
      
      private function randomSmllHelloMouse() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         while(iLoopCnt < 150 && iCnt < 2)
         {
            m_iXGridNo = int(m_stRandomSeed.nextInt(2));
            m_iYGridNo = m_stRandomSeed.nextInt(5) + 1;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null && this.randomField.indexOf(stTargetFieldGrid) == -1)
            {
               if(stTargetFieldGrid.a_3494() != null && stTargetFieldGrid.m_iFieldGridType == 0 && !(stTargetFieldGrid.m_stAttackFighter is a_3924))
               {
                  this.randomField.push(stTargetFieldGrid);
                  iCnt++;
               }
            }
            iLoopCnt++;
         }
         for(var i:int = iCnt; i < 3; i++)
         {
            m_iXGridNo = int(m_stRandomSeed.nextInt(2));
            m_iYGridNo = m_stRandomSeed.nextInt(5) + 1;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            if(stTargetFieldGrid != null && stTargetFieldGrid.m_iFieldGridType == 0 && this.randomField.indexOf(stTargetFieldGrid) == -1)
            {
               this.randomField.push(stTargetFieldGrid);
            }
         }
      }
      
      private function addSmllHelloMouse(index:int) : void
      {
         var stFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(this.randomField.length < index + 1)
         {
            return;
         }
         stFieldGrid = this.randomField[index];
         this.a_3502(stFieldGrid);
         stBaseMoveIntruder = SmallHelloMouse.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            SmallHelloMouse(stBaseMoveIntruder).m_stParentMouse = this;
            stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return true;
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function addShoveShot() : void
      {
         var move_speed:Number = -15;
         if(a_1283)
         {
            move_speed = -move_speed;
         }
         if(m_stCurrentFieldGrid)
         {
            this.m_ShoveShot = ShovelEarthHoleShot.a_4344() as ShovelEarthHoleShot;
            this.m_ShoveShot.a_1598 = this.randomField[0];
            this.m_ShoveShot.a_1797(0,move_speed,1000000,m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 - 33,m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 - 123,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_ShoveShot,BattleLayerDefine.EFFECTS_BASE_TYPE);
         }
      }
      
      private function addRadishShot() : void
      {
         var move_speed:Number = -15;
         if(a_1283)
         {
            move_speed = -move_speed;
         }
         if(m_stCurrentFieldGrid)
         {
            this.m_RadishShot = RadishEarthHoleShot.a_4344() as RadishEarthHoleShot;
            this.m_RadishShot.a_1598 = this.randomField[1];
            this.m_RadishShot.a_1797(0,move_speed,1000000,m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 - 33,m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 - 123,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_RadishShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
      
      private function addSoilLayer(stTempFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stSoilLayerEffect:SoilLayerEffect = null;
         if(stTempFieldGrid != null)
         {
            ChangeToFieldGrid(stTempFieldGrid);
            this.a_3502(m_stCurrentFieldGrid);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
            if(Boolean(stTargetFieldGrid) && null != stTargetFieldGrid.m_stAttackFighter)
            {
               stTargetFieldGrid.m_stAttackFighter.a_3958(100);
               stSoilLayerEffect = SoilLayerEffect.a_3926();
               stSoilLayerEffect.a_1797(false);
               stSoilLayerEffect.a_3958 = 5;
               stSoilLayerEffect.x = stTargetFieldGrid.m_stAttackFighter.x;
               stSoilLayerEffect.y = stTargetFieldGrid.m_stAttackFighter.y;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSoilLayerEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTargetFieldGrid);
            }
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         return true;
      }
   }
}


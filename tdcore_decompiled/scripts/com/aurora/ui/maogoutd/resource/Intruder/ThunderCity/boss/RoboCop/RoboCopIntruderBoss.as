package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.boss.RoboCop
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
   
   public class RoboCopIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (0.15 * 10);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILLONE_PICKGUN:uint = 7;
      
      private static const STATE_SKILLONE_JUMP:uint = 8;
      
      private static const STATE_SKILLONE_RUN:uint = 9;
      
      private static const STATE_SKILLONE_OVER:uint = 10;
      
      private static const STATE_SKILLTWO_JUMP:uint = 11;
      
      private static const STATE_SKILLTWO_SHOT:uint = 12;
      
      private static const STATE_SKILLTHREE:uint = 13;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 14;
      
      private static const STATE_CHG_TOWARD:uint = 15;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_skillTwoOut_0:Array = new Array(1,3,6);
      
      private var m_skillTwoOut_1:Array = new Array(1,3,5);
      
      private var m_skillTwoOut_2:Array = new Array(0,2,4);
      
      private var m_skillTwoOut_3:Array = new Array(0,4,6);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      public function RoboCopIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width + 270;
         m_iYDisplayCenterPos = -8 + 22;
         a_1467 = 31;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RoboCopIntruderBoss) as RoboCopIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return RoboCopIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1271 = true;
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
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILLONE_PICKGUN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILLONE_JUMP + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILLONE_RUN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILLONE_OVER + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILLTWO_JUMP + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILLTWO_SHOT + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILLTHREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 9 + 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 9 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 9 + 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 9 + 3;
         m_dictBossStateFrameID[STATE_SKILLONE_PICKGUN + "_" + 1] = 9 + 4;
         m_dictBossStateFrameID[STATE_SKILLONE_JUMP + "_" + 1] = 9 + 5;
         m_dictBossStateFrameID[STATE_SKILLONE_RUN + "_" + 1] = 9 + 6;
         m_dictBossStateFrameID[STATE_SKILLONE_OVER + "_" + 1] = 9 + 7;
         m_dictBossStateFrameID[STATE_SKILLTWO_JUMP + "_" + 1] = 9 + 8;
         m_dictBossStateFrameID[STATE_SKILLTWO_SHOT + "_" + 1] = 9 + 9;
         m_dictBossStateFrameID[STATE_SKILLTHREE + "_" + 1] = 9 + 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 20;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,8,3,0]);
         m_vStateCache.push([STATE_SKILLONE_PICKGUN,9]);
         m_vStateCache.push([STATE_SKILLONE_JUMP,13,3,9]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.cityAlertSkill);
         m_vSkillFunction.push(this.PrecisionShoot);
         m_vSkillFunction.push(this.cityAlertSkill);
         m_vSkillFunction.push(this.ultimateTrial);
         m_vSkillFunction.push(this.PrecisionShoot);
         m_vSkillFunction.push(this.PrecisionShoot);
         m_vSkillFunction.push(this.cityAlertSkill);
         m_vSkillFunction.push(this.ultimateTrial);
      }
      
      private function cityAlertSkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILLONE_JUMP,13,1,8]);
         m_vStateCache.push([STATE_SKILLONE_RUN,-8,1]);
         m_vStateCache.push([STATE_SKILLONE_OVER,5]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILLONE_JUMP,-8,3,8]);
         m_vStateCache.push([STATE_SKILLONE_RUN,13,3]);
         m_vStateCache.push([STATE_SKILLONE_OVER,5]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_SKILLONE_JUMP,13,5,8]);
         m_vStateCache.push([STATE_SKILLONE_RUN,-8,5]);
         m_vStateCache.push([STATE_SKILLONE_OVER,5]);
      }
      
      private function PrecisionShoot() : void
      {
         m_vStateCache.length = 0;
         var index:int = int(m_stRandomSeed.nextInt(4));
         m_vStateCache.push([STATE_APPEAR,13,this["m_skillTwoOut_" + index.toString()][0],0]);
         m_vStateCache.push([STATE_SKILLTWO_JUMP,8,this["m_skillTwoOut_" + index.toString()][0],8]);
         m_vStateCache.push([STATE_SKILLTWO_SHOT,12]);
         m_vStateCache.push([STATE_SKILLTWO_JUMP,8,this["m_skillTwoOut_" + index.toString()][1],8]);
         m_vStateCache.push([STATE_SKILLTWO_SHOT,12]);
         m_vStateCache.push([STATE_SKILLTWO_JUMP,8,this["m_skillTwoOut_" + index.toString()][2],8]);
         m_vStateCache.push([STATE_SKILLTWO_SHOT,12]);
         m_vStateCache.push([STATE_WAITING,1.5 * 20]);
         m_vStateCache.push([STATE_SKILLTWO_JUMP,13,this["m_skillTwoOut_" + index.toString()][2],8]);
      }
      
      private function ultimateTrial() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,8,3,0]);
         m_vStateCache.push([STATE_SKILLTHREE,57]);
         m_vStateCache.push([STATE_WAITING,0.75 * 20]);
         m_vStateCache.push([STATE_SKILLTWO_JUMP,13,3,8]);
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         var fDistanceX:Number = NaN;
         var fDistanceY:Number = NaN;
         var fDistance:Number = NaN;
         var speed:Number = NaN;
         var iNextState:uint = 0;
         var MPosX:Number = NaN;
         var MPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         iNextState = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         this.SetIsCannotSee(true);
         a_1465 = 0;
         switch(iNextState)
         {
            case STATE_BORN:
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               iNextValue = 18;
               break;
            case STATE_APPEAR:
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               iNextValue = 0;
               break;
            case STATE_SKILLONE_PICKGUN:
            case STATE_SKILLTWO_SHOT:
            case STATE_SKILLTHREE:
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               break;
            case STATE_SKILLONE_JUMP:
            case STATE_SKILLTWO_JUMP:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               fDistanceX = fPosX - this.x;
               fDistanceY = fPosY - this.y;
               fDistance = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
               speed = fDistance / 8;
               iNextValue = setMoveToPosition(fPosX,fPosY,speed);
               break;
            case STATE_SKILLONE_RUN:
               MPosX = getPosXByXGridNo(m_vStateCache[0][1]);
               MPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(MPosX,MPosY);
               this.SetIsCannotSee(false);
               a_1465 = 3;
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
         if(this.a_1581 > 0 && m_iBossState == STATE_SKILLONE_JUMP)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
            if(bIsCanChangeToFieldGrid)
            {
            }
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
         }
         switch(m_iBossState)
         {
            case STATE_SKILLTWO_SHOT:
               if(m_stCurrentFieldGrid != null)
               {
                  if(a_1273 == 85 || a_1273 == 220)
                  {
                     this.addBlitzballShot(2);
                  }
                  else if(a_1273 == 90 || a_1273 == 225)
                  {
                     this.addBlitzballShot(1);
                  }
               }
               break;
            case STATE_SKILLTWO_JUMP:
               if(a_1273 == 82 || a_1273 == 217)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_BORN:
               if(a_1273 == 17)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILLTHREE:
               if(a_1273 == 115 || a_1273 == 250)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 116 || a_1273 == 251)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,3);
                  this.a_3502(stTargetFieldGrid);
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 117 || a_1273 == 252)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3);
                  this.a_3502(stTargetFieldGrid);
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 118 || a_1273 == 253)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 120 || a_1273 == 255)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 121 || a_1273 == 256)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,0);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 123 || a_1273 == 258)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,0);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 125 || a_1273 == 260)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,0);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 127 || a_1273 == 262)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 129 || a_1273 == 264)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 131 || a_1273 == 266)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 132 || a_1273 == 267)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 134 || a_1273 == 269)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,4);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 136 || a_1273 == 271)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,4);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 138 || a_1273 == 273)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,5);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 140 || a_1273 == 275)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,6);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 142 || a_1273 == 277)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,6);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 144 || a_1273 == 279)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,6);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 145 || a_1273 == 280)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,5);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 146 || a_1273 == 281)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,4);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 148 || a_1273 == 283)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,3);
                  this.a_3502(stTargetFieldGrid);
               }
         }
         return true;
      }
      
      private function addBlitzballShot(index:int) : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var m_iXGridNo:int = getXGridNoByPosX() - 1;
         var m_iYGridNo:int = getYGridNoByPosY();
         var move_speed:Number = -15;
         if(a_1283)
         {
            move_speed = -move_speed;
         }
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         if(stStartFieldGrid)
         {
            stLastWaitShot = RoboCopBossShot.a_4344();
            stLastWaitShot.m_isSpecial = index;
            stLastWaitShot.a_1797(0,move_speed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 - 33,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 33,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
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
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
         if(bIsCanChangeToFieldGrid && m_iBossState == STATE_SKILLONE_RUN)
         {
            if(m_stCurrentFieldGrid != null && (m_stCurrentFieldGrid.m_iXGridNo == 7 && m_stCurrentFieldGrid.m_iYGridNo == 1 || m_stCurrentFieldGrid.m_iXGridNo == 5 && m_stCurrentFieldGrid.m_iYGridNo == 3 || m_stCurrentFieldGrid.m_iXGridNo == 7 && m_stCurrentFieldGrid.m_iYGridNo == 5))
            {
               if(m_stCurrentFieldGrid.m_stMouseObstacle)
               {
                  m_stCurrentFieldGrid.m_stMouseObstacle.a_3432();
                  m_stCurrentFieldGrid.m_stMouseObstacle = null;
               }
               if(m_stCurrentFieldGrid.m_iFieldGridType == 0)
               {
                  this.actionSkillOne(m_stCurrentFieldGrid);
               }
            }
         }
      }
      
      private function actionSkillOne(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         stBaseMoveIntruder = RoboCopShieldMouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
         }
         return true;
      }
      
      private function randomFieldGrid(stFieldGrid:a_3491) : void
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
         return Boolean(m_iBossState == STATE_SKILLONE_PICKGUN || m_iBossState == STATE_SKILLONE_JUMP || m_iBossState == STATE_SKILLONE_RUN || m_iBossState == STATE_SKILLONE_OVER);
      }
      
      override protected function IsMoving() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILLONE_RUN || m_iBossState == STATE_SKILLONE_JUMP || m_iBossState == STATE_SKILLTWO_JUMP);
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
   }
}


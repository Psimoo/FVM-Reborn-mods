package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.MouseDeepSeaTrainDownLaserShot;
   import com.aurora.ui.maogoutd.resource.shot.MouseDeepSeaTrainForwardLaserShot;
   import com.aurora.ui.maogoutd.resource.shot.MouseDeepSeaTrainUpLaserShot;
   import flash.display.FrameLabel;
   
   public class DeepSeaTrainBodyMoveIntruder extends a_4206
   {
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      protected var a_1447:int;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var m_numXSpeed:Number = 0;
      
      protected var m_numYSpeed:Number = 0;
      
      protected var m_numHardRate:Number = 1;
      
      private var m_arrMovePathArray:Array = [0,0,0,2,2,0,0,0,2,2,2,0,0,0];
      
      private var m_iCurrentPathIndex:int;
      
      private var m_numLastChangePathXPos:Number;
      
      private var m_numLastChangePathYPos:Number;
      
      private var m_iAttackTimes:int = 0;
      
      public var m_iTrainNum:int;
      
      public function DeepSeaTrainBodyMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DeepSeaTrainBodyMoveIntruder) as DeepSeaTrainBodyMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DeepSeaTrainBodyMoveIntruderMovie;
      }
      
      override public function get numHardRate() : Number
      {
         return this.m_numHardRate;
      }
      
      override public function set numHardRate(value:Number) : void
      {
         this.m_numHardRate = value;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 100;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 100000;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.55;
         a_1467 = 0;
         this.a_1447 = 0;
         this.m_iCurrentPathIndex = 0;
         this.m_numLastChangePathXPos = 0;
         this.m_numLastChangePathYPos = 0;
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= this.m_numHardRate * 5000)
         {
            if(a_1339 <= 0)
            {
               if(a_1339 <= 0 && a_1275 != 16)
               {
                  a_1275 = 16;
                  gotoAndStop((a_1276[16] as FrameLabel).frame);
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  play();
               }
            }
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 != this.m_numHardRate * 5000)
         {
            if(a_1339 <= 0 && a_1275 != 16)
            {
               a_1275 = 16;
               gotoAndStop((a_1276[16] as FrameLabel).frame);
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               play();
            }
         }
         a_3419();
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var stMouseDeepSeaTrainForwardLaserShot:MouseDeepSeaTrainForwardLaserShot = null;
         var stMouseDeepSeaUpLaserShot:MouseDeepSeaTrainUpLaserShot = null;
         var stMouseDeepSeaTrainDownLaserShot:MouseDeepSeaTrainDownLaserShot = null;
         var numShotXPos:Number = NaN;
         var numShotYPos:Number = NaN;
         var stSummonUpMoveIntruder:a_4206 = null;
         var iMovePath:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(!a_1460)
         {
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 100000;
            a_1465 = 0;
            a_1463 = true;
            a_1460 = true;
            this.a_1447 = iCurrentTime;
            this.m_numXSpeed = a_3491.a_1080 / 500;
            this.m_numYSpeed = a_3491.a_1081 / 500;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1][BattleFieldView.a_1011 - 1];
            x = a_1283 ? 0 : BattleFieldView.a_1013;
            y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height);
            ChangeFieldGrid(stTargetFieldGrid);
         }
         var iShotHurtForEach:int = 0;
         var iShotMoveSpeed:int = 0;
         if(0 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1465 = 0;
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 200;
               visible = true;
               if(iCurrentTime - this.a_1447 == 0)
               {
                  if(0 == this.m_iTrainNum)
                  {
                     this.m_iPeriodTime = 360;
                  }
                  else if(1 == this.m_iTrainNum)
                  {
                     this.m_iPeriodTime = 200;
                  }
                  else if(2 == this.m_iTrainNum)
                  {
                     this.m_iPeriodTime = 40;
                  }
                  this.m_numXSpeed = a_3491.a_1080 / 80;
                  this.m_numYSpeed = a_3491.a_1081 / 80;
               }
               else
               {
                  this.m_iPeriodTime = 200;
                  this.m_numXSpeed = a_3491.a_1080 / 200;
                  this.m_numYSpeed = a_3491.a_1081 / 200;
               }
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != 0)
                  {
                     a_1275 = 0;
                     gotoAndStop((a_1276[0] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != 1)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[1] as FrameLabel).frame);
                  }
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(x >= a_3491.a_1080 * (BattleFieldView.a_1011 - 0.5) || x <= a_3491.a_1080 * 0.5)
               {
                  x -= this.m_numXSpeed;
               }
               else
               {
                  iMovePath = int(this.m_arrMovePathArray[this.m_iCurrentPathIndex]);
                  if(0 == iMovePath && Math.abs(this.m_numLastChangePathXPos - a_3491.a_1080) <= this.m_numXSpeed || (1 == iMovePath || 2 == iMovePath) && Math.abs(this.m_numLastChangePathYPos - a_3491.a_1081) <= this.m_numYSpeed)
                  {
                     ++this.m_iCurrentPathIndex;
                     this.m_numLastChangePathXPos = 0;
                     this.m_numLastChangePathYPos = 0;
                  }
                  if(0 == iMovePath)
                  {
                     x -= this.m_numXSpeed;
                     this.m_numLastChangePathXPos += this.m_numXSpeed;
                  }
                  else if(1 == iMovePath)
                  {
                     y -= this.m_numYSpeed;
                     this.m_numLastChangePathYPos += this.m_numYSpeed;
                  }
                  else if(2 == iMovePath)
                  {
                     y += this.m_numYSpeed;
                     this.m_numLastChangePathYPos += this.m_numYSpeed;
                  }
                  iXGridNo = int(x / a_3491.a_1080);
                  iYGridNo = int(y / a_3491.a_1081);
                  if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && iYGridNo >= 0 && iYGridNo < BattleFieldView.a_1012)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iYGridNo][iXGridNo];
                     ChangeFieldGrid(stTargetFieldGrid);
                     this.a_3502(stTargetFieldGrid);
                  }
               }
               if(!a_1283 && x <= -40 || a_1283 && x >= BattleFieldView.a_1013 + 40)
               {
                  if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
                  {
                     a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.bitmapData = stDisplayBitmap.bitmapData;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.x = x + stDisplayBitmap.x + (a_1283 ? 50 : -50);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.y = y + stDisplayBitmap.y;
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  if(!m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
                  {
                     iGlobalMoveFighterID = -1;
                  }
                  a_3940();
                  return true;
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               if(0 == this.m_iAttackTimes % 4)
               {
                  this.m_iBossStatus = 1;
                  this.m_iPeriodTime = 100000;
               }
               else if(1 == this.m_iAttackTimes % 4)
               {
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
               }
               else if(2 == this.m_iAttackTimes % 4)
               {
                  this.m_iBossStatus = 3;
                  this.m_iPeriodTime = 100000;
               }
               else if(3 == this.m_iAttackTimes % 4)
               {
                  this.m_iBossStatus = 4;
                  this.m_iPeriodTime = 100000;
               }
               ++this.m_iAttackTimes;
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 28;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(12 == this.m_iPeriodTime)
               {
                  stSummonUpMoveIntruder = a_4255.getInstance().a_4256(8388614);
                  if(stSummonUpMoveIntruder)
                  {
                     stSummonUpMoveIntruder.a_1797(0,-1);
                     stSummonUpMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stSummonUpMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stSummonUpMoveIntruder,m_stCurrentFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSummonUpMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
                     stSummonUpMoveIntruder.x = a_3491.a_1080 * (m_stCurrentFieldGrid.m_iXGridNo + 0.5);
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 100000;
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 100;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(20 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = 6;
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = 9;
                     gotoAndStop((a_1276[9] as FrameLabel).frame);
                  }
                  stMouseDeepSeaTrainForwardLaserShot = MouseDeepSeaTrainForwardLaserShot.a_4344() as MouseDeepSeaTrainForwardLaserShot;
                  if(null == stMouseDeepSeaTrainForwardLaserShot)
                  {
                     return false;
                  }
                  numShotXPos = -0.5 * width;
                  if(a_1283)
                  {
                     numShotXPos = -numShotXPos;
                  }
                  numShotXPos = x + numShotXPos;
                  numShotYPos = y + 0.1 * width;
                  stMouseDeepSeaTrainForwardLaserShot.a_1797(0,iShotMoveSpeed,iShotHurtForEach,numShotXPos,numShotYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stMouseDeepSeaTrainForwardLaserShot);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 100000;
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 28;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(12 == this.m_iPeriodTime)
               {
                  stSummonUpMoveIntruder = a_4255.getInstance().a_4256(8388627);
                  if(stSummonUpMoveIntruder)
                  {
                     stSummonUpMoveIntruder.a_1797(0,-1);
                     stSummonUpMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stSummonUpMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stSummonUpMoveIntruder,m_stCurrentFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSummonUpMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
                     stSummonUpMoveIntruder.x = a_3491.a_1080 * (m_stCurrentFieldGrid.m_iXGridNo + 0.5);
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 100000;
            }
         }
         if(4 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 4;
               this.m_iPeriodTime = 100;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[10] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 14;
                  gotoAndStop((a_1276[13] as FrameLabel).frame);
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(10 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = 12;
                     gotoAndStop((a_1276[12] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = 15;
                     gotoAndStop((a_1276[15] as FrameLabel).frame);
                  }
                  stMouseDeepSeaUpLaserShot = MouseDeepSeaTrainUpLaserShot.a_4344() as MouseDeepSeaTrainUpLaserShot;
                  if(null == stMouseDeepSeaUpLaserShot)
                  {
                     return false;
                  }
                  numShotXPos = -10;
                  if(a_1283)
                  {
                     numShotXPos = -numShotXPos;
                  }
                  numShotXPos = x + numShotXPos;
                  numShotYPos = y;
                  stMouseDeepSeaUpLaserShot.a_1797(0,iShotMoveSpeed,iShotHurtForEach,numShotXPos,numShotYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stMouseDeepSeaUpLaserShot);
                  stMouseDeepSeaTrainDownLaserShot = MouseDeepSeaTrainDownLaserShot.a_4344() as MouseDeepSeaTrainDownLaserShot;
                  if(null == stMouseDeepSeaTrainDownLaserShot)
                  {
                     return false;
                  }
                  numShotXPos = -10;
                  if(a_1283)
                  {
                     numShotXPos = -numShotXPos;
                  }
                  numShotXPos = x + numShotXPos;
                  numShotYPos = y + 0.8 * height;
                  stMouseDeepSeaTrainDownLaserShot.a_1797(0,iShotMoveSpeed,iShotHurtForEach,numShotXPos,numShotYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stMouseDeepSeaTrainDownLaserShot);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 100000;
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      protected function a_3955() : Number
      {
         return 0.02 * width;
      }
      
      protected function a_3956() : Number
      {
         return 0.05 * height;
      }
   }
}


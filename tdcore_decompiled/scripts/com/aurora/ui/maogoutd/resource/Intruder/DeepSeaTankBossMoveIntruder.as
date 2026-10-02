package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.MouseTankBossBoomShot;
   import com.aurora.ui.maogoutd.resource.shot.MouseTankBossUltrasonicWaveShot;
   import flash.display.FrameLabel;
   
   public class DeepSeaTankBossMoveIntruder extends a_4206
   {
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iAttackTimes:int = 0;
      
      protected var m_numXMoveSpeed:Number = 0;
      
      protected var m_numYMoveSpeed:Number = 0;
      
      protected var a_1309:int = 2;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 1000;
      
      protected var a_1312:int = 5;
      
      protected var a_1321:int = 0;
      
      protected var a_1324:Array = [];
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function DeepSeaTankBossMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DeepSeaTankBossMoveIntruder) as DeepSeaTankBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DeepSeaTankBossMoveIntruderMovie;
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
         a_1350 = a_3491.a_1080 / 500;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_iAttackTimes = 0;
         this.m_numXMoveSpeed = 0;
         this.m_numYMoveSpeed = 0;
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 100000;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.2;
         a_1467 = 20;
         this.a_1321 = 0;
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
               if(a_1339 <= 0 && a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
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
            if(a_1339 <= 0 && a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               play();
            }
         }
         a_3419();
         var stDataEvent:a_1778 = new a_1778("AurBossBloodProgress");
         stDataEvent.dataObject = a_1339 / (this.m_numHardRate * 15000);
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         var stDataEvent:a_1778 = new a_1778("AurBossBloodProgress");
         stDataEvent.dataObject = a_1339 / (this.m_numHardRate * 15000);
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
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
         var numShotXPos:Number = NaN;
         var stLastWaitShot:MouseTankBossBoomShot = null;
         var stLastWaitUltrasonicWaveShot:MouseTankBossUltrasonicWaveShot = null;
         var numShotYPos:Number = NaN;
         if(!a_1460)
         {
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 100000;
            a_1465 = 0;
            a_1463 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            a_1460 = true;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[3][BattleFieldView.a_1011 - 1];
            x = a_1283 ? 0 : BattleFieldView.a_1013;
            y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height);
            ChangeFieldGrid(stTargetFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
         }
         if(0 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1465 = 0;
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 200;
               visible = true;
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
               super.a_4216(iCurrentTime);
               if(iCurrentTime == a_1477 || a_1474 > 0 || Boolean(m_stCurrentFieldGrid) && Boolean(null != m_stCurrentFieldGrid.m_stBoomDefense))
               {
                  if(a_1474 > 0)
                  {
                     a_1474 = 0;
                  }
                  this.a_3502(m_stCurrentFieldGrid);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               if(0 == this.m_iAttackTimes % 3)
               {
                  this.m_iBossStatus = 1;
                  this.m_iPeriodTime = 100000;
               }
               else if(1 == this.m_iAttackTimes % 3)
               {
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
               }
               else if(2 == this.m_iAttackTimes % 3)
               {
                  this.m_iBossStatus = 3;
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
               this.m_iPeriodTime = 40;
               a_1465 = 0;
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
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime <= 30 && iCurrentTime >= this.a_1321 + this.a_1309)
               {
                  if(iCurrentTime >= this.a_1321 + this.a_1309)
                  {
                     this.a_1321 = iCurrentTime;
                     stLastWaitShot = MouseTankBossBoomShot.a_4344() as MouseTankBossBoomShot;
                     if(null == stLastWaitShot)
                     {
                        return false;
                     }
                     numShotXPos = 0.35 * width;
                     if(a_1283)
                     {
                        numShotXPos = -numShotXPos;
                     }
                     numShotXPos = x + numShotXPos + 10 * (this.m_iPeriodTime % 3);
                     stLastWaitShot.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 2)];
                     stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,numShotXPos,y + 0.2 * height,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                     parent.addChild(stLastWaitShot);
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 100000;
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 80;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 10)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = 0;
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
                  }
               }
               if(this.m_iPeriodTime == 6)
               {
                  stLastWaitUltrasonicWaveShot = MouseTankBossUltrasonicWaveShot.a_4344() as MouseTankBossUltrasonicWaveShot;
                  if(null == stLastWaitUltrasonicWaveShot)
                  {
                     return false;
                  }
                  numShotXPos = -20;
                  if(a_1283)
                  {
                     numShotXPos = -numShotXPos;
                  }
                  numShotXPos = x + numShotXPos;
                  stLastWaitUltrasonicWaveShot.m_iDirection = 0;
                  stLastWaitUltrasonicWaveShot.a_1797(0,this.a_1312,this.a_1311,numShotXPos,y + 0.4 * height,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLastWaitUltrasonicWaveShot);
                  stLastWaitUltrasonicWaveShot = MouseTankBossUltrasonicWaveShot.a_4344() as MouseTankBossUltrasonicWaveShot;
                  if(null == stLastWaitUltrasonicWaveShot)
                  {
                     return false;
                  }
                  numShotXPos = x + 100;
                  stLastWaitUltrasonicWaveShot.m_iDirection = 1;
                  stLastWaitUltrasonicWaveShot.a_1797(0,this.a_1312,this.a_1311,numShotXPos,y + 0.4 * height,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLastWaitUltrasonicWaveShot);
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 100000;
               }
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 80;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 10)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = 0;
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[7] as FrameLabel).frame);
                  }
               }
               if(this.m_iPeriodTime == 6)
               {
                  stLastWaitUltrasonicWaveShot = MouseTankBossUltrasonicWaveShot.a_4344() as MouseTankBossUltrasonicWaveShot;
                  if(null == stLastWaitUltrasonicWaveShot)
                  {
                     return false;
                  }
                  numShotXPos = 70;
                  if(a_1283)
                  {
                     numShotXPos = -numShotXPos;
                  }
                  numShotXPos = x + numShotXPos;
                  stLastWaitUltrasonicWaveShot.m_iDirection = 2;
                  stLastWaitUltrasonicWaveShot.a_1797(0,this.a_1312,this.a_1311,numShotXPos,y + 0.2 * height,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLastWaitUltrasonicWaveShot);
                  stLastWaitUltrasonicWaveShot = MouseTankBossUltrasonicWaveShot.a_4344() as MouseTankBossUltrasonicWaveShot;
                  if(null == stLastWaitUltrasonicWaveShot)
                  {
                     return false;
                  }
                  numShotYPos = y + 0.2 * height + 50;
                  stLastWaitUltrasonicWaveShot.m_iDirection = 3;
                  stLastWaitUltrasonicWaveShot.a_1797(0,this.a_1312,this.a_1311,numShotXPos,numShotYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLastWaitUltrasonicWaveShot);
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 100000;
               }
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
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
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


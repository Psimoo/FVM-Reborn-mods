package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.Earthquake;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import com.aurora.ui.maogoutd.resource.shot.MouseAirshipBossLaserShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AirshipBossMouseMoveIntruder extends a_4206
   {
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var m_numXMoveSpeed:Number = 0;
      
      protected var m_numYMoveSpeed:Number = 0;
      
      protected var m_numXTargetPos:Number = 0;
      
      protected var m_numYTargetPos:Number = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_stBackFieldGrid:a_3491;
      
      private var m_stBackFieldGridPosition:a_3491;
      
      private var m_iAttackTimes:int = 0;
      
      protected var a_1309:int = 10;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 1000;
      
      protected var a_1312:int = 15;
      
      protected var a_1321:int = 0;
      
      protected var a_1324:Array = [];
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var m_numHardRate:Number = 1;
      
      private var iShotNum:int = 0;
      
      public function AirshipBossMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AirshipBossMouseMoveIntruder) as AirshipBossMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return AirshipBossMouseMoveIntruderMovie;
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
         a_1350 = a_3491.a_1080 / 50;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1462 = false;
         a_1463 = true;
         this.m_iBossStatus = -1;
         this.a_1598 = null;
         this.m_stBackFieldGrid = null;
         this.m_stBackFieldGridPosition = null;
         this.m_iPeriodTime = 24;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         this.m_iAttackTimes = 0;
         a_1279 = -width * 0.1;
         a_1465 = 3;
         a_1481 = false;
         a_1463 = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= this.m_numHardRate * 5000)
         {
            if(a_1339 > 0)
            {
               if(1 == this.m_iBossStatus)
               {
                  this.SetAnimation2(20);
               }
               else if(4 == this.m_iBossStatus)
               {
                  this.SetAnimation2(15);
               }
            }
            else if(a_1339 <= 0)
            {
               this.SetAnimation2(21);
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               play();
            }
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
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
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
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
      
      protected function ChangePos(fOffsetX:Number, fOffsetY:Number) : void
      {
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         if(Math.abs(fOffsetX) > 0)
         {
            x += fOffsetX;
            if(a_1283)
            {
               iXGridNo = int((BattleFieldView.a_1013 - x) / a_3491.a_1080);
            }
            else
            {
               iXGridNo = int(x / a_3491.a_1080);
            }
         }
         if(Math.abs(fOffsetY) > 0)
         {
            y += fOffsetY;
            if(a_1283)
            {
               iYGridNo = int((BattleFieldView.a_1014 - y) / a_3491.a_1081);
            }
            else
            {
               iYGridNo = int(y / a_3491.a_1081);
            }
         }
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
         }
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            a_3940();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var stEarthquake:Earthquake = null;
         var xIndex:int = 0;
         var stLastWaitShot:MouseAirshipBossShot = null;
         var numShotXpos:Number = NaN;
         var stLaserShot:a_4348 = null;
         if(!a_1460)
         {
            this.m_iAttackTimes = 0;
            a_1460 = true;
            SetCannotSeeByFighter(true);
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         if(this.m_iBossStatus == -1)
         {
            if(24 == this.m_iPeriodTime)
            {
               this.ChangePos(-a_3491.a_1080,0);
            }
            --this.m_iPeriodTime;
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 0;
               SetCannotSeeByFighter(false);
               return true;
            }
            return true;
         }
         if(0 == this.m_iBossStatus)
         {
            if(null == this.a_1598)
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 3)];
               if(this.a_1598.m_iYGridNo == 0)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1][this.a_1598.m_iXGridNo];
               }
               this.SetAnimationOnce2Loop(1,2,3,4);
               this.m_iPeriodTime = 120;
               this.m_numXTargetPos = x + (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080;
               this.m_numYTargetPos = y + (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 60)
               {
                  this.SetAnimation(5,6);
                  this.m_numXMoveSpeed = (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080 / 60;
                  this.m_numYMoveSpeed = (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081 / 60;
               }
               if(this.m_iPeriodTime > 0 && this.m_iPeriodTime <= 60)
               {
                  this.ChangePos(this.m_numXMoveSpeed,this.m_numYMoveSpeed);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.ChangePos(this.m_numXTargetPos - x,this.m_numYTargetPos - y);
               this.SetAnimationOnce2Loop(17,18,19,20);
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 100;
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 70)
               {
                  ChangeFieldGrid(this.a_1598);
                  this.a_1598 = null;
                  a_1465 = 0;
                  stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                  yStart = m_stCurrentFieldGrid.m_iYGridNo - 2 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 2);
                  xStart = m_stCurrentFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 2);
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        this.a_3502(stFieldGridVector[yIndex][xIndex],true);
                     }
                  }
                  stEarthquake = Earthquake.a_3926();
                  if(stEarthquake)
                  {
                     stEarthquake.a_1797(false);
                     stEarthquake.x = a_3491.a_1080 * m_stCurrentFieldGrid.m_iXGridNo + (a_3491.a_1080 - stEarthquake.width) + 150;
                     stEarthquake.y = a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - stEarthquake.height) + 80;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEarthquake,BattleLayerDefine.EFFECTS_BASE_TYPE,m_stCurrentFieldGrid);
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_stBackFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 1];
                  if(!this.m_stBackFieldGridPosition)
                  {
                     this.m_stBackFieldGridPosition = new a_3491(this.m_stBackFieldGrid.m_stCurrentBattbleFieldView,this.m_stBackFieldGrid.m_iXGridNo,this.m_stBackFieldGrid.m_iYGridNo);
                  }
                  else
                  {
                     this.m_stBackFieldGridPosition.m_iXGridNo = this.m_stBackFieldGrid.m_iXGridNo;
                     this.m_stBackFieldGridPosition.m_iYGridNo = this.m_stBackFieldGrid.m_iYGridNo;
                  }
                  if(this.m_stBackFieldGridPosition.m_iYGridNo == 0)
                  {
                     this.m_stBackFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1][this.m_stBackFieldGrid.m_iXGridNo];
                     this.m_stBackFieldGridPosition.m_iXGridNo = this.m_stBackFieldGrid.m_iXGridNo;
                     this.m_stBackFieldGridPosition.m_iYGridNo = this.m_stBackFieldGrid.m_iYGridNo;
                  }
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 120;
                  this.m_numXTargetPos = x + (this.m_stBackFieldGridPosition.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080;
                  this.m_numYTargetPos = y + (this.m_stBackFieldGridPosition.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081;
                  a_1465 = 3;
                  this.SetAnimationOnce2Loop(1,2,3,4);
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 60)
               {
                  this.SetAnimation(7,8);
                  this.m_numXMoveSpeed = (this.m_stBackFieldGridPosition.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080 / 60;
                  this.m_numYMoveSpeed = (this.m_stBackFieldGridPosition.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081 / 60;
               }
               if(this.m_iPeriodTime > 0 && this.m_iPeriodTime <= 60)
               {
                  this.ChangePos(this.m_numXMoveSpeed,this.m_numYMoveSpeed);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.ChangePos(this.m_numXTargetPos - x,this.m_numYTargetPos - y);
               if(this.m_iAttackTimes % 2 == 0)
               {
                  this.SetAnimationOnce2Loop(9,11,10,12);
                  this.m_iBossStatus = 3;
                  this.m_iPeriodTime = 130;
               }
               else
               {
                  this.SetAnimationOnce2Loop(9,13,10,15);
                  this.m_iBossStatus = 4;
                  this.m_iPeriodTime = 180;
               }
               ++this.m_iAttackTimes;
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 100)
               {
                  this.m_stBackFieldGrid = this.m_stBackFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stBackFieldGridPosition.m_iYGridNo][this.m_stBackFieldGridPosition.m_iXGridNo];
                  ChangeFieldGrid(this.m_stBackFieldGrid);
                  this.m_stBackFieldGrid = null;
                  a_1465 = 0;
                  stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                  yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
                  xStart = m_stCurrentFieldGrid.m_iXGridNo;
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo;
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        this.a_3502(stFieldGridVector[yIndex][xIndex],true);
                     }
                  }
               }
               if(this.m_iPeriodTime == 92)
               {
                  this.a_1321 = iCurrentTime;
                  this.iShotNum = 0;
               }
               if(this.m_iPeriodTime < 92 && this.m_iPeriodTime > 60 && iCurrentTime >= this.a_1321 + this.a_1309)
               {
                  if(iCurrentTime >= this.a_1321 + this.a_1309)
                  {
                     this.a_1321 = iCurrentTime;
                     stLastWaitShot = MouseAirshipBossShot.a_4344();
                     if(null == stLastWaitShot)
                     {
                        return false;
                     }
                     this.a_1324.push(stLastWaitShot);
                  }
                  if(iCurrentTime - this.a_1321 == this.a_1310 && this.a_1324.length > 0)
                  {
                     numShotXpos = this.a_3955();
                     if(a_1283)
                     {
                        numShotXpos = -numShotXpos;
                     }
                     stLastWaitShot = this.a_1324.pop();
                     if(this.iShotNum == 0)
                     {
                        stLastWaitShot.iShotNum = 1;
                     }
                     else if(this.iShotNum == 1)
                     {
                        stLastWaitShot.iShotNum = 3;
                     }
                     else if(this.iShotNum == 2)
                     {
                        stLastWaitShot.iShotNum = 5;
                     }
                     ++this.iShotNum;
                     stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956(),m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                     parent.addChild(stLastWaitShot);
                  }
               }
               if(this.m_iPeriodTime == 60)
               {
                  stop();
               }
               if(0 == this.m_iPeriodTime)
               {
                  play();
                  this.m_iBossStatus = 0;
                  this.a_1598 = null;
                  this.m_stBackFieldGrid = null;
                  a_1465 = 3;
               }
            }
         }
         if(4 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 100)
               {
                  this.m_stBackFieldGrid = this.m_stBackFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stBackFieldGridPosition.m_iYGridNo][this.m_stBackFieldGridPosition.m_iXGridNo];
                  ChangeFieldGrid(this.m_stBackFieldGrid);
                  this.m_stBackFieldGrid = null;
                  a_1465 = 0;
               }
               if(this.m_iPeriodTime == 20)
               {
                  stLaserShot = MouseAirshipBossLaserShot.a_4344();
                  stLaserShot.a_1797(0,this.a_1312,this.a_1311,x - 10,y + 90,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLaserShot);
                  this.SetAnimation(14,16);
               }
               if(this.m_iPeriodTime == 10)
               {
                  stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                  yStart = m_stCurrentFieldGrid.m_iYGridNo;
                  xStart = 0;
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo;
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        this.a_3502(stFieldGridVector[yIndex][xIndex]);
                     }
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 0;
                  this.a_1598 = null;
                  this.m_stBackFieldGrid = null;
                  a_1465 = 3;
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
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
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
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      protected function a_3955() : Number
      {
         return 0.03 * width;
      }
      
      protected function a_3956() : Number
      {
         return 0.01 * height;
      }
      
      public function SetAnimation(animIdx:int, damageAnimIdx:int) : void
      {
         if(a_1339 > this.m_numHardRate * 5000)
         {
            this.SetAnimation2(animIdx);
         }
         else if(a_1339 > 0)
         {
            this.SetAnimation2(damageAnimIdx);
         }
      }
      
      public function SetAnimationOnce2Loop(animOnceIdx:int, animLoopIdx:*, damageOnceIdx:int, damageLoopIdx:int) : void
      {
         if(a_1339 > this.m_numHardRate * 5000)
         {
            this.SetAnimationOnce2Loop2(animOnceIdx,animLoopIdx);
         }
         else if(a_1339 > 0)
         {
            this.SetAnimationOnce2Loop2(damageOnceIdx,damageLoopIdx);
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}


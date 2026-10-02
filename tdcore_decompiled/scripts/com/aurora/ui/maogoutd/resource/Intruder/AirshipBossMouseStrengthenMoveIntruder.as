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
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import com.aurora.ui.maogoutd.resource.shot.MouseAirshipBossLaserShot;
   import com.aurora.ui.maogoutd.resource.shot.MouseAirshipBossShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AirshipBossMouseStrengthenMoveIntruder extends a_4206
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
      
      public function AirshipBossMouseStrengthenMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AirshipBossMouseStrengthenMoveIntruder) as AirshipBossMouseStrengthenMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return AirshipBossMouseStrengthenMoveIntruderMovie;
      }
      
      override public function get numHardRate() : Number
      {
         return this.m_numHardRate;
      }
      
      override public function set numHardRate(value:Number) : void
      {
         this.m_numHardRate = value;
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
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
         }
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
         this.m_iBossStatus = 0;
         this.a_1598 = null;
         this.m_stBackFieldGrid = null;
         this.m_iPeriodTime = 24;
         this.m_stBackFieldGridPosition = null;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         this.m_iAttackTimes = 0;
         a_1279 = -width * 0.1;
         a_1465 = 3;
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
                  if(a_1275 != 20)
                  {
                     a_1275 = 20;
                     gotoAndStop((a_1276[20] as FrameLabel).frame);
                  }
               }
               else if(4 == this.m_iBossStatus)
               {
                  if(a_1275 != 15)
                  {
                     a_1275 = 15;
                     gotoAndStop((a_1276[15] as FrameLabel).frame);
                  }
               }
            }
            else if(a_1339 <= 0 && a_1275 != 21)
            {
               a_1275 = 21;
               gotoAndStop((a_1276[21] as FrameLabel).frame);
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
         if(a_1339 == this.m_numHardRate * 5000)
         {
            if(1 == this.m_iBossStatus)
            {
               if(a_1275 != 20)
               {
                  a_1275 = 20;
                  gotoAndStop((a_1276[20] as FrameLabel).frame);
               }
            }
            else if(4 == this.m_iBossStatus)
            {
               if(a_1275 != 15)
               {
                  a_1275 = 15;
                  gotoAndStop((a_1276[15] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != 21)
         {
            a_1275 = 21;
            gotoAndStop((a_1276[21] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
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
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var stLaserShot:a_4348 = null;
         if(!a_1460)
         {
            if(24 == this.m_iPeriodTime)
            {
               x -= a_3491.a_1080;
            }
            --this.m_iPeriodTime;
            if(this.m_iPeriodTime > 0)
            {
               return true;
            }
            this.m_iAttackTimes = 0;
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(770 == iMapID)
               {
                  this.m_numHardRate = 0.8;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.7;
                  }
               }
               else if(1025 == iMapID)
               {
                  this.m_numHardRate = 0.9;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.8;
                  }
               }
               else if(1793 == iMapID)
               {
                  this.m_numHardRate = 0.9;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.8;
                  }
               }
               else if(2305 == iMapID)
               {
                  this.m_numHardRate = 1.2;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1;
                  }
               }
               a_1339 *= this.m_numHardRate;
            }
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
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
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != 2)
                  {
                     a_1275 = 2;
                     gotoAndStop((a_1276[1] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != 4)
                  {
                     a_1275 = 4;
                     gotoAndStop((a_1276[3] as FrameLabel).frame);
                  }
               }
               this.m_iPeriodTime = 110;
               this.m_numXTargetPos = x + (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080;
               this.m_numYTargetPos = y + (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 80)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != 5)
                     {
                        a_1275 = 5;
                        gotoAndStop((a_1276[5] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != 6)
                     {
                        a_1275 = 6;
                        gotoAndStop((a_1276[6] as FrameLabel).frame);
                     }
                  }
                  this.m_numXMoveSpeed = (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080 / 80;
                  this.m_numYMoveSpeed = (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081 / 80;
               }
               if(this.m_iPeriodTime > 0 && this.m_iPeriodTime <= 80)
               {
                  this.ChangePos(this.m_numXMoveSpeed,this.m_numXMoveSpeed);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.ChangePos(this.m_numXTargetPos - x,this.m_numYTargetPos - y);
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != 18)
                  {
                     a_1275 = 18;
                     gotoAndStop((a_1276[17] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != 20)
                  {
                     a_1275 = 20;
                     gotoAndStop((a_1276[19] as FrameLabel).frame);
                  }
               }
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 50;
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 20)
               {
                  ChangeFieldGrid(this.a_1598);
                  this.a_1598 = null;
                  a_1465 = 0;
                  stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                  yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
                  xStart = m_stCurrentFieldGrid.m_iXGridNo;
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo;
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 1);
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        this.a_3502(stFieldGridVector[yIndex][xIndex],true);
                     }
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
                  this.m_iPeriodTime = 160;
                  this.m_numXTargetPos = x + (this.m_stBackFieldGridPosition.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080;
                  this.m_numYTargetPos = y + (this.m_stBackFieldGridPosition.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081;
                  a_1465 = 3;
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != 2)
                     {
                        a_1275 = 2;
                        gotoAndStop((a_1276[1] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != 4)
                     {
                        a_1275 = 4;
                        gotoAndStop((a_1276[3] as FrameLabel).frame);
                     }
                  }
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 80)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != 7)
                     {
                        a_1275 = 7;
                        gotoAndStop((a_1276[7] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != 8)
                     {
                        a_1275 = 8;
                        gotoAndStop((a_1276[8] as FrameLabel).frame);
                     }
                  }
                  this.m_numXMoveSpeed = (this.m_stBackFieldGridPosition.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080 / 80;
                  this.m_numYMoveSpeed = (this.m_stBackFieldGridPosition.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081 / 80;
               }
               if(this.m_iPeriodTime > 0 && this.m_iPeriodTime <= 80)
               {
                  this.ChangePos(this.m_numXMoveSpeed,this.m_numYMoveSpeed);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.ChangePos(this.m_numXTargetPos - x,this.m_numYTargetPos - y);
               if(this.m_iAttackTimes % 2 == 0)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != 11)
                     {
                        a_1275 = 11;
                        gotoAndStop((a_1276[9] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != 12)
                     {
                        a_1275 = 12;
                        gotoAndStop((a_1276[10] as FrameLabel).frame);
                     }
                  }
                  this.m_iBossStatus = 3;
                  this.m_iPeriodTime = 90;
               }
               else
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != 13)
                     {
                        a_1275 = 13;
                        gotoAndStop((a_1276[9] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != 15)
                     {
                        a_1275 = 15;
                        gotoAndStop((a_1276[10] as FrameLabel).frame);
                     }
                  }
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
               if(this.m_iPeriodTime == 60)
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
               if(this.m_iPeriodTime == 52)
               {
                  this.a_1321 = iCurrentTime;
               }
               if(this.m_iPeriodTime < 52 && this.m_iPeriodTime > 20 && iCurrentTime >= this.a_1321 + this.a_1309)
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
                     stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956(),m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                     parent.addChild(stLastWaitShot);
                  }
               }
               if(this.m_iPeriodTime == 20)
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
               if(this.m_iPeriodTime == 60)
               {
                  stLaserShot = MouseAirshipBossLaserShot.a_4344();
                  stLaserShot.a_1797(0,this.a_1312,this.a_1311,x - 10,y + 90,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLaserShot);
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != 14)
                     {
                        a_1275 = 14;
                        gotoAndStop((a_1276[14] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != 16)
                     {
                        a_1275 = 16;
                        gotoAndStop((a_1276[16] as FrameLabel).frame);
                     }
                  }
               }
               if(this.m_iPeriodTime == 50)
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
   }
}


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
   import com.aurora.ui.maogoutd.resource.shot.MouseOctopusInkShot;
   import flash.display.FrameLabel;
   
   public class OctopusCowboyBossMoveIntruder extends a_4206
   {
      
      private var m_stOctopusCowboyBossDropDownTentacleMoveIntruder:OctopusCowboyBossDropDownTentacleMoveIntruder;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iChangeFireWizardLableIndex:int = 0;
      
      private var m_iAttackTimes:int = 0;
      
      protected var m_numXMoveSpeed:Number = 0;
      
      protected var m_numYMoveSpeed:Number = 0;
      
      protected var a_1309:int = 6;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 1000;
      
      protected var a_1312:int = 15;
      
      protected var a_1321:int = 0;
      
      private var a_1324:Array = [];
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var m_numHardRate:Number = 1;
      
      public function OctopusCowboyBossMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(OctopusCowboyBossMoveIntruder) as OctopusCowboyBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return OctopusCowboyBossMoveIntruderMovie;
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
         a_1350 = a_3491.a_1080 / 10;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1462 = true;
         a_1463 = true;
         this.m_iChangeFireWizardLableIndex = 0;
         this.m_iAttackTimes = 0;
         this.m_numXMoveSpeed = 0.5;
         this.m_numYMoveSpeed = 0;
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 400;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.2;
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
               if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 11)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 11] as FrameLabel).frame);
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
            if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 11)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + 11;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 11] as FrameLabel).frame);
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
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stNewDropDownTetacleMoveIntruder:OctopusCowboyBossDropDownTentacleMoveIntruder = null;
         var stLastWaitShot:MouseOctopusInkShot = null;
         var numShotXpos:Number = NaN;
         var numShotYPos:Number = NaN;
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var y:int = 0;
         var x:int = 0;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(260 == iMapID)
               {
                  this.m_numHardRate = 1.25;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1;
                  }
               }
               else if(772 == iMapID)
               {
                  this.m_numHardRate = 1.25;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1;
                  }
               }
               else if(2819 == iMapID)
               {
                  this.m_numHardRate = 1.4;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.1;
                  }
               }
               a_1339 *= this.m_numHardRate;
            }
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 400;
            a_1465 = 2;
            a_1275 = this.m_iChangeFireWizardLableIndex + 0;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,iCurrentTime + m_stCurrentFieldGrid.m_iYGridNo);
            a_1460 = true;
            m_isLifeCorrected = true;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_BOTTOM_TYPE,m_stCurrentFieldGrid);
            a_1339 = 150000000;
         }
         if(0 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime % 100 == 0 || x < 10 || x > BattleFieldView.a_1013 - 40 || y < 10 || y > BattleFieldView.a_1014 - 40)
               {
                  this.m_numXMoveSpeed = (this.m_stRandomSeed.nextInt(150) - 100) * 0.02;
                  this.m_numYMoveSpeed = (this.m_stRandomSeed.nextInt(200) - 100) * 0.02;
                  if(x < 10)
                  {
                     this.m_numXMoveSpeed = 2;
                  }
                  else if(x > BattleFieldView.a_1013 - 40)
                  {
                     this.m_numXMoveSpeed = -2;
                  }
                  if(y < 10)
                  {
                     this.m_numYMoveSpeed = 2;
                  }
                  else if(y > BattleFieldView.a_1013 - 40)
                  {
                     this.m_numYMoveSpeed = -2;
                  }
               }
               x += this.m_numXMoveSpeed;
               y += this.m_numYMoveSpeed;
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 100;
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 4)];
               stNewDropDownTetacleMoveIntruder = OctopusCowboyBossDropDownTentacleMoveIntruder.a_3926() as OctopusCowboyBossDropDownTentacleMoveIntruder;
               stNewDropDownTetacleMoveIntruder.a_1797(0,-1);
               stNewDropDownTetacleMoveIntruder.iGlobalMoveFighterID = this.a_4265();
               stNewDropDownTetacleMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               stNewDropDownTetacleMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stNewDropDownTetacleMoveIntruder.width) + a_3491.a_1080 * 0.8;
               stNewDropDownTetacleMoveIntruder.y = stNewDropDownTetacleMoveIntruder.iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stNewDropDownTetacleMoveIntruder.height);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stNewDropDownTetacleMoveIntruder,stTargetFieldGrid);
               stTargetFieldGrid.a_3459(stNewDropDownTetacleMoveIntruder);
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               if(!m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_byIsEnterBossBattle)
               {
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 400;
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
               }
               else
               {
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
                  play();
                  if(a_1339 > 1500000)
                  {
                     a_1339 = 15000 * this.m_numHardRate;
                  }
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               SetCannotSeeByFighter(true);
               a_1463 = true;
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 24;
               a_1465 = 0;
               gotoAndStop(1);
               if(0 == this.m_iAttackTimes % 2)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 1)][BattleFieldView.a_1011 - 1];
               }
               else
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 1)][1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 3)];
               }
               x = a_3491.a_1080 * this.a_1598.m_iXGridNo + (a_3491.a_1080 - this.width);
               y = iYPosSkewing + a_3491.a_1081 * this.a_1598.m_iYGridNo + (a_3491.a_1081 - this.height);
               this.a_1598.a_3459(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
               this.a_3502(this.a_1598);
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 1)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 2)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
                  }
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(0 == this.m_iPeriodTime)
               {
                  if(0 == this.m_iAttackTimes % 2)
                  {
                     if(a_1339 > this.m_numHardRate * 5000)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                        }
                     }
                     else if(a_1339 > 0)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                        }
                     }
                     this.m_iBossStatus = 4;
                     this.m_iPeriodTime = 180;
                  }
                  else if(1 == this.m_iAttackTimes % 2)
                  {
                     if(a_1339 > this.m_numHardRate * 5000)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                        }
                     }
                     else if(a_1339 > 0)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 8)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
                        }
                     }
                     this.m_iBossStatus = 5;
                     this.m_iPeriodTime = 150;
                  }
                  ++this.m_iAttackTimes;
                  a_1465 = 0;
                  SetCannotSeeByFighter(false);
               }
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
               {
                  stop();
                  y = -200;
               }
               if(100 == this.m_iPeriodTime)
               {
                  if(m_stCurrentFieldGrid)
                  {
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[m_stCurrentFieldGrid.m_iYGridNo] = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[m_stCurrentFieldGrid.m_iYGridNo] - 1;
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 100;
                  a_1465 = 2;
                  play();
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  x = a_3491.a_1080 * m_stCurrentFieldGrid.m_iXGridNo + (a_3491.a_1080 - this.width);
                  y = iYPosSkewing + a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.height);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_BOTTOM_TYPE,m_stCurrentFieldGrid);
               }
            }
         }
         if(4 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime > 100 && (this.m_iPeriodTime - 10) % 18 == 0)
               {
                  stLastWaitShot = MouseOctopusInkShot.a_4344() as MouseOctopusInkShot;
                  if(null != stLastWaitShot)
                  {
                     numShotXpos = a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5) - 110;
                     numShotYPos = a_3491.a_1081 * (this.a_1598.m_iYGridNo + 0.5) - 50;
                     stLastWaitShot.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(5)];
                     stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,numShotXpos,numShotYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                     parent.addChild(stLastWaitShot);
                  }
               }
               if(100 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 10)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
                     }
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 60;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 4)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                  }
               }
            }
         }
         if(5 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(128 == this.m_iPeriodTime)
               {
                  stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                  yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
                  xStart = m_stCurrentFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 1);
                  for(y = yStart; y <= yEnd; y++)
                  {
                     for(x = xStart; x <= xEnd; x++)
                     {
                        if(x == m_stCurrentFieldGrid.m_iXGridNo || y == m_stCurrentFieldGrid.m_iYGridNo)
                        {
                           this.a_3502(stFieldGridVector[y][x]);
                        }
                     }
                  }
               }
               if(100 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 10)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
                     }
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 60;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 4)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                  }
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
         return true;
      }
      
      protected function a_3955() : Number
      {
         return -0.3 * width;
      }
      
      protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}


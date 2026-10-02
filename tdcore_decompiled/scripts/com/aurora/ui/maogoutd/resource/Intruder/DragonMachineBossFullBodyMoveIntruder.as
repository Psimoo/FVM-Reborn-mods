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
   import flash.display.FrameLabel;
   
   public class DragonMachineBossFullBodyMoveIntruder extends a_4206
   {
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iChangeFireWizardLableIndex:int = 0;
      
      private var m_stDrogonMachineBossUpperBodyMoveIntruder:a_4206;
      
      private var m_stDrogonMachineBossLowerBodyMoveIntruder:a_4206;
      
      private var m_iAttackTimes:int = 0;
      
      protected var m_numXMoveSpeed:Number = 0;
      
      protected var m_numYMoveSpeed:Number = 0;
      
      protected var a_1309:int = 6;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 1000;
      
      protected var a_1312:int = 15;
      
      protected var a_1321:int = 0;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function DragonMachineBossFullBodyMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DragonMachineBossFullBodyMoveIntruder) as DragonMachineBossFullBodyMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonMachineBossFullBodyMoveIntruderMovie;
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
         this.m_iChangeFireWizardLableIndex = 0;
         this.m_iAttackTimes = 0;
         this.m_numXMoveSpeed = 0.5;
         this.m_numYMoveSpeed = 0;
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 100000;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.35;
         a_1467 = 20;
         this.a_1321 = 0;
         this.m_stDrogonMachineBossUpperBodyMoveIntruder = null;
         this.m_stDrogonMachineBossLowerBodyMoveIntruder = null;
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
               if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 24)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 24;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 24] as FrameLabel).frame);
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
            if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 24)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + 24;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 24] as FrameLabel).frame);
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
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var stPosFieldGrid:a_3491 = null;
         var stFieldGrid:a_3491 = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stDragonMachineBossFullBodyNozzlesIntruder:DragonMachineBossFullBodyNozzlesIntruder = null;
         var iIndex1:int = 0;
         var stDragonMachineBossFullBodyMagmaIntruder:DragonMachineBossFullBodyMagmaIntruder = null;
         var iIndex2:int = 0;
         var iIndex3:int = 0;
         var stDragonMachineBossFullBodyTailIntruder:DragonMachineBossFullBodyTailIntruder = null;
         var isSquare:Boolean = false;
         var iYIndex1:int = 0;
         var iXIndex1:int = 0;
         var stPosFieldGrid0:a_3491 = null;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(2054 == iMapID)
               {
                  this.m_numHardRate = 2.3;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 2;
                  }
               }
               a_1339 *= this.m_numHardRate;
            }
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 100000;
            a_1465 = 0;
            a_1463 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            a_1460 = true;
         }
         if(0 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1465 = 0;
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 200;
               visible = false;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(160 == this.m_iPeriodTime)
               {
                  visible = true;
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 1)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
                     }
                  }
               }
               if(70 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                     }
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 100000;
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 140;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 14;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 14] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(127 == this.m_iPeriodTime)
               {
                  stop();
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 3)];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(107 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
                  play();
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 17] as FrameLabel).frame);
                  }
               }
               if(99 == this.m_iPeriodTime)
               {
                  stPosFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stPosFieldGrid)
                  {
                     this.a_3502(stPosFieldGrid);
                  }
                  this.a_3502(m_stCurrentFieldGrid);
               }
               if(78 == this.m_iPeriodTime)
               {
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3466();
               }
               if(72 == this.m_iPeriodTime)
               {
                  yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
                  xStart = m_stCurrentFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 1);
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
                        this.a_3502(stFieldGrid);
                     }
                  }
               }
               if(76 == this.m_iPeriodTime)
               {
                  for(iIndex1 = 0; iIndex1 < 3; iIndex1++)
                  {
                  }
               }
               if(63 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 15;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 14] as FrameLabel).frame);
                  }
               }
               if(41 == this.m_iPeriodTime)
               {
                  visible = false;
               }
               if(23 == this.m_iPeriodTime)
               {
                  visible = true;
                  gotoAndStop(1);
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[2 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 2)][BattleFieldView.a_1011 - 4];
                  x = a_1283 ? a_3491.a_1080 * 3 : BattleFieldView.a_1013 - a_3491.a_1080 * 3;
                  y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height);
                  ChangeFieldGrid(stTargetFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 17;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 16] as FrameLabel).frame);
                  }
               }
               if(this.m_numXMoveSpeed != 0)
               {
                  x += this.m_numXMoveSpeed;
               }
               if(this.m_numYMoveSpeed != 0)
               {
                  y += this.m_numYMoveSpeed;
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 140;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 20;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 18] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 21;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 19] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(100 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 22] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 23] as FrameLabel).frame);
                  }
               }
               if(83 == this.m_iPeriodTime)
               {
                  for(iIndex2 = 0; iIndex2 < 6; iIndex2++)
                  {
                     stDragonMachineBossFullBodyMagmaIntruder = DragonMachineBossFullBodyMagmaIntruder.a_3926() as DragonMachineBossFullBodyMagmaIntruder;
                     if(stDragonMachineBossFullBodyMagmaIntruder)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(BattleFieldView.a_1011)];
                        stDragonMachineBossFullBodyMagmaIntruder.a_1797(0,-1);
                        stDragonMachineBossFullBodyMagmaIntruder.iGlobalMoveFighterID = this.a_4265();
                        stDragonMachineBossFullBodyMagmaIntruder.m_stMoveIntruderTypeID = 8388608;
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDragonMachineBossFullBodyMagmaIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stDragonMachineBossFullBodyMagmaIntruder,stTargetFieldGrid);
                        stDragonMachineBossFullBodyMagmaIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stDragonMachineBossFullBodyMagmaIntruder.width) + this.m_stRandomSeed.nextInt(10);
                     }
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 3;
                  this.m_iPeriodTime = 100000;
               }
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 220;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 20;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 18] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 21;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 19] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(180 == this.m_iPeriodTime)
               {
                  isSquare = this.m_stRandomSeed.nextInt(2) ? true : false;
                  if(isSquare)
                  {
                     for(iIndex3 = 0; iIndex3 < 4; iIndex3++)
                     {
                        stDragonMachineBossFullBodyTailIntruder = DragonMachineBossFullBodyTailIntruder.a_3926() as DragonMachineBossFullBodyTailIntruder;
                        if(stDragonMachineBossFullBodyTailIntruder)
                        {
                           stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[int(iIndex3 / 2) * (BattleFieldView.a_1012 - 1)][int(iIndex3 % 2) * (BattleFieldView.a_1011 - 1)];
                           stDragonMachineBossFullBodyTailIntruder.a_1797(0,-1);
                           stDragonMachineBossFullBodyTailIntruder.iGlobalMoveFighterID = this.a_4265();
                           stDragonMachineBossFullBodyTailIntruder.m_stMoveIntruderTypeID = 8388608;
                           m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDragonMachineBossFullBodyTailIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                           m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stDragonMachineBossFullBodyTailIntruder,stTargetFieldGrid);
                           stDragonMachineBossFullBodyTailIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stDragonMachineBossFullBodyTailIntruder.width);
                           stDragonMachineBossFullBodyTailIntruder.m_iLightingTailSequence = iIndex3;
                           DragonMachineBossFullBodyTailIntruder.ms_arrDragonBossFullBodyLightingTail[iIndex3] = stDragonMachineBossFullBodyTailIntruder;
                           this.a_3502(stTargetFieldGrid);
                        }
                     }
                  }
                  else
                  {
                     for(iIndex3 = 0; iIndex3 < 4; iIndex3++)
                     {
                        stDragonMachineBossFullBodyTailIntruder = DragonMachineBossFullBodyTailIntruder.a_3926() as DragonMachineBossFullBodyTailIntruder;
                        if(stDragonMachineBossFullBodyTailIntruder)
                        {
                           if(0 == iIndex3)
                           {
                              iYIndex1 = 3;
                              iXIndex1 = 0;
                           }
                           else if(1 == iIndex3)
                           {
                              iYIndex1 = 0;
                              iXIndex1 = 4;
                           }
                           else if(2 == iIndex3)
                           {
                              iYIndex1 = 3;
                              iXIndex1 = 8;
                           }
                           else if(3 == iIndex3)
                           {
                              iYIndex1 = 6;
                              iXIndex1 = 4;
                           }
                           stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iYIndex1][iXIndex1];
                           stDragonMachineBossFullBodyTailIntruder.a_1797(0,-1);
                           stDragonMachineBossFullBodyTailIntruder.iGlobalMoveFighterID = this.a_4265();
                           stDragonMachineBossFullBodyTailIntruder.m_stMoveIntruderTypeID = 8388608;
                           m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDragonMachineBossFullBodyTailIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                           m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stDragonMachineBossFullBodyTailIntruder,stTargetFieldGrid);
                           stDragonMachineBossFullBodyTailIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stDragonMachineBossFullBodyTailIntruder.width);
                           stDragonMachineBossFullBodyTailIntruder.m_iLightingTailSequence = 4 + iIndex3;
                           DragonMachineBossFullBodyTailIntruder.ms_arrDragonBossFullBodyLightingTail[4 + iIndex3] = stDragonMachineBossFullBodyTailIntruder;
                           this.a_3502(stTargetFieldGrid);
                        }
                     }
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 4;
               this.m_iPeriodTime = 100000;
            }
         }
         if(4 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 4;
               this.m_iPeriodTime = 1060;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(1020 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                  }
               }
               if(970 == this.m_iPeriodTime)
               {
                  if(null == this.m_stDrogonMachineBossUpperBodyMoveIntruder)
                  {
                     this.m_stDrogonMachineBossUpperBodyMoveIntruder = a_4255.getInstance().a_4256(8388670);
                     if(this.m_stDrogonMachineBossUpperBodyMoveIntruder)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[m_stCurrentFieldGrid.m_iYGridNo - 2][BattleFieldView.a_1011 - 1];
                        this.m_stDrogonMachineBossUpperBodyMoveIntruder.a_1797(0,-1);
                        this.m_stDrogonMachineBossUpperBodyMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                        this.m_stDrogonMachineBossUpperBodyMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stDrogonMachineBossUpperBodyMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stDrogonMachineBossUpperBodyMoveIntruder,stTargetFieldGrid);
                        (this.m_stDrogonMachineBossUpperBodyMoveIntruder as Object).m_isSummonUpByDragonFullBodyBoss = true;
                        this.m_stDrogonMachineBossUpperBodyMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stDrogonMachineBossUpperBodyMoveIntruder.width);
                     }
                  }
                  else
                  {
                     (this.m_stDrogonMachineBossUpperBodyMoveIntruder as Object).SumonUp(true);
                  }
                  if(null == this.m_stDrogonMachineBossLowerBodyMoveIntruder)
                  {
                     this.m_stDrogonMachineBossLowerBodyMoveIntruder = a_4255.getInstance().a_4256(8388669);
                     if(this.m_stDrogonMachineBossLowerBodyMoveIntruder)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[m_stCurrentFieldGrid.m_iYGridNo][BattleFieldView.a_1011 - 4];
                        this.m_stDrogonMachineBossLowerBodyMoveIntruder.a_1797(0,-1);
                        this.m_stDrogonMachineBossLowerBodyMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                        this.m_stDrogonMachineBossLowerBodyMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stDrogonMachineBossLowerBodyMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stDrogonMachineBossLowerBodyMoveIntruder,stTargetFieldGrid);
                        (this.m_stDrogonMachineBossLowerBodyMoveIntruder as Object).m_isSummonUpByDragonFullBodyBoss = true;
                        this.m_stDrogonMachineBossLowerBodyMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stDrogonMachineBossLowerBodyMoveIntruder.width);
                     }
                  }
                  else
                  {
                     (this.m_stDrogonMachineBossLowerBodyMoveIntruder as Object).SumonUp(true);
                  }
                  visible = false;
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               if(this.m_stDrogonMachineBossUpperBodyMoveIntruder)
               {
                  (this.m_stDrogonMachineBossUpperBodyMoveIntruder as Object).SumonUp(false);
               }
               if(this.m_stDrogonMachineBossLowerBodyMoveIntruder)
               {
                  (this.m_stDrogonMachineBossLowerBodyMoveIntruder as Object).SumonUp(false);
               }
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 100000;
            }
         }
         if(5 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1465 = 0;
               this.m_iBossStatus = 5;
               this.m_iPeriodTime = 80;
               visible = true;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 1)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(63 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                  }
               }
               if(41 == this.m_iPeriodTime)
               {
                  visible = false;
               }
               if(23 == this.m_iPeriodTime)
               {
                  visible = true;
                  gotoAndStop(1);
                  if(2 == this.m_iAttackTimes % 4)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[2 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 2)][BattleFieldView.a_1011 - 1];
                     x = a_1283 ? 0 : BattleFieldView.a_1013;
                  }
                  else
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 4];
                     x = a_1283 ? a_3491.a_1080 * 3 : BattleFieldView.a_1013 - a_3491.a_1080 * 3;
                  }
                  y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height);
                  ChangeFieldGrid(stTargetFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
                  }
               }
               if(4 == this.m_iPeriodTime)
               {
                  stPosFieldGrid0 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stPosFieldGrid0)
                  {
                     this.a_3502(stPosFieldGrid0);
                  }
                  this.a_3502(m_stCurrentFieldGrid);
               }
               if(this.m_numXMoveSpeed != 0)
               {
                  x += this.m_numXMoveSpeed;
               }
               if(this.m_numYMoveSpeed != 0)
               {
                  y += this.m_numYMoveSpeed;
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
         return -0.3 * width;
      }
      
      protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}


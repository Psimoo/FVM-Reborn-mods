package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon.VolcanicRocksBoss
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
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class VolcanicRocksBossMouseMoveIntruder extends a_4206
   {
      
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
      
      private var m_stVolcanicRocksBossHeadMoveIntruder:VolcanicRocksBossHeadMoveIntruder;
      
      private var m_stVolcanicRocksBossBodyMoveIntruder1:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_stVolcanicRocksBossBodyMoveIntruder2:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_stVolcanicRocksBossBodyMoveIntruder3:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_stExBodyIntruder1:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_stExBodyIntruder2:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_stExBodyIntruder3:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_stExBodyIntruder4:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_stExBodyIntruder5:VolcanicRocksBossBodyMoveIntruder;
      
      private var m_isDropHited:Boolean;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function VolcanicRocksBossMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VolcanicRocksBossMouseMoveIntruder) as VolcanicRocksBossMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VolcanicRocksBossMouseMoveIntruderMovie;
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
         this.m_numXMoveSpeed = 0;
         this.m_numYMoveSpeed = 0;
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 100000;
         a_1463 = true;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1377 = 900;
         a_1279 = -width * 0.46;
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
               if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 28)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 28;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 28] as FrameLabel).frame);
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
            if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 28)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + 28;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 28] as FrameLabel).frame);
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
         if(!(stBaseDefense is a_3924))
         {
            super.a_4215(stBaseDefense);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var stTempFieldGrid1:a_3491 = null;
         var stFieldGrid:a_3491 = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrBaseMoveIntruder:Array = null;
         var stVolcanicRocksBossHeadMoveIntruder:VolcanicRocksBossHeadMoveIntruder = null;
         var iBossHeadIndex:int = 0;
         var iArrIndex1:int = 0;
         var stVolcanicRocksBossBodyMoveIntruder:VolcanicRocksBossBodyMoveIntruder = null;
         var numTargetYPos:Number = NaN;
         var stVolcanicFireMouseMoveIntruder:VolcanicFireMouseMoveIntruder = null;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(7 == iMapID)
               {
                  this.m_numHardRate = 1.6;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.35;
                  }
               }
               else if(519 == iMapID)
               {
                  this.m_numHardRate = 1.7;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.4;
                  }
               }
               else if(2054 == iMapID)
               {
                  this.m_numHardRate = 1.7;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.4;
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
               a_1463 = true;
               a_1465 = 0;
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 260;
               visible = true;
               play();
               gotoAndStop(1);
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 1];
               x = a_1283 ? 0 : BattleFieldView.a_1013;
               y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height);
               ChangeFieldGrid(stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 4;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12 + 3] as FrameLabel).frame);
               }
               this.m_numXMoveSpeed = 0;
               this.m_numYMoveSpeed = 0;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(240 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                  }
               }
               if(200 == this.m_iPeriodTime)
               {
                  play();
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 2;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12 + 0] as FrameLabel).frame);
                  }
               }
               if(184 == this.m_iPeriodTime)
               {
                  stop();
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 3)];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(164 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
                  play();
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12 + 4] as FrameLabel).frame);
                  }
               }
               if(124 == this.m_iPeriodTime)
               {
                  this.a_3502(m_stCurrentFieldGrid);
                  stTempFieldGrid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stTempFieldGrid1)
                  {
                     this.a_3502(stTempFieldGrid1);
                  }
                  stTempFieldGrid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stTempFieldGrid1)
                  {
                     this.a_3502(stTempFieldGrid1);
                  }
                  BattleFieldView.a_1048.play();
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3466();
                  yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
                  xStart = m_stCurrentFieldGrid.m_iXGridNo - 2 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 2);
                  yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
                  xEnd = m_stCurrentFieldGrid.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 2);
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
                        if(stFieldGrid.m_stAttackFighter)
                        {
                           stFieldGrid.m_stAttackFighter.a_3958(200);
                        }
                     }
                  }
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 6;
                  }
               }
               if(114 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 11;
                  }
               }
               if(74 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12 + 0] as FrameLabel).frame);
                  }
               }
               if(56 == this.m_iPeriodTime)
               {
                  stop();
                  visible = false;
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
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  this.m_iBossStatus = 1;
                  this.m_iPeriodTime = 100000;
               }
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1462 = false;
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 305;
               visible = true;
               play();
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 24;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 24] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 27;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 27] as FrameLabel).frame);
               }
               play();
               a_1350 = a_3491.a_1080 / 80;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               if(this.a_1598)
               {
                  arrBaseMoveIntruder = [];
                  arrBaseMoveIntruder[this.a_1598.m_iYGridNo] = this;
                  ChangeFieldGrid(this.a_1598);
                  this.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.stDisplayBitmap.width) - this.stDisplayBitmap.x;
                  this.y = this.iYPosSkewing + a_3491.a_1081 * this.a_1598.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height) - this.stDisplayBitmap.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
                  stVolcanicRocksBossHeadMoveIntruder = VolcanicRocksBossHeadMoveIntruder.a_3926() as VolcanicRocksBossHeadMoveIntruder;
                  iBossHeadIndex = int(this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 1));
                  if(arrBaseMoveIntruder[iBossHeadIndex])
                  {
                     if(iBossHeadIndex >= 3)
                     {
                        iBossHeadIndex--;
                     }
                     else if(iBossHeadIndex < 3)
                     {
                        iBossHeadIndex += 1;
                     }
                  }
                  arrBaseMoveIntruder[iBossHeadIndex] = stVolcanicRocksBossHeadMoveIntruder;
                  stVolcanicRocksBossHeadMoveIntruder.a_1797(0,-1);
                  stVolcanicRocksBossHeadMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                  stVolcanicRocksBossHeadMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,iBossHeadIndex);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stVolcanicRocksBossHeadMoveIntruder,this.a_1598);
                  stVolcanicRocksBossHeadMoveIntruder.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - stVolcanicRocksBossHeadMoveIntruder.width) - stVolcanicRocksBossHeadMoveIntruder.stDisplayBitmap.x;
                  stVolcanicRocksBossHeadMoveIntruder.m_isGoAhead = true;
                  stVolcanicRocksBossHeadMoveIntruder.y += 15;
                  for(iArrIndex1 = 0; iArrIndex1 < BattleFieldView.a_1012; iArrIndex1++)
                  {
                     if(null == arrBaseMoveIntruder[iArrIndex1])
                     {
                        stVolcanicRocksBossBodyMoveIntruder = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
                        arrBaseMoveIntruder[iArrIndex1] = stVolcanicRocksBossBodyMoveIntruder;
                        stVolcanicRocksBossBodyMoveIntruder.a_1797(0,-1);
                        stVolcanicRocksBossBodyMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                        stVolcanicRocksBossBodyMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                        this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,iArrIndex1);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stVolcanicRocksBossBodyMoveIntruder,this.a_1598);
                        stVolcanicRocksBossBodyMoveIntruder.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - stVolcanicRocksBossBodyMoveIntruder.width) - stVolcanicRocksBossBodyMoveIntruder.stDisplayBitmap.x;
                        stVolcanicRocksBossBodyMoveIntruder.m_isGoAhead = true;
                        stVolcanicRocksBossBodyMoveIntruder.y += 15;
                     }
                  }
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(m_stCurrentFieldGrid.m_stAttackFighter is a_3924)
               {
                  a_1464 = true;
               }
               else
               {
                  a_1464 = false;
               }
               super.a_4216(iCurrentTime);
               if(0 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  visible = false;
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
                  ++this.m_iAttackTimes;
                  a_1465 = 0;
                  a_1462 = false;
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1462 = false;
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 340;
               visible = true;
               this.m_isDropHited = false;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 22;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 22] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 25;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 25] as FrameLabel).frame);
               }
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stVolcanicRocksBossHeadMoveIntruder = VolcanicRocksBossHeadMoveIntruder.a_3926() as VolcanicRocksBossHeadMoveIntruder;
               this.m_stVolcanicRocksBossHeadMoveIntruder.a_1797(0,-1);
               this.m_stVolcanicRocksBossHeadMoveIntruder.iGlobalMoveFighterID = this.a_4265();
               this.m_stVolcanicRocksBossHeadMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVolcanicRocksBossHeadMoveIntruder,this.a_1598);
               this.m_stVolcanicRocksBossHeadMoveIntruder.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stVolcanicRocksBossHeadMoveIntruder.width) - this.m_stVolcanicRocksBossHeadMoveIntruder.stDisplayBitmap.x;
               this.m_stVolcanicRocksBossHeadMoveIntruder.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVolcanicRocksBossHeadMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stVolcanicRocksBossBodyMoveIntruder1 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stVolcanicRocksBossBodyMoveIntruder1.a_1797(0,-1);
               this.m_stVolcanicRocksBossBodyMoveIntruder1.iGlobalMoveFighterID = this.a_4265();
               this.m_stVolcanicRocksBossBodyMoveIntruder1.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVolcanicRocksBossBodyMoveIntruder1,this.a_1598);
               this.m_stVolcanicRocksBossBodyMoveIntruder1.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stVolcanicRocksBossBodyMoveIntruder1.width) - this.m_stVolcanicRocksBossBodyMoveIntruder1.stDisplayBitmap.x;
               this.m_stVolcanicRocksBossBodyMoveIntruder1.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVolcanicRocksBossBodyMoveIntruder1,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               ChangeFieldGrid(this.a_1598);
               this.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.stDisplayBitmap.width) - this.stDisplayBitmap.x;
               this.y = -260;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stVolcanicRocksBossBodyMoveIntruder2 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stVolcanicRocksBossBodyMoveIntruder2.a_1797(0,-1);
               this.m_stVolcanicRocksBossBodyMoveIntruder2.iGlobalMoveFighterID = this.a_4265();
               this.m_stVolcanicRocksBossBodyMoveIntruder2.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVolcanicRocksBossBodyMoveIntruder2,this.a_1598);
               this.m_stVolcanicRocksBossBodyMoveIntruder2.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stVolcanicRocksBossBodyMoveIntruder2.width) - this.m_stVolcanicRocksBossBodyMoveIntruder2.stDisplayBitmap.x;
               this.m_stVolcanicRocksBossBodyMoveIntruder2.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVolcanicRocksBossBodyMoveIntruder2,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stVolcanicRocksBossBodyMoveIntruder3 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stVolcanicRocksBossBodyMoveIntruder3.a_1797(0,-1);
               this.m_stVolcanicRocksBossBodyMoveIntruder3.iGlobalMoveFighterID = this.a_4265();
               this.m_stVolcanicRocksBossBodyMoveIntruder3.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVolcanicRocksBossBodyMoveIntruder3,this.a_1598);
               this.m_stVolcanicRocksBossBodyMoveIntruder3.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stVolcanicRocksBossBodyMoveIntruder3.width) - this.m_stVolcanicRocksBossBodyMoveIntruder3.stDisplayBitmap.x;
               this.m_stVolcanicRocksBossBodyMoveIntruder3.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVolcanicRocksBossBodyMoveIntruder3,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stExBodyIntruder1 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stExBodyIntruder1.a_1797(0,-1);
               this.m_stExBodyIntruder1.iGlobalMoveFighterID = this.a_4265();
               this.m_stExBodyIntruder1.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stExBodyIntruder1,this.a_1598);
               this.m_stExBodyIntruder1.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stExBodyIntruder1.width) - this.m_stExBodyIntruder1.stDisplayBitmap.x;
               this.m_stExBodyIntruder1.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stExBodyIntruder1,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stExBodyIntruder2 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stExBodyIntruder2.a_1797(0,-1);
               this.m_stExBodyIntruder2.iGlobalMoveFighterID = this.a_4265();
               this.m_stExBodyIntruder2.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stExBodyIntruder2,this.a_1598);
               this.m_stExBodyIntruder2.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stExBodyIntruder2.width) - this.m_stExBodyIntruder2.stDisplayBitmap.x;
               this.m_stExBodyIntruder2.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stExBodyIntruder2,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stExBodyIntruder3 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stExBodyIntruder3.a_1797(0,-1);
               this.m_stExBodyIntruder3.iGlobalMoveFighterID = this.a_4265();
               this.m_stExBodyIntruder3.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stExBodyIntruder3,this.a_1598);
               this.m_stExBodyIntruder3.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stExBodyIntruder3.width) - this.m_stExBodyIntruder3.stDisplayBitmap.x;
               this.m_stExBodyIntruder3.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stExBodyIntruder3,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stExBodyIntruder4 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stExBodyIntruder4.a_1797(0,-1);
               this.m_stExBodyIntruder4.iGlobalMoveFighterID = this.a_4265();
               this.m_stExBodyIntruder4.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stExBodyIntruder4,this.a_1598);
               this.m_stExBodyIntruder4.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stExBodyIntruder4.width) - this.m_stExBodyIntruder4.stDisplayBitmap.x;
               this.m_stExBodyIntruder4.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stExBodyIntruder4,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_stRandomSeed.nextInt(BattleFieldView.a_1011),this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               this.m_stExBodyIntruder5 = VolcanicRocksBossBodyMoveIntruder.a_3926() as VolcanicRocksBossBodyMoveIntruder;
               this.m_stExBodyIntruder5.a_1797(0,-1);
               this.m_stExBodyIntruder5.iGlobalMoveFighterID = this.a_4265();
               this.m_stExBodyIntruder5.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stExBodyIntruder5,this.a_1598);
               this.m_stExBodyIntruder5.x = a_3491.a_1080 * this.a_1598.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stExBodyIntruder5.width) - this.m_stExBodyIntruder5.stDisplayBitmap.x;
               this.m_stExBodyIntruder5.y = -200;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stExBodyIntruder5,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_numXMoveSpeed != 0)
               {
                  x += this.m_numXMoveSpeed;
               }
               if(this.m_numYMoveSpeed != 0)
               {
                  y += this.m_numYMoveSpeed;
               }
               if(this.m_iPeriodTime < 280 && Boolean(this.m_stVolcanicRocksBossHeadMoveIntruder.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stVolcanicRocksBossHeadMoveIntruder.iYPosSkewing + a_3491.a_1081 * this.m_stVolcanicRocksBossHeadMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stVolcanicRocksBossHeadMoveIntruder.height) - this.m_stVolcanicRocksBossHeadMoveIntruder.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stVolcanicRocksBossHeadMoveIntruder.y > 10)
                  {
                     this.m_stVolcanicRocksBossHeadMoveIntruder.y += 40;
                  }
                  else
                  {
                     this.m_stVolcanicRocksBossHeadMoveIntruder.DropHited();
                     this.a_3502(this.m_stVolcanicRocksBossHeadMoveIntruder.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 240 && Boolean(this.m_stVolcanicRocksBossBodyMoveIntruder1.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stVolcanicRocksBossBodyMoveIntruder1.iYPosSkewing + a_3491.a_1081 * this.m_stVolcanicRocksBossBodyMoveIntruder1.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stVolcanicRocksBossBodyMoveIntruder1.height) - this.m_stVolcanicRocksBossBodyMoveIntruder1.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stVolcanicRocksBossBodyMoveIntruder1.y > 10)
                  {
                     this.m_stVolcanicRocksBossBodyMoveIntruder1.y += 40;
                  }
                  else
                  {
                     this.m_stVolcanicRocksBossBodyMoveIntruder1.DropHited();
                     this.a_3502(this.m_stVolcanicRocksBossBodyMoveIntruder1.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 200 && Boolean(this.m_stVolcanicRocksBossBodyMoveIntruder2.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stVolcanicRocksBossBodyMoveIntruder2.iYPosSkewing + a_3491.a_1081 * this.m_stVolcanicRocksBossBodyMoveIntruder2.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stVolcanicRocksBossBodyMoveIntruder2.height) - this.m_stVolcanicRocksBossBodyMoveIntruder2.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stVolcanicRocksBossBodyMoveIntruder2.y > 10)
                  {
                     this.m_stVolcanicRocksBossBodyMoveIntruder2.y += 40;
                  }
                  else
                  {
                     this.m_stVolcanicRocksBossBodyMoveIntruder2.DropHited();
                     this.a_3502(this.m_stVolcanicRocksBossBodyMoveIntruder2.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 160 && Boolean(m_stCurrentFieldGrid))
               {
                  numTargetYPos = iYPosSkewing + a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - stDisplayBitmap.height) - stDisplayBitmap.y;
                  if(numTargetYPos - y > 10 && !this.m_isDropHited)
                  {
                     y += 40;
                  }
                  else
                  {
                     if(!this.m_isDropHited)
                     {
                        this.m_isDropHited = true;
                        if(a_1339 > this.m_numHardRate * 5000)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 22;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 23] as FrameLabel).frame);
                        }
                        else if(a_1339 > 0)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 25;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 26] as FrameLabel).frame);
                        }
                        BattleFieldView.a_1048.play();
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3466();
                     }
                     this.a_3502(m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 120 && Boolean(this.m_stVolcanicRocksBossBodyMoveIntruder3.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stVolcanicRocksBossBodyMoveIntruder3.iYPosSkewing + a_3491.a_1081 * this.m_stVolcanicRocksBossBodyMoveIntruder3.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stVolcanicRocksBossBodyMoveIntruder3.height) - this.m_stVolcanicRocksBossBodyMoveIntruder3.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stVolcanicRocksBossBodyMoveIntruder3.y > 10)
                  {
                     this.m_stVolcanicRocksBossBodyMoveIntruder3.y += 40;
                  }
                  else
                  {
                     this.m_stVolcanicRocksBossBodyMoveIntruder3.DropHited();
                     this.a_3502(this.m_stVolcanicRocksBossBodyMoveIntruder3.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 280 && Boolean(this.m_stExBodyIntruder1.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stExBodyIntruder1.iYPosSkewing + a_3491.a_1081 * this.m_stExBodyIntruder1.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stExBodyIntruder1.height) - this.m_stExBodyIntruder1.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stExBodyIntruder1.y > 10)
                  {
                     this.m_stExBodyIntruder1.y += 40;
                  }
                  else
                  {
                     this.m_stExBodyIntruder1.DropHited();
                     this.a_3502(this.m_stExBodyIntruder1.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 240 && Boolean(this.m_stExBodyIntruder2.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stExBodyIntruder2.iYPosSkewing + a_3491.a_1081 * this.m_stExBodyIntruder2.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stExBodyIntruder2.height) - this.m_stExBodyIntruder2.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stExBodyIntruder2.y > 10)
                  {
                     this.m_stExBodyIntruder2.y += 40;
                  }
                  else
                  {
                     this.m_stExBodyIntruder2.DropHited();
                     this.a_3502(this.m_stExBodyIntruder2.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 200 && Boolean(this.m_stExBodyIntruder3.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stExBodyIntruder3.iYPosSkewing + a_3491.a_1081 * this.m_stExBodyIntruder3.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stExBodyIntruder3.height) - this.m_stExBodyIntruder3.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stExBodyIntruder3.y > 10)
                  {
                     this.m_stExBodyIntruder3.y += 40;
                  }
                  else
                  {
                     this.m_stExBodyIntruder3.DropHited();
                     this.a_3502(this.m_stExBodyIntruder3.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 160 && Boolean(this.m_stExBodyIntruder4.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stExBodyIntruder4.iYPosSkewing + a_3491.a_1081 * this.m_stExBodyIntruder4.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stExBodyIntruder4.height) - this.m_stExBodyIntruder4.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stExBodyIntruder4.y > 10)
                  {
                     this.m_stExBodyIntruder4.y += 40;
                  }
                  else
                  {
                     this.m_stExBodyIntruder4.DropHited();
                     this.a_3502(this.m_stExBodyIntruder4.m_stCurrentFieldGrid);
                  }
               }
               if(this.m_iPeriodTime < 120 && Boolean(this.m_stExBodyIntruder5.m_stCurrentFieldGrid))
               {
                  numTargetYPos = this.m_stExBodyIntruder5.iYPosSkewing + a_3491.a_1081 * this.m_stExBodyIntruder5.m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stExBodyIntruder5.height) - this.m_stExBodyIntruder5.stDisplayBitmap.y;
                  if(numTargetYPos - this.m_stExBodyIntruder5.y > 10)
                  {
                     this.m_stExBodyIntruder5.y += 40;
                  }
                  else
                  {
                     this.m_stExBodyIntruder5.DropHited();
                     this.a_3502(this.m_stExBodyIntruder5.m_stCurrentFieldGrid);
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_stVolcanicRocksBossHeadMoveIntruder.a_3969(this.m_stVolcanicRocksBossHeadMoveIntruder.iLifeValue);
                  this.m_stVolcanicRocksBossHeadMoveIntruder.a_4212();
                  this.m_stVolcanicRocksBossHeadMoveIntruder = null;
                  this.m_stVolcanicRocksBossBodyMoveIntruder1.a_3969(this.m_stVolcanicRocksBossBodyMoveIntruder1.iLifeValue);
                  this.m_stVolcanicRocksBossBodyMoveIntruder1.a_4212();
                  this.m_stVolcanicRocksBossBodyMoveIntruder1 = null;
                  this.m_stVolcanicRocksBossBodyMoveIntruder2.a_3969(this.m_stVolcanicRocksBossBodyMoveIntruder2.iLifeValue);
                  this.m_stVolcanicRocksBossBodyMoveIntruder2.a_4212();
                  this.m_stVolcanicRocksBossBodyMoveIntruder2 = null;
                  this.m_stVolcanicRocksBossBodyMoveIntruder3.a_3969(this.m_stVolcanicRocksBossBodyMoveIntruder3.iLifeValue);
                  this.m_stVolcanicRocksBossBodyMoveIntruder3.a_4212();
                  this.m_stVolcanicRocksBossBodyMoveIntruder3 = null;
                  this.m_stExBodyIntruder1.a_3969(this.m_stExBodyIntruder1.iLifeValue);
                  this.m_stExBodyIntruder1.a_4212();
                  this.m_stExBodyIntruder1 = null;
                  this.m_stExBodyIntruder2.a_3969(this.m_stExBodyIntruder2.iLifeValue);
                  this.m_stExBodyIntruder2.a_4212();
                  this.m_stExBodyIntruder2 = null;
                  this.m_stExBodyIntruder3.a_3969(this.m_stExBodyIntruder3.iLifeValue);
                  this.m_stExBodyIntruder3.a_4212();
                  this.m_stExBodyIntruder3 = null;
                  this.m_stExBodyIntruder4.a_3969(this.m_stExBodyIntruder4.iLifeValue);
                  this.m_stExBodyIntruder4.a_4212();
                  this.m_stExBodyIntruder4 = null;
                  this.m_stExBodyIntruder5.a_3969(this.m_stExBodyIntruder5.iLifeValue);
                  this.m_stExBodyIntruder5.a_4212();
                  this.m_stExBodyIntruder5 = null;
                  this.m_iBossStatus = 3;
                  this.m_iPeriodTime = 100000;
               }
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1462 = false;
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 200;
               visible = true;
               play();
               gotoAndStop(1);
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 1];
               x = a_1283 ? 0 : BattleFieldView.a_1013;
               y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height);
               ChangeFieldGrid(stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 4;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12 + 3] as FrameLabel).frame);
               }
               this.m_numXMoveSpeed = 0;
               this.m_numYMoveSpeed = 0;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(180 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                  }
               }
               if(120 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 8;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12 + 7] as FrameLabel).frame);
                  }
               }
               if(this.m_iPeriodTime < 110 && this.m_iPeriodTime > 45 && (104 - this.m_iPeriodTime) % 18 == 0)
               {
                  stVolcanicFireMouseMoveIntruder = VolcanicFireMouseMoveIntruder.a_3926() as VolcanicFireMouseMoveIntruder;
                  if(stVolcanicFireMouseMoveIntruder)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[m_stCurrentFieldGrid.m_iYGridNo][BattleFieldView.a_1011 - 1];
                     stVolcanicFireMouseMoveIntruder.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 1];
                     stVolcanicFireMouseMoveIntruder.a_1797(0,-1);
                     stVolcanicFireMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stVolcanicFireMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     stVolcanicFireMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - stVolcanicFireMouseMoveIntruder.width);
                     stVolcanicFireMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stVolcanicFireMouseMoveIntruder.height);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stVolcanicFireMouseMoveIntruder,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stVolcanicFireMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stVolcanicFireMouseMoveIntruder.a_1598);
                     stVolcanicFireMouseMoveIntruder.m_iFinalTargetXGridNo = this.m_stRandomSeed.nextInt(4);
                     stVolcanicFireMouseMoveIntruder.GoTargetFieldGrid();
                  }
               }
               if(44 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 6;
                  }
               }
               if(34 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12 + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12 + 0] as FrameLabel).frame);
                  }
               }
               if(16 == this.m_iPeriodTime)
               {
                  stop();
                  visible = false;
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
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
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


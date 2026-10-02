package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure2
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
   import com.aurora.ui.maogoutd.resource.effect.SleepingEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4131;
   import flash.display.FrameLabel;
   
   public class CrabMermaidBossMoveIntruder extends a_4206
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
      
      private var a_1324:Array = [];
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      private var m_iTargetY:int = 0;
      
      private var m_iMoveYDirection:int = 1;
      
      protected var a_1598:a_3491;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stMermaidHornNote:a_4131;
      
      private var m_stLastWaitShot:MouseCrabDartShot;
      
      private var m_arrSleepingAttackCard:Array = [];
      
      public function CrabMermaidBossMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CrabMermaidBossMoveIntruder) as CrabMermaidBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrabMermaidBossMoveIntruderMovie;
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
         if(this.m_stMermaidHornNote)
         {
            this.m_stMermaidHornNote.a_3940();
            this.m_stMermaidHornNote = null;
         }
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(this.m_stMermaidHornNote)
         {
            this.m_stMermaidHornNote.a_3940();
            this.m_stMermaidHornNote = null;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= this.m_numHardRate * 5000)
         {
            if(a_1339 <= 0)
            {
               if(a_1339 <= 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 17)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 17;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 17] as FrameLabel).frame);
                  }
                  if(m_stCurrentFieldGrid)
                  {
                     m_stCurrentFieldGrid.a_3457(this);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  }
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
            if(a_1339 <= 0)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 17)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 17;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 17] as FrameLabel).frame);
               }
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
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
            this.a_3940();
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
            this.a_3940();
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
            this.a_3940();
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
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var numShotXpos:Number = NaN;
         var numShotYPos:Number = NaN;
         var xIndex:int = 0;
         var yIndex:int = 0;
         var stTempFieldGrid:a_3491 = null;
         var stSleepingEffect:SleepingEffect = null;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(4 == iMapID)
               {
                  this.m_numHardRate = 1.3;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.05;
                  }
               }
               else if(516 == iMapID)
               {
                  this.m_numHardRate = 1.35;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.1;
                  }
               }
               else if(2819 == iMapID)
               {
                  this.m_numHardRate = 1.5;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.2;
                  }
               }
               a_1339 *= this.m_numHardRate;
            }
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 1;
            this.m_iPeriodTime = 100000;
            a_1465 = 1;
            a_1463 = true;
            this.SetAnimation(18,18);
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            a_1460 = true;
         }
         if(0 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 100;
               this.SetAnimation(16,17);
            }
            SetCannotSeeByFighter(true);
            a_1463 = true;
            a_1465 = 1;
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(a_1273 == (a_1276[a_1275 + 1] as FrameLabel).frame - 1)
               {
                  stop();
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
               SetCannotSeeByFighter(false);
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 24;
               a_1465 = 0;
               gotoAndStop(1);
               if(0 == this.m_iAttackTimes % 3)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][3];
                  if(this.a_1598.m_iYGridNo == 0)
                  {
                     this.m_iMoveYDirection = 1;
                  }
                  else if(this.a_1598.m_iYGridNo == 6)
                  {
                     this.m_iMoveYDirection = -1;
                  }
                  else
                  {
                     this.m_iMoveYDirection = this.m_iAttackTimes % 2 == 0 ? 1 : -1;
                  }
                  this.m_iTargetY = this.a_1598.m_iYGridNo + this.m_iMoveYDirection;
               }
               else if(1 == this.m_iAttackTimes % 3)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[3][BattleFieldView.a_1011 - 1];
               }
               else
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 1)][BattleFieldView.a_1011 - 1];
               }
               x = a_3491.a_1080 * this.a_1598.m_iXGridNo;
               y = iYPosSkewing + a_3491.a_1081 * this.a_1598.m_iYGridNo + (a_3491.a_1081 - this.height);
               ChangeFieldGrid(this.a_1598);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(this.a_1598.m_iYGridNo));
               this.a_3502(this.a_1598);
               this.SetAnimation(18,19);
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(0 == this.m_iPeriodTime)
               {
                  if(0 == this.m_iAttackTimes % 3)
                  {
                     this.SetAnimation(0,1);
                     this.m_iBossStatus = 2;
                     this.m_iPeriodTime = 90;
                  }
                  else if(1 == this.m_iAttackTimes % 3)
                  {
                     if(a_1339 > this.m_numHardRate * 5000)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 11)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
                        }
                     }
                     else if(a_1339 > 0)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 14)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 14;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
                        }
                     }
                     this.m_iBossStatus = 3;
                     this.m_iPeriodTime = 170;
                  }
                  else if(2 == this.m_iAttackTimes % 3)
                  {
                     if(a_1339 > this.m_numHardRate * 5000)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                        }
                     }
                     else if(a_1339 > 0)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                        }
                     }
                     this.m_iBossStatus = 4;
                     this.m_iPeriodTime = 180;
                  }
                  ++this.m_iAttackTimes;
                  a_1465 = 0;
                  SetCannotSeeByFighter(false);
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime >= 60)
               {
                  this.m_numXMoveSpeed = -a_3491.a_1080 / 10;
                  this.m_numYMoveSpeed = 0;
               }
               if(this.m_iPeriodTime >= 30 && this.m_iPeriodTime < 60)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = a_3491.a_1081 / 28 * this.m_iMoveYDirection;
               }
               if(this.m_iPeriodTime < 30)
               {
                  this.m_numXMoveSpeed = a_3491.a_1080 / 10;
                  this.m_numYMoveSpeed = 0;
               }
               x += this.m_numXMoveSpeed;
               y += this.m_numYMoveSpeed;
               iXGridNo = int(x / a_3491.a_1080);
               iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
               if(this.m_iPeriodTime < 45)
               {
                  iYGridNo = this.m_iTargetY;
               }
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               if(stFieldGrid != m_stCurrentFieldGrid)
               {
                  ChangeFieldGrid(stFieldGrid);
               }
               if(stFieldGrid)
               {
                  this.a_3502(stFieldGrid);
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 60;
                  this.SetAnimation(16,17);
               }
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 160)
               {
                  this.m_stLastWaitShot = MouseCrabDartShot.a_4344() as MouseCrabDartShot;
                  if(null != this.m_stLastWaitShot)
                  {
                     numShotXpos = a_3491.a_1080 * (this.a_1598.m_iXGridNo + 1.2);
                     numShotYPos = a_3491.a_1081 * (this.a_1598.m_iYGridNo - 0.3);
                     this.m_stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,numShotXpos,numShotYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                     parent.addChild(this.m_stLastWaitShot);
                     this.m_stLastWaitShot.m_numYInitChangeSpeed = 0.8 * 6 * this.m_stRandomSeed.nextInt(1);
                  }
               }
               if(Boolean(this.m_stLastWaitShot && this.m_stLastWaitShot.visible) && Boolean(this.m_stLastWaitShot.m_iXMoveTime > 0) && 160 - this.m_iPeriodTime == 2 * this.m_stLastWaitShot.m_iXMoveTime)
               {
                  this.m_stLastWaitShot.ForceRelease();
                  this.m_iPeriodTime = 10;
                  this.SetAnimation(10,13);
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
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(180 - 12 == this.m_iPeriodTime)
               {
                  if(null == this.m_stMermaidHornNote)
                  {
                     this.m_stMermaidHornNote = a_4131.a_3926();
                     this.m_stMermaidHornNote.a_1797();
                     this.m_stMermaidHornNote.x = x;
                     this.m_stMermaidHornNote.y = y;
                     parent.addChild(this.m_stMermaidHornNote);
                  }
               }
               if(140 == this.m_iPeriodTime)
               {
                  for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
                  {
                     for(yIndex = 0; yIndex < BattleFieldView.a_1012; yIndex++)
                     {
                        stTempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
                        if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
                        {
                           stTempFieldGrid.m_stAttackFighter.a_3958(100 * 2);
                           stSleepingEffect = SleepingEffect.a_3926();
                           stSleepingEffect.a_1797(false);
                           stSleepingEffect.a_3958 = 5 * 2;
                           stSleepingEffect.x = stTempFieldGrid.m_stAttackFighter.x + stTempFieldGrid.m_stAttackFighter.width * 0.4;
                           stSleepingEffect.y = stTempFieldGrid.m_stAttackFighter.y;
                           stTempFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSleepingEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
                        }
                     }
                  }
               }
            }
            if(80 == this.m_iPeriodTime)
            {
               this.m_stMermaidHornNote.a_3940();
               this.m_stMermaidHornNote = null;
               this.SetAnimation(8,9);
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 100000;
            }
         }
         return true;
      }
      
      private function SetAnimation(animIdx:int, damageAnimIdx:int) : void
      {
         if(a_1339 > this.m_numHardRate * 5000)
         {
            if(a_1275 != this.m_iChangeFireWizardLableIndex + animIdx)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + animIdx;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + animIdx] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != this.m_iChangeFireWizardLableIndex + damageAnimIdx)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + damageAnimIdx;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + damageAnimIdx] as FrameLabel).frame);
            }
         }
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
         if(this.m_stMermaidHornNote)
         {
            this.m_stMermaidHornNote.a_4003(null);
         }
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


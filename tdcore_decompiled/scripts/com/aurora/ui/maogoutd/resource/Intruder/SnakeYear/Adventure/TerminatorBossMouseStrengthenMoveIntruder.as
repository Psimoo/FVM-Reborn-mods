package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.MouseTerminatorBossShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TerminatorBossMouseStrengthenMoveIntruder extends a_4206
   {
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iChangeFireWizardLableIndex:int = 0;
      
      private var m_iAttackTimes:int = 0;
      
      protected var a_1309:int = 20;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 1000;
      
      protected var a_1312:int = 15;
      
      protected var a_1321:int = 0;
      
      private var a_1324:Array = [];
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function TerminatorBossMouseStrengthenMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TerminatorBossMouseStrengthenMoveIntruder) as TerminatorBossMouseStrengthenMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TerminatorBossMouseStrengthenMoveIntruderMovie;
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
         a_1350 = a_3491.a_1080 / 3.5;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1462 = true;
         a_1463 = true;
         this.m_iChangeFireWizardLableIndex = 0;
         this.m_iAttackTimes = 0;
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 20;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.2;
         this.a_1321 = 0;
         a_1481 = false;
         a_1463 = true;
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.m_numHardRate * 5000)
         {
            if(1 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 2)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
               }
            }
            else if(5 == this.m_iBossStatus)
            {
               if(this.m_iPeriodTime > 30)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 > 0)
         {
            if(1 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
               }
            }
            else if(5 == this.m_iBossStatus)
            {
               if(this.m_iPeriodTime > 60)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != this.m_iChangeFireWizardLableIndex + 11)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 11] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 16)
         {
            a_1275 = this.m_iChangeFireWizardLableIndex + 16;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 16] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iBossStatus == 5)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 == this.m_numHardRate * 5000)
         {
            if(1 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
               }
            }
            else if(5 == this.m_iBossStatus)
            {
               if(this.m_iPeriodTime > 30)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != this.m_iChangeFireWizardLableIndex + 11)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 11] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 16)
         {
            a_1275 = this.m_iChangeFireWizardLableIndex + 16;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 16] as FrameLabel).frame);
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
         if(this.m_iBossStatus == 5)
         {
            return true;
         }
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
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var stTargetFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(514 == iMapID)
               {
                  this.m_numHardRate = 0.8;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.65;
                  }
               }
               else if(513 == iMapID)
               {
                  this.m_numHardRate = 0.85;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.7;
                  }
               }
               else if(769 == iMapID)
               {
                  this.m_numHardRate = 0.8;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.65;
                  }
               }
               else if(2562 == iMapID)
               {
                  this.m_numHardRate = 1.05;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.95;
                  }
               }
               a_1339 *= this.m_numHardRate;
            }
            this.m_iAttackTimes = 1;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 60;
            a_1465 = 0;
            a_1275 = this.m_iChangeFireWizardLableIndex + 0;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         if(0 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(16 == this.m_iPeriodTime)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               if(0 == this.m_iAttackTimes % 2)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 2)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
                     }
                  }
                  this.m_iBossStatus = 1;
                  this.m_iPeriodTime = 160;
               }
               ++this.m_iAttackTimes;
               a_1465 = 0;
               SetCannotSeeByFighter(false);
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime >= 40 && a_1273 == (a_1276[a_1275] as FrameLabel).frame + 11 && iCurrentTime >= this.a_1321 + this.a_1309)
               {
                  if(iCurrentTime >= this.a_1321 + this.a_1309)
                  {
                     this.a_1321 = iCurrentTime;
                     stLastWaitShot = MouseTerminatorBossShot.a_4344();
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
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 20;
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 12)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 13)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
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
               if(0 == this.m_iPeriodTime)
               {
                  SetCannotSeeByFighter(true);
                  a_1463 = true;
                  this.m_iBossStatus = 3;
                  this.m_iPeriodTime = 20;
                  a_1465 = 3;
               }
            }
         }
         if(3 == this.m_iBossStatus)
         {
            visible = false;
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(0 == this.m_iPeriodTime)
               {
                  visible = true;
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 14)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 14;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 14] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 15)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 15;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 15] as FrameLabel).frame);
                     }
                  }
                  this.m_iBossStatus = 4;
                  this.m_iPeriodTime = 20;
                  a_1465 = 3;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][8];
                  ChangeFieldGrid(stTargetFieldGrid);
                  x = a_1283 ? 0 : BattleFieldView.a_1013;
                  y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - height) - stDisplayBitmap.y;
               }
            }
         }
         if(4 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               if(this.m_iAttackTimes % 3 > 0)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 2)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
                     }
                  }
                  this.m_iBossStatus = 1;
                  this.m_iPeriodTime = 160;
               }
               else
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
                  this.m_iBossStatus = 5;
                  this.m_iPeriodTime = 86;
               }
               ++this.m_iAttackTimes;
               a_1465 = 0;
               SetCannotSeeByFighter(false);
            }
         }
         if(5 == this.m_iBossStatus)
         {
            --this.m_iPeriodTime;
            if(36 == this.m_iPeriodTime)
            {
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 11)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
                  }
               }
            }
            if(this.m_iPeriodTime <= 24)
            {
               x += a_1350;
               iXGridNo = int(x / a_3491.a_1080);
               if(a_1283)
               {
                  iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
               }
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               if(stFieldGrid)
               {
                  if(iXGridNo > 1)
                  {
                     this.a_3502(stFieldGrid);
                  }
                  ChangeFieldGrid(stFieldGrid);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 20;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 12)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 13)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
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


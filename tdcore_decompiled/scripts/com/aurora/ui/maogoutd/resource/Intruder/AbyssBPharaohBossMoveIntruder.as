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
   import com.aurora.ui.maogoutd.resource.effect.MouseShadowMovie;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class AbyssBPharaohBossMoveIntruder extends a_4206
   {
      
      private var m_stMouseShadowMovie:MouseShadowMovie = new MouseShadowMovie();
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iChangeFireWizardLableIndex:int = 0;
      
      private var m_iAttackTimes:int = 0;
      
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
      
      public function AbyssBPharaohBossMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AbyssBPharaohBossMoveIntruder) as AbyssBPharaohBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return AbyssBPharaohBossMoveIntruderMovie;
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
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 116;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.2;
         this.a_1321 = 0;
         if(this.m_stMouseShadowMovie.parent)
         {
            this.m_stMouseShadowMovie.parent.removeChild(this.m_stMouseShadowMovie);
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
         if(this.m_stMouseShadowMovie.parent)
         {
            this.m_stMouseShadowMovie.parent.removeChild(this.m_stMouseShadowMovie);
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.m_numHardRate * 5000)
         {
            if(1 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 4)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
               }
            }
            else if(3 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 8)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
               }
            }
            else if(4 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 > 0)
         {
            if(1 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
               }
            }
            else if(3 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
               }
            }
            else if(4 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 10)
         {
            a_1275 = this.m_iChangeFireWizardLableIndex + 10;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
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
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
               }
            }
            else if(3 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
               }
            }
            else if(4 == this.m_iBossStatus)
            {
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
               }
            }
         }
         else if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 10)
         {
            a_1275 = this.m_iChangeFireWizardLableIndex + 10;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var stScarabMouseMoveIntruder:ScarabMouseMoveIntruder = null;
         var stFieldGridVector:Array = null;
         var arrFieldGridYNo:Array = null;
         var iYIndexKey:int = 0;
         var iTargetYNo:int = 0;
         var numMovePath:Number = NaN;
         var stPupalCocoonMouseMoveIntruder:a_4206 = null;
         var stMummyCoffinMouseMoveIntruder:MummyCoffinMouseMoveIntruder = null;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(2305 == iMapID)
               {
                  this.m_numHardRate = 1.3;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.1;
                  }
               }
               a_1339 *= this.m_numHardRate;
            }
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 116;
            a_1465 = 0;
            a_1275 = this.m_iChangeFireWizardLableIndex + 1;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         if(0 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 100000;
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
               this.m_stMouseShadowMovie.x = a_3491.a_1080 * (m_stCurrentFieldGrid.m_iXGridNo + 1.5);
               this.m_stMouseShadowMovie.y = a_3491.a_1081 * (m_stCurrentFieldGrid.m_iYGridNo + 0.8);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stMouseShadowMovie,BattleLayerDefine.EFFECTS_BASE_TYPE);
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime < 200 && this.m_iPeriodTime % 60 == 0)
               {
                  stScarabMouseMoveIntruder = ScarabMouseMoveIntruder.a_3926() as ScarabMouseMoveIntruder;
                  if(stScarabMouseMoveIntruder)
                  {
                     stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                     arrFieldGridYNo = [];
                     for(iYIndexKey = 0; iYIndexKey < BattleFieldView.a_1012; iYIndexKey++)
                     {
                        if(!(stFieldGridVector[iYIndexKey][0] as a_3491).m_isNeedTray)
                        {
                           arrFieldGridYNo.push(iYIndexKey);
                        }
                     }
                     iTargetYNo = int(arrFieldGridYNo[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012) % arrFieldGridYNo.length]);
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iTargetYNo][7 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 7)];
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3464(stTargetFieldGrid);
                     stScarabMouseMoveIntruder.a_1797(0,-1);
                     stScarabMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stScarabMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     stScarabMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - stScarabMouseMoveIntruder.width);
                     stScarabMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stScarabMouseMoveIntruder.height);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stScarabMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stScarabMouseMoveIntruder,stTargetFieldGrid);
                     this.a_3502(stTargetFieldGrid);
                     setTimeout(this.a_3503,3000,stTargetFieldGrid);
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 100000;
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
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               SetCannotSeeByFighter(true);
               a_1463 = true;
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 100;
               a_1465 = 3;
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][m_stCurrentFieldGrid.m_iXGridNo];
               numMovePath = (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081;
               a_1350 = numMovePath / 40;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime < 40)
               {
                  y += a_1350;
                  this.m_stMouseShadowMovie.y += a_1350;
               }
               if(0 == this.m_iPeriodTime)
               {
                  stTargetFieldGrid = this.a_1598;
                  ChangeFieldGrid(stTargetFieldGrid);
                  x = a_1283 ? 0 : BattleFieldView.a_1013;
                  y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - height) - stDisplayBitmap.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                  this.m_stMouseShadowMovie.x = a_3491.a_1080 * (m_stCurrentFieldGrid.m_iXGridNo + 1.5);
                  this.m_stMouseShadowMovie.y = a_3491.a_1081 * (m_stCurrentFieldGrid.m_iYGridNo + 0.8);
                  if(0 == this.m_iAttackTimes % 3)
                  {
                     if(a_1339 > this.m_numHardRate * 5000)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 4)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                        }
                     }
                     else if(a_1339 > 0)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                        }
                     }
                     this.m_iBossStatus = 1;
                     this.m_iPeriodTime = 200;
                  }
                  else if(1 == this.m_iAttackTimes % 3)
                  {
                     if(a_1339 > this.m_numHardRate * 5000)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 8)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
                        }
                     }
                     else if(a_1339 > 0)
                     {
                        if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
                        {
                           a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                           gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
                        }
                     }
                     this.m_iBossStatus = 3;
                     this.m_iPeriodTime = 75;
                  }
                  else if(2 == this.m_iAttackTimes % 3)
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
                     this.m_iBossStatus = 4;
                     this.m_iPeriodTime = 80;
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
               if((a_1273 == (a_1276[a_1275] as FrameLabel).frame + 4 || a_1273 == (a_1276[a_1275] as FrameLabel).frame + 9 || a_1273 == (a_1276[a_1275] as FrameLabel).frame + 14) && iCurrentTime >= this.a_1321 + this.a_1309)
               {
                  if(iCurrentTime >= this.a_1321 + this.a_1309)
                  {
                     this.a_1321 = iCurrentTime;
                     stPupalCocoonMouseMoveIntruder = PupalCocoonMouseMoveIntruder.a_3926();
                     if(stPupalCocoonMouseMoveIntruder)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(BattleFieldView.a_1011)];
                        stPupalCocoonMouseMoveIntruder.a_1797(0,-1);
                        stPupalCocoonMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                        stPupalCocoonMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                        stPupalCocoonMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - stPupalCocoonMouseMoveIntruder.width);
                        stPupalCocoonMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stPupalCocoonMouseMoveIntruder.height);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPupalCocoonMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPupalCocoonMouseMoveIntruder,stTargetFieldGrid);
                        stPupalCocoonMouseMoveIntruder.m_isRemovedFromBattaleField = true;
                        stTargetFieldGrid.m_stCurrentBattbleFieldView.ReduceRowIntruderNum(stPupalCocoonMouseMoveIntruder,stTargetFieldGrid.m_iYGridNo);
                        stTargetFieldGrid.m_iFieldGridType = 2;
                        this.a_3502(stTargetFieldGrid);
                     }
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
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
               }
            }
         }
         if(4 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime < 80 && this.m_iPeriodTime % 20 == 0)
               {
                  stMummyCoffinMouseMoveIntruder = MummyCoffinMouseMoveIntruder.a_3926() as MummyCoffinMouseMoveIntruder;
                  if(stMummyCoffinMouseMoveIntruder)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][4 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 4)];
                     stMummyCoffinMouseMoveIntruder.a_1797(0,-1);
                     stMummyCoffinMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stMummyCoffinMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     stMummyCoffinMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - stMummyCoffinMouseMoveIntruder.width);
                     stMummyCoffinMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stMummyCoffinMouseMoveIntruder.height);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stMummyCoffinMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stMummyCoffinMouseMoveIntruder,stTargetFieldGrid);
                     stTargetFieldGrid.m_iFieldGridType = 2;
                     this.a_3502(stTargetFieldGrid);
                     stMummyCoffinMouseMoveIntruder.m_iMummyMouseMoveIntruderGlobalID = this.a_4265();
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 100000;
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
      
      protected function a_3503(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid)
         {
            stFieldGrid.a_3503();
         }
         return true;
      }
   }
}


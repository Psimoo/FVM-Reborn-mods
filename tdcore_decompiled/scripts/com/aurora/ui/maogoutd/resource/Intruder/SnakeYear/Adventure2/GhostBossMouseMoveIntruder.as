package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure2
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.GhostScepterMouseMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.GhostBossEatenCardEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GhostBossMouseMoveIntruder extends a_4206
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
      
      private var m_arrGhostWildfireMouseMoveIntruder:Array = [];
      
      private var m_stGhostScepterMouseMoveIntruder:GhostScepterMouseMoveIntruder;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var ballArray:Array = new Array();
      
      private var moveTick:int = 3;
      
      public function GhostBossMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GhostBossMouseMoveIntruder) as GhostBossMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GhostBossMouseMoveIntruderMovie;
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
         this.m_iPeriodTime = 100;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.2;
         this.a_1321 = 0;
         this.m_arrGhostWildfireMouseMoveIntruder = [];
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(this.m_stGhostScepterMouseMoveIntruder)
         {
            this.m_stGhostScepterMouseMoveIntruder.a_3969(this.m_stGhostScepterMouseMoveIntruder.iLifeValue);
            this.m_stGhostScepterMouseMoveIntruder.a_4212();
         }
         this.m_arrGhostWildfireMouseMoveIntruder = null;
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
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 15)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 15;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 15] as FrameLabel).frame);
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
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 15)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 15;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 15] as FrameLabel).frame);
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
      
      private function AddWildFire(iNoX:int, iNoY:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stGhostWildfireMouseMoveIntruder:GhostWildfireMouseMoveIntruder = null;
         stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iNoY][iNoX];
         stGhostWildfireMouseMoveIntruder = GhostWildfireMouseMoveIntruder.a_3926() as GhostWildfireMouseMoveIntruder;
         stGhostWildfireMouseMoveIntruder.m_iGhostMouseMoveIntruderGlobalID = this.a_4265();
         stGhostWildfireMouseMoveIntruder.a_1797(0,-1);
         stGhostWildfireMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
         stGhostWildfireMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stGhostWildfireMouseMoveIntruder,stTargetFieldGrid);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stGhostWildfireMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
         this.m_arrGhostWildfireMouseMoveIntruder.push(stGhostWildfireMouseMoveIntruder);
         this.ballArray.push([stGhostWildfireMouseMoveIntruder,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         stGhostWildfireMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 16;
         stGhostWildfireMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo - 3;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var stGhostBossBianBianMouseMoveIntruder:GhostBossBianBianMouseMoveIntruder = null;
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var iNoY:int = 0;
         var iNoX:int = 0;
         var bfind:Boolean = false;
         var iAddBlood:int = 0;
         var iTempIndex:int = 0;
         var stAddBloodEffect:AddBloodEffect = null;
         var stTempFieldGrid:a_3491 = null;
         var dis:int = 0;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(261 == iMapID)
               {
                  this.m_numHardRate = 1.4;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.15;
                  }
               }
               else if(773 == iMapID)
               {
                  this.m_numHardRate = 1.4;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.15;
                  }
               }
               else if(2053 == iMapID)
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
               this.m_arrGhostWildfireMouseMoveIntruder = [];
               a_1463 = true;
               a_1465 = 0;
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 140;
               visible = true;
               this.ballArray.length = 0;
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 1];
               x = a_1283 ? 0 : BattleFieldView.a_1013;
               y += (stTargetFieldGrid.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081;
               ChangeFieldGrid(stTargetFieldGrid);
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 8)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime > 70 && this.m_iPeriodTime % 10 == 0)
               {
                  iNoY = int(this.m_stRandomSeed.nextInt(7));
                  iNoX = this.m_stRandomSeed.nextInt(5) + 3;
                  while(true)
                  {
                     bfind = false;
                     for(i = 0; i < this.ballArray.length; i++)
                     {
                        if(this.ballArray[i][1] == iNoX && this.ballArray[i][2] == iNoY)
                        {
                           bfind = true;
                           break;
                        }
                     }
                     if(!bfind)
                     {
                        break;
                     }
                     iNoY = int(this.m_stRandomSeed.nextInt(7));
                     iNoX = this.m_stRandomSeed.nextInt(5) + 3;
                  }
                  this.AddWildFire(iNoX,iNoY);
               }
               if(70 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 4)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
                     }
                  }
               }
               else if(54 == this.m_iPeriodTime)
               {
                  for(i = 0; i < this.ballArray.length; i++)
                  {
                     this.ballArray[i][0].Change2Mouse();
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 100000;
               SetCannotSeeByFighter(true);
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               SetCannotSeeByFighter(false);
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 120;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 11] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 108)
               {
                  if(null == this.m_stGhostScepterMouseMoveIntruder)
                  {
                     this.m_stGhostScepterMouseMoveIntruder = GhostScepterMouseMoveIntruder.a_3926() as GhostScepterMouseMoveIntruder;
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[2 + this.m_stRandomSeed.nextInt(3)][3 + this.m_stRandomSeed.nextInt(3)];
                  this.m_stGhostScepterMouseMoveIntruder.a_1797(0,-1);
                  this.m_stGhostScepterMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                  this.m_stGhostScepterMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                  this.m_stGhostScepterMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - this.m_stGhostScepterMouseMoveIntruder.width) + 30;
                  this.m_stGhostScepterMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.m_stGhostScepterMouseMoveIntruder.height) - 15;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stGhostScepterMouseMoveIntruder,stTargetFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stGhostScepterMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                  this.m_iPeriodTime = 48;
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
                  ++this.m_iAttackTimes;
                  a_1465 = 0;
                  SetCannotSeeByFighter(false);
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               SetCannotSeeByFighter(false);
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 100;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 15;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 14] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 17;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 16] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 80)
               {
               }
               if(40 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 18;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 18] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 19;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 19] as FrameLabel).frame);
                  }
                  iAddBlood = 0;
                  for(iTempIndex = 0; iTempIndex < 6; iTempIndex++)
                  {
                     stTempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.ballArray[iTempIndex][2]][this.ballArray[iTempIndex][1]];
                     if(this.EatDefenseCardEffect(stTempFieldGrid))
                     {
                        iAddBlood += 2000;
                     }
                  }
                  this.a_3969(-iAddBlood);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
                  stAddBloodEffect.x = x;
                  stAddBloodEffect.y = y;
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
               SetCannotSeeByFighter(false);
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 280;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
               }
               play();
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 3)];
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime <= 270 && this.m_iPeriodTime > 240)
               {
                  x += (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo - 2) * a_3491.a_1080 / 30;
                  y += (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081 / 30;
               }
               if(this.m_iPeriodTime == 240)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 25;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 24] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 27;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 26] as FrameLabel).frame);
                  }
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,this.a_1598);
               }
               if(this.m_iPeriodTime == 200)
               {
                  stTargetFieldGrid = this.a_1598;
                  ChangeFieldGrid(stTargetFieldGrid);
                  this.a_3502(stTargetFieldGrid);
                  stGhostBossBianBianMouseMoveIntruder = GhostBossBianBianMouseMoveIntruder.a_3926() as GhostBossBianBianMouseMoveIntruder;
                  if(stGhostBossBianBianMouseMoveIntruder)
                  {
                     stGhostBossBianBianMouseMoveIntruder.a_1797(0,-1);
                     stGhostBossBianBianMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stGhostBossBianBianMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     stGhostBossBianBianMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stGhostBossBianBianMouseMoveIntruder.width);
                     stGhostBossBianBianMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stGhostBossBianBianMouseMoveIntruder.height);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stGhostBossBianBianMouseMoveIntruder,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stGhostBossBianBianMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                  }
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
                  }
                  dis = 0;
                  while(dis == 0)
                  {
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 3)];
                     dis = Math.abs(this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) + Math.abs(this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  this.moveTick = dis * 10;
                  if(this.moveTick < 10)
                  {
                     this.moveTick = 10;
                  }
                  if(this.moveTick > 30)
                  {
                     this.moveTick = 30;
                  }
               }
               if(this.m_iPeriodTime <= 170 && this.m_iPeriodTime > 170 - this.moveTick)
               {
                  x += (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) * a_3491.a_1080 / this.moveTick;
                  y += (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081 / this.moveTick;
               }
               if(this.m_iPeriodTime == 170 - this.moveTick)
               {
                  this.m_iPeriodTime = 139;
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 25;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 24] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 27;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 26] as FrameLabel).frame);
                  }
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,this.a_1598);
               }
               if(this.m_iPeriodTime == 100)
               {
                  stTargetFieldGrid = this.a_1598;
                  ChangeFieldGrid(stTargetFieldGrid);
                  this.a_3502(stTargetFieldGrid);
                  stGhostBossBianBianMouseMoveIntruder = GhostBossBianBianMouseMoveIntruder.a_3926() as GhostBossBianBianMouseMoveIntruder;
                  if(stGhostBossBianBianMouseMoveIntruder)
                  {
                     stGhostBossBianBianMouseMoveIntruder.a_1797(0,-1);
                     stGhostBossBianBianMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stGhostBossBianBianMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     stGhostBossBianBianMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stGhostBossBianBianMouseMoveIntruder.width);
                     stGhostBossBianBianMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stGhostBossBianBianMouseMoveIntruder.height);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stGhostBossBianBianMouseMoveIntruder,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stGhostBossBianBianMouseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                  }
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
                  }
                  this.m_iPeriodTime = 20;
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
               SetCannotSeeByFighter(false);
               this.m_iBossStatus = 4;
               this.m_iPeriodTime = 180;
               a_1465 = 0;
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
               play();
               this.m_stGhostScepterMouseMoveIntruder.a_3969(this.m_stGhostScepterMouseMoveIntruder.iLifeValue);
               this.m_stGhostScepterMouseMoveIntruder.a_4212();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(120 == this.m_iPeriodTime)
            {
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
               }
            }
            if(112 == this.m_iPeriodTime)
            {
               visible = false;
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
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
      
      protected function EatDefenseCardEffect(stFieldGrid:a_3491) : Boolean
      {
         var stBaseDefense:a_3962 = null;
         var stGhostBossEatenCardEffect:GhostBossEatenCardEffect = null;
         stBaseDefense = stFieldGrid.a_3494();
         if(stBaseDefense)
         {
            stGhostBossEatenCardEffect = GhostBossEatenCardEffect.a_3926();
            stGhostBossEatenCardEffect.a_1797(stBaseDefense.stDisplayBitmap.bitmapData,x - 40,y + 90);
            stGhostBossEatenCardEffect.x = stBaseDefense.x;
            stGhostBossEatenCardEffect.y = stBaseDefense.y;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stGhostBossEatenCardEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
            stBaseDefense.m_iDieType = 1;
            stBaseDefense.a_3969(stBaseDefense.iLifeValue);
            if(stBaseDefense.iLifeValue <= 0)
            {
               return true;
            }
         }
         return false;
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


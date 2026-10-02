package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon
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
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class VampireBossMouseMoveIntruder extends a_4206
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
      
      private var m_arrVampireBossBatsMouseMoveIntruder:Array = [];
      
      private var m_stVampireBossTailMoveIntruder:VampireBossTailMoveIntruder;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function VampireBossMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VampireBossMouseMoveIntruder) as VampireBossMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VampireBossMouseMoveIntruderMovie;
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
         this.m_iPeriodTime = 100;
         a_1463 = true;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.46;
         this.a_1321 = 0;
         this.m_arrVampireBossBatsMouseMoveIntruder = [];
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
               if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 12)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
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
            if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 12)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + 12;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 12] as FrameLabel).frame);
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
         var stAddBloodEffect:AddBloodEffect = null;
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var stVampireBossBatsMouseMoveIntruder:VampireBossBatsMoveIntruder = null;
         var iTargetYGridNo:int = 0;
         var iTargetYGridNo2:int = 0;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(518 == iMapID)
               {
                  this.m_numHardRate = 1.45;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.2;
                  }
               }
               else if(6 == iMapID)
               {
                  this.m_numHardRate = 1.35;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.1;
                  }
               }
               else if(2053 == iMapID)
               {
                  this.m_numHardRate = 1.6;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.3;
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
               this.m_arrVampireBossBatsMouseMoveIntruder = [];
               a_1463 = true;
               a_1465 = 0;
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 180;
               visible = true;
               play();
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 11;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(a_1273 == (a_1276[9] as FrameLabel).frame - 1 || a_1273 == (a_1276[11] as FrameLabel).frame - 1)
               {
                  stop();
               }
               if(this.m_iPeriodTime > 100 && this.m_iPeriodTime % 12 == 0)
               {
                  stVampireBossBatsMouseMoveIntruder = VampireBossBatsMoveIntruder.a_3926() as VampireBossBatsMoveIntruder;
                  if(stVampireBossBatsMouseMoveIntruder)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid;
                     stVampireBossBatsMouseMoveIntruder.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 4)];
                     stVampireBossBatsMouseMoveIntruder.m_iGhostMouseMoveIntruderGlobalID = this.a_4265();
                     stVampireBossBatsMouseMoveIntruder.a_1797(0,-1);
                     stVampireBossBatsMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stVampireBossBatsMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stVampireBossBatsMouseMoveIntruder,stTargetFieldGrid);
                     stVampireBossBatsMouseMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - stVampireBossBatsMouseMoveIntruder.width) * 0.5;
                     stVampireBossBatsMouseMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stVampireBossBatsMouseMoveIntruder.height) * 0.5;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stVampireBossBatsMouseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
                     this.m_arrVampireBossBatsMouseMoveIntruder.push(stVampireBossBatsMouseMoveIntruder);
                  }
               }
               if(100 == this.m_iPeriodTime)
               {
                  play();
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 1)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 11] as FrameLabel).frame);
                     }
                  }
                  for each(stVampireBossBatsMouseMoveIntruder in this.m_arrVampireBossBatsMouseMoveIntruder)
                  {
                     stVampireBossBatsMouseMoveIntruder.GoTargetFieldGrid();
                  }
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_iBossStatus = 1;
                  this.m_iPeriodTime = 100000;
               }
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 200;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
               }
               play();
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
               if(this.m_iPeriodTime == 180)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 2)];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(this.m_iPeriodTime == 160)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
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
                  this.m_stVampireBossTailMoveIntruder = VampireBossTailMoveIntruder.a_3926() as VampireBossTailMoveIntruder;
                  this.m_stVampireBossTailMoveIntruder.m_iMummyMouseMoveIntruderGlobalID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_isShotDaoGuang = false;
                  this.m_stVampireBossTailMoveIntruder.a_1797(0,-1);
                  this.m_stVampireBossTailMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVampireBossTailMoveIntruder,m_stCurrentFieldGrid);
                  this.m_stVampireBossTailMoveIntruder.x = x + 30;
                  this.m_stVampireBossTailMoveIntruder.y = y + 60;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVampireBossTailMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,this.a_1598);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,this.a_1598);
               }
               if(140 == this.m_iPeriodTime)
               {
                  this.m_stVampireBossTailMoveIntruder.a_3969(-300);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = x;
                  stAddBloodEffect.y = y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,m_stCurrentFieldGrid);
               }
               if(130 == this.m_iPeriodTime)
               {
                  this.m_stVampireBossTailMoveIntruder.a_3969(-300);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = x + 5;
                  stAddBloodEffect.y = y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,m_stCurrentFieldGrid);
               }
               if(this.m_iPeriodTime == 120)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
                  this.m_stVampireBossTailMoveIntruder.a_3969(this.m_stVampireBossTailMoveIntruder.iLifeValue);
                  this.m_stVampireBossTailMoveIntruder.a_4212();
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 2)];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(this.m_iPeriodTime == 100)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
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
                  this.m_stVampireBossTailMoveIntruder = VampireBossTailMoveIntruder.a_3926() as VampireBossTailMoveIntruder;
                  this.m_stVampireBossTailMoveIntruder.m_iMummyMouseMoveIntruderGlobalID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_isShotDaoGuang = false;
                  this.m_stVampireBossTailMoveIntruder.a_1797(0,-1);
                  this.m_stVampireBossTailMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVampireBossTailMoveIntruder,m_stCurrentFieldGrid);
                  this.m_stVampireBossTailMoveIntruder.x = x + 30;
                  this.m_stVampireBossTailMoveIntruder.y = y + 60;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVampireBossTailMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,this.a_1598);
                  this.m_stVampireBossTailMoveIntruder.a_3969(-500);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = x;
                  stAddBloodEffect.y = y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
               if(80 == this.m_iPeriodTime)
               {
                  this.m_stVampireBossTailMoveIntruder.a_3969(-300);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = x;
                  stAddBloodEffect.y = y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
               if(70 == this.m_iPeriodTime)
               {
                  this.m_stVampireBossTailMoveIntruder.a_3969(-300);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = x + 5;
                  stAddBloodEffect.y = y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
               if(this.m_iPeriodTime == 60)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
                  this.m_stVampireBossTailMoveIntruder.a_3969(this.m_stVampireBossTailMoveIntruder.iLifeValue);
                  this.m_stVampireBossTailMoveIntruder.a_4212();
               }
               if(20 == this.m_iPeriodTime)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[3][BattleFieldView.a_1011 - 1];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(0 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
                  this.m_iBossStatus = 2;
                  this.m_iPeriodTime = 100000;
                  ++this.m_iAttackTimes;
                  a_1465 = 0;
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 180;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
               }
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
               if(140 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
                  iTargetYGridNo = 0;
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iTargetYGridNo][BattleFieldView.a_1011 - 1];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(120 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
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
                  this.m_stVampireBossTailMoveIntruder = VampireBossTailMoveIntruder.a_3926() as VampireBossTailMoveIntruder;
                  this.m_stVampireBossTailMoveIntruder.m_iMummyMouseMoveIntruderGlobalID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_isShotDaoGuang = true;
                  this.m_stVampireBossTailMoveIntruder.a_1797(0,-1);
                  this.m_stVampireBossTailMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVampireBossTailMoveIntruder,m_stCurrentFieldGrid);
                  this.m_stVampireBossTailMoveIntruder.x = x + 30;
                  this.m_stVampireBossTailMoveIntruder.y = y + 60;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVampireBossTailMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
               }
               if(this.m_iPeriodTime == 100)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
                  this.m_stVampireBossTailMoveIntruder.a_3969(this.m_stVampireBossTailMoveIntruder.iLifeValue);
                  this.m_stVampireBossTailMoveIntruder.a_4212();
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
               this.m_iPeriodTime = 180;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
               }
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
               if(140 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
                  iTargetYGridNo2 = BattleFieldView.a_1012 - 1;
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iTargetYGridNo2][BattleFieldView.a_1011 - 1];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(120 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
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
                  this.m_stVampireBossTailMoveIntruder = VampireBossTailMoveIntruder.a_3926() as VampireBossTailMoveIntruder;
                  this.m_stVampireBossTailMoveIntruder.m_iMummyMouseMoveIntruderGlobalID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_isShotDaoGuang = true;
                  this.m_stVampireBossTailMoveIntruder.a_1797(0,-1);
                  this.m_stVampireBossTailMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                  this.m_stVampireBossTailMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stVampireBossTailMoveIntruder,m_stCurrentFieldGrid);
                  this.m_stVampireBossTailMoveIntruder.x = x + 30;
                  this.m_stVampireBossTailMoveIntruder.y = y + 60;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stVampireBossTailMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
               }
               if(this.m_iPeriodTime == 100)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
                  this.m_stVampireBossTailMoveIntruder.a_3969(this.m_stVampireBossTailMoveIntruder.iLifeValue);
                  this.m_stVampireBossTailMoveIntruder.a_4212();
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
         return -0.3 * width;
      }
      
      protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}


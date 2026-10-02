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
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4128;
   import com.aurora.ui.maogoutd.resource.shot.DragonUpperBodyBossShot;
   import flash.display.FrameLabel;
   
   public class DragonMachineBossUpperBodyMoveIntruder extends a_4206
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
      
      protected var a_1324:Array = [];
      
      private var m_stGhostScepterMouseMoveIntruder:GhostScepterMouseMoveIntruder;
      
      private var m_stGhostBossMindMoveIntruder:GhostBossMindMoveIntruder;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public var m_isSummonUpByDragonFullBodyBoss:Boolean = false;
      
      public function DragonMachineBossUpperBodyMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DragonMachineBossUpperBodyMoveIntruder) as DragonMachineBossUpperBodyMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonMachineBossUpperBodyMoveIntruderMovie;
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
         a_1279 = -width * 0.5;
         a_1467 = -40;
         this.a_1321 = 0;
         this.m_isSummonUpByDragonFullBodyBoss = false;
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
               if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 26)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 26;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 26] as FrameLabel).frame);
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
            if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 26)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + 26;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 26] as FrameLabel).frame);
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               play();
            }
         }
         a_3419();
         var stDataEvent:a_1778 = new a_1778("AurBossBloodProgress");
         stDataEvent.dataObject = a_1339 / (this.m_numHardRate * 15000);
         if(Boolean(root) && !this.m_isSummonUpByDragonFullBodyBoss)
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
         if(Boolean(root) && !this.m_isSummonUpByDragonFullBodyBoss)
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
         var iYGridNo:int = 0;
         var stTempFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         var stFlyBossMouseMoveIntruder:a_4206 = null;
         var stLastWaitShot:DragonUpperBodyBossShot = null;
         var numShotXpos:Number = NaN;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(2053 == iMapID)
               {
                  this.m_numHardRate = 1.8;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 1.5;
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
               this.m_iPeriodTime = 160;
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
               this.m_numXMoveSpeed = 0;
               this.m_numYMoveSpeed = -a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo / 20;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
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
                  iYGridNo = int((y + stDisplayBitmap.height + stDisplayBitmap.y) / a_3491.a_1081);
                  if(m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
                  {
                     stTempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,iYGridNo);
                     ChangeFieldGrid(stTempFieldGrid);
                  }
               }
               if(140 == this.m_iPeriodTime)
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
                  this.m_numYMoveSpeed = a_3491.a_1081 / 10;
               }
               if(80 == this.m_iPeriodTime)
               {
                  this.m_numYMoveSpeed = 0;
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
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[BattleFieldView.a_1012 - 1][BattleFieldView.a_1011 - 1];
                  ChangeFieldGrid(this.a_1598);
                  this.m_numYMoveSpeed = 0;
                  a_4128.a_1413 = true;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stLargeFogEffect.a_1797();
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3462(4);
               }
               if(60 == this.m_iPeriodTime)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 1)][BattleFieldView.a_1011 - 1];
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
               }
               if(40 == this.m_iPeriodTime)
               {
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                     }
                  }
                  else if(a_1339 > 0)
                  {
                     if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                     {
                        a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                        gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                     }
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 100000;
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
                  a_1275 = this.m_iChangeFireWizardLableIndex + 15;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 14] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 18;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 17] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(0 == this.m_iPeriodTime % 20)
               {
                  for each(stMoveIntruder in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
                  {
                     if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.parent) && stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_3969(-100);
                        stAddBloodEffect = AddBloodEffect.a_3926();
                        stAddBloodEffect.a_1797(false);
                        stAddBloodEffect.x = stMoveIntruder.x;
                        stAddBloodEffect.y = stMoveIntruder.y;
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,m_stCurrentFieldGrid);
                     }
                  }
               }
               if(7 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 16;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 16] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 19;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 19] as FrameLabel).frame);
                  }
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
               this.m_iPeriodTime = 300;
               a_1465 = 0;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 12;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 11] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(240 == this.m_iPeriodTime)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 1];
                  stFlyBossMouseMoveIntruder = a_4255.getInstance().a_4256(8388646);
                  if(stFlyBossMouseMoveIntruder)
                  {
                     stFlyBossMouseMoveIntruder.a_1797(0,-1);
                     stFlyBossMouseMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stFlyBossMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stFlyBossMouseMoveIntruder,stTargetFieldGrid);
                     stFlyBossMouseMoveIntruder.x = BattleFieldView.a_1013;
                     (stFlyBossMouseMoveIntruder as Object).m_isSummonUpByDragonBoss = true;
                  }
               }
               if(this.m_iPeriodTime == 32)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 13;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 13] as FrameLabel).frame);
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
               this.m_iPeriodTime = 180;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 20] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 21] as FrameLabel).frame);
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
               if(120 == this.m_iPeriodTime)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 3)];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               }
               if(100 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 22] as FrameLabel).frame);
                  }
                  else if(a_1339 > 0)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 23] as FrameLabel).frame);
                  }
               }
               if(this.m_iPeriodTime == 92)
               {
                  if(iCurrentTime >= this.a_1321 + this.a_1309)
                  {
                     this.a_1321 = iCurrentTime;
                     stLastWaitShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                     if(null == stLastWaitShot)
                     {
                        return false;
                     }
                     this.a_1324.push(stLastWaitShot);
                  }
                  while(this.a_1324.length > 0)
                  {
                     numShotXpos = this.a_3955();
                     if(a_1283)
                     {
                        numShotXpos = -numShotXpos;
                     }
                     stLastWaitShot = this.a_1324.pop();
                     stLastWaitShot.a_1598 = m_stCurrentFieldGrid;
                     stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + this.a_3956(),m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                     parent.addChild(stLastWaitShot);
                  }
               }
               if(50 == this.m_iPeriodTime)
               {
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[1 + this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 1)][BattleFieldView.a_1011 - 1];
                  this.m_numXMoveSpeed = a_3491.a_1080 * (this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) / 20;
                  this.m_numYMoveSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo) / 20;
               }
               if(30 == this.m_iPeriodTime)
               {
                  this.m_numXMoveSpeed = 0;
                  this.m_numYMoveSpeed = 0;
                  ChangeFieldGrid(this.a_1598);
                  x = BattleFieldView.a_1013;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               ++this.m_iAttackTimes;
               if(0 == this.m_iAttackTimes % 2)
               {
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 100000;
               }
               else
               {
                  this.m_iBossStatus = 1;
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
      
      public function SumonUp(isAppear:Boolean) : void
      {
         if(isAppear)
         {
            this.m_iBossStatus = 0;
            visible = true;
            SetCannotSeeByFighter(false);
         }
         else
         {
            this.m_iBossStatus = 20;
            visible = false;
            SetCannotSeeByFighter(true);
         }
      }
   }
}


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
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.WoodDuckDownRope;
   import com.aurora.ui.maogoutd.resource.effect.WoodDuckUpRope;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class DeepSeaWoodDuckBossMoveIntruder extends a_4206
   {
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_stUpDeepSeaWoodDuckMoveIntruder:DeepSeaWoodDuckMoveIntruder;
      
      private var m_stDownDeepSeaWoodDuckMoveIntruder:DeepSeaWoodDuckMoveIntruder;
      
      private var m_stWoodDuckUpRope:WoodDuckUpRope = new WoodDuckUpRope();
      
      private var m_stWoodDuckDownRope:WoodDuckDownRope = new WoodDuckDownRope();
      
      protected var a_1447:int;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var m_numHardRate:Number = 1;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function DeepSeaWoodDuckBossMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DeepSeaWoodDuckBossMoveIntruder) as DeepSeaWoodDuckBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DeepSeaWoodDuckBossMoveIntruderMovie;
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
         a_1350 = a_3491.a_1080 / 250;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 100000;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.2;
         a_1467 = 0;
         this.a_1447 = 0;
         this.m_stWoodDuckUpRope.visible = false;
         this.m_stWoodDuckDownRope.visible = false;
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stWoodDuckUpRope.visible = false;
         this.m_stWoodDuckDownRope.visible = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= this.m_numHardRate * 5000)
         {
            if(a_1339 <= 0)
            {
               if(a_1339 <= 0 && a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
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
            if(a_1339 <= 0 && a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
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
         var stTargetFieldGrid:a_3491 = null;
         var stTmpFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var stDeepSeaWoodDuckStoneMillMoveIntruder:DeepSeaWoodDuckStoneMillMoveIntruder = null;
         var stSummonUpMoveIntruder:a_4206 = null;
         if(!a_1460)
         {
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 100000;
            a_1465 = 0;
            a_1463 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            a_1460 = true;
            this.a_1447 = iCurrentTime;
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[3][BattleFieldView.a_1011 - 1];
            x = a_1283 ? 0 : BattleFieldView.a_1013;
            y = iYPosSkewing + a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stDisplayBitmap.height);
            ChangeFieldGrid(stTargetFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 2);
            this.m_stUpDeepSeaWoodDuckMoveIntruder = DeepSeaWoodDuckMoveIntruder.a_3926() as DeepSeaWoodDuckMoveIntruder;
            if(Boolean(this.m_stUpDeepSeaWoodDuckMoveIntruder) && Boolean(stTargetFieldGrid))
            {
               this.m_stUpDeepSeaWoodDuckMoveIntruder.a_1797(0,-1);
               this.m_stUpDeepSeaWoodDuckMoveIntruder.iGlobalMoveFighterID = this.a_4265();
               this.m_stUpDeepSeaWoodDuckMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stUpDeepSeaWoodDuckMoveIntruder,stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stUpDeepSeaWoodDuckMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               this.m_stUpDeepSeaWoodDuckMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo;
               this.m_stUpDeepSeaWoodDuckMoveIntruder.y += 10;
               this.m_stUpDeepSeaWoodDuckMoveIntruder.a_3969(-0.3 * a_1339);
            }
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 2);
            this.m_stDownDeepSeaWoodDuckMoveIntruder = DeepSeaWoodDuckMoveIntruder.a_3926() as DeepSeaWoodDuckMoveIntruder;
            if(Boolean(this.m_stDownDeepSeaWoodDuckMoveIntruder) && Boolean(stTargetFieldGrid))
            {
               this.m_stDownDeepSeaWoodDuckMoveIntruder.a_1797(0,-1);
               this.m_stDownDeepSeaWoodDuckMoveIntruder.iGlobalMoveFighterID = this.a_4265();
               this.m_stDownDeepSeaWoodDuckMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stDownDeepSeaWoodDuckMoveIntruder,stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stDownDeepSeaWoodDuckMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               this.m_stDownDeepSeaWoodDuckMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo;
               this.m_stDownDeepSeaWoodDuckMoveIntruder.y += 10;
               this.m_stDownDeepSeaWoodDuckMoveIntruder.a_3969(-0.3 * a_1339);
            }
         }
         if(iCurrentTime - this.a_1447 == 200)
         {
            this.m_stWoodDuckUpRope.visible = true;
            this.m_stWoodDuckDownRope.visible = true;
            this.m_stWoodDuckUpRope.x = x - 0.9 * this.m_stWoodDuckUpRope.width;
            this.m_stWoodDuckUpRope.y = a_3491.a_1081 * (m_stCurrentFieldGrid.m_iYGridNo + 0.4) - this.m_stWoodDuckUpRope.height;
            this.m_stWoodDuckDownRope.x = x - 0.9 * this.m_stWoodDuckDownRope.width;
            this.m_stWoodDuckDownRope.y = a_3491.a_1081 * (m_stCurrentFieldGrid.m_iYGridNo + 0.4);
            stTmpFieldGrid = new a_3491(null,0,m_stCurrentFieldGrid.m_iYGridNo - 2);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stWoodDuckUpRope,BattleLayerDefine.INTRUDER_LAND_TYPE,stTmpFieldGrid);
            stTmpFieldGrid.m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 2;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stWoodDuckDownRope,BattleLayerDefine.INTRUDER_LAND_TYPE,stTmpFieldGrid);
         }
         if(iCurrentTime - this.a_1447 > 200)
         {
            if(null == this.m_stUpDeepSeaWoodDuckMoveIntruder && false == this.m_stUpDeepSeaWoodDuckMoveIntruder.visible)
            {
               this.m_stWoodDuckUpRope.visible = false;
            }
            if(null == this.m_stDownDeepSeaWoodDuckMoveIntruder && false == this.m_stDownDeepSeaWoodDuckMoveIntruder.visible)
            {
               this.m_stWoodDuckDownRope.visible = false;
            }
            x += a_1350;
            this.m_stWoodDuckUpRope.x += a_1350;
            this.m_stWoodDuckDownRope.x += a_1350;
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[m_stCurrentFieldGrid.m_iYGridNo][iXGridNo];
               ChangeFieldGrid(stTargetFieldGrid);
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               this.a_3940();
               return true;
            }
         }
         if(0 == this.m_iBossStatus)
         {
            if(100000 == this.m_iPeriodTime)
            {
               a_1465 = 0;
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 200;
               visible = true;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != 0)
                  {
                     a_1275 = 0;
                     gotoAndStop((a_1276[0] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != 1)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[1] as FrameLabel).frame);
                  }
               }
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
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
               this.m_iPeriodTime = 40;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               play();
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(12 == this.m_iPeriodTime)
               {
                  if(x > a_3491.a_1080 * 8)
                  {
                     stDeepSeaWoodDuckStoneMillMoveIntruder = DeepSeaWoodDuckStoneMillMoveIntruder.a_3926() as DeepSeaWoodDuckStoneMillMoveIntruder;
                     if(stDeepSeaWoodDuckStoneMillMoveIntruder)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid;
                        stDeepSeaWoodDuckStoneMillMoveIntruder.a_1797(0,-1);
                        stDeepSeaWoodDuckStoneMillMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                        stDeepSeaWoodDuckStoneMillMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDeepSeaWoodDuckStoneMillMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stDeepSeaWoodDuckStoneMillMoveIntruder,stTargetFieldGrid);
                        stDeepSeaWoodDuckStoneMillMoveIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - stDeepSeaWoodDuckStoneMillMoveIntruder.height);
                        stDeepSeaWoodDuckStoneMillMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo - 50;
                     }
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stTargetFieldGrid)
                  {
                     stSummonUpMoveIntruder = a_4255.getInstance().a_4256(8388673);
                     if(stSummonUpMoveIntruder)
                     {
                        stSummonUpMoveIntruder.a_1797(0,-1);
                        stSummonUpMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                        stSummonUpMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stSummonUpMoveIntruder,stTargetFieldGrid);
                        m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSummonUpMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                        stSummonUpMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stSummonUpMoveIntruder.width);
                     }
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  stSummonUpMoveIntruder = a_4255.getInstance().a_4256(8388673);
                  if(Boolean(stTargetFieldGrid) && Boolean(stSummonUpMoveIntruder))
                  {
                     stSummonUpMoveIntruder.a_1797(0,-1);
                     stSummonUpMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stSummonUpMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stSummonUpMoveIntruder,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSummonUpMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                     stSummonUpMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stSummonUpMoveIntruder.width) + 30;
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  stSummonUpMoveIntruder = a_4255.getInstance().a_4256(8388673);
                  if(Boolean(stTargetFieldGrid) && Boolean(stSummonUpMoveIntruder))
                  {
                     stSummonUpMoveIntruder.a_1797(0,-1);
                     stSummonUpMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     stSummonUpMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stSummonUpMoveIntruder,stTargetFieldGrid);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSummonUpMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
                     stSummonUpMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stSummonUpMoveIntruder.width) + 30;
                  }
               }
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
      
      protected function a_3955() : Number
      {
         return 0.02 * width;
      }
      
      protected function a_3956() : Number
      {
         return 0.05 * height;
      }
   }
}


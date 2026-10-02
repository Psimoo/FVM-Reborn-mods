package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class PlumberDongJunBossMoveIntruder extends a_4206
   {
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iAttackTimes:int = 0;
      
      protected var a_1309:int = 18;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 1000;
      
      protected var a_1312:int = 15;
      
      protected var a_1321:int = 0;
      
      private var a_1324:Array = [];
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      protected var a_1598:a_3491;
      
      protected var m_stTargetFieldGrid1:a_3491;
      
      protected var m_stTargetFieldGrid2:a_3491;
      
      protected var m_iStartTime:int;
      
      protected var m_numHardRate:Number = 1;
      
      public var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function PlumberDongJunBossMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(PlumberDongJunBossMoveIntruder) as PlumberDongJunBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return PlumberDongJunBossMoveIntruderMovie;
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
         this.m_iAttackTimes = 0;
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 20;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.2;
         a_1481 = false;
         a_1463 = true;
         this.a_1321 = 0;
         return true;
      }
      
      public function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1598 = null;
         this.m_stTargetFieldGrid1 = null;
         this.m_stTargetFieldGrid2 = null;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.m_numHardRate * 5000)
         {
            if(0 == this.m_iBossStatus)
            {
               this.SetAnimation2(1);
            }
            else if(1 == this.m_iBossStatus)
            {
               this.SetAnimation2(4);
            }
         }
         else if(a_1339 > 0)
         {
            if(0 == this.m_iBossStatus)
            {
               this.SetAnimation2(3);
            }
            else if(1 == this.m_iBossStatus)
            {
               this.SetAnimation2(5);
            }
         }
         else if(a_1339 <= 0)
         {
            this.SetAnimation2(10);
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
            if(0 == this.m_iBossStatus)
            {
               this.SetAnimation2(3);
            }
            else if(1 == this.m_iBossStatus)
            {
               this.SetAnimation2(5);
            }
         }
         else if(a_1339 <= 0)
         {
            this.SetAnimation2(10);
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
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      private function CreateEnter(grid:a_3491) : PlumberPipelineEntranceMoveIntruder
      {
         var stPlumberPipelineEntranceMoveIntruder:PlumberPipelineEntranceMoveIntruder = null;
         if(Boolean(grid) && 2 == grid.m_iFieldGridType)
         {
            return null;
         }
         if(grid != null)
         {
            stPlumberPipelineEntranceMoveIntruder = PlumberPipelineEntranceMoveIntruder.a_3926() as PlumberPipelineEntranceMoveIntruder;
            stPlumberPipelineEntranceMoveIntruder.a_1797(0,-1);
            stPlumberPipelineEntranceMoveIntruder.iGlobalMoveFighterID = this.a_4265();
            stPlumberPipelineEntranceMoveIntruder.m_stMoveIntruderTypeID = 8388608;
            stPlumberPipelineEntranceMoveIntruder.x = a_3491.a_1080 * grid.m_iXGridNo + (a_3491.a_1080 - stPlumberPipelineEntranceMoveIntruder.width);
            stPlumberPipelineEntranceMoveIntruder.y = a_3491.a_1081 * grid.m_iYGridNo + (a_3491.a_1081 - stPlumberPipelineEntranceMoveIntruder.height);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPlumberPipelineEntranceMoveIntruder,grid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPlumberPipelineEntranceMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,grid);
            stPlumberPipelineEntranceMoveIntruder.InitBOSS(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.ReduceRowIntruderNum(stPlumberPipelineEntranceMoveIntruder,m_stCurrentFieldGrid.m_iYGridNo);
            stPlumberPipelineEntranceMoveIntruder.m_isRemovedFromBattaleField = true;
            stPlumberPipelineEntranceMoveIntruder.m_iOldGridType = grid.m_iFieldGridType;
            grid.m_iFieldGridType = 2;
            ClearFieldGridDefenseCard(grid,true);
         }
         return null;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stCurTargetFieldGrid:a_3491 = null;
         var iMapID:int = 0;
         var byGameMod:int = 0;
         var enter:PlumberPipelineEntranceMoveIntruder = null;
         var targetGridX:int = 0;
         var iXGridNo:int = 0;
         if(!a_1460)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               byGameMod = int((root as Object).m_stGameData["byGameMode"]);
               if(3 == iMapID)
               {
                  this.m_numHardRate = 0.55;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.4;
                  }
               }
               else if(1 == iMapID)
               {
                  this.m_numHardRate = 0.6;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.5;
                  }
               }
               else if(257 == iMapID)
               {
                  this.m_numHardRate = 0.6;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.5;
                  }
               }
               else if(2562 == iMapID)
               {
                  this.m_numHardRate = 1;
                  if(byGameMod > 1)
                  {
                     this.m_numHardRate = 0.9;
                  }
               }
               a_1339 *= this.m_numHardRate;
            }
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 50;
            a_1465 = 0;
            this.SetAnimationOnce2Loop2(0,1);
            a_1460 = true;
            this.m_iStartTime = iCurrentTime;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         if(0 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(40 == this.m_iPeriodTime)
            {
               a_1465 = 0;
               SetCannotSeeByFighter(false);
            }
            if(0 == this.m_iPeriodTime)
            {
               if(this.m_iAttackTimes % 2 == 0)
               {
                  this.m_iBossStatus = 1;
                  this.m_iPeriodTime = 60;
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     this.SetAnimation2(4);
                  }
                  else if(a_1339 > 0)
                  {
                     this.SetAnimation2(5);
                  }
                  this.a_1598 = m_stCurrentFieldGrid;
                  this.m_stTargetFieldGrid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  this.m_stTargetFieldGrid2 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
               }
               else
               {
                  this.m_iBossStatus = 3;
                  this.m_iPeriodTime = 180;
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     this.SetAnimation2(6);
                  }
                  else if(a_1339 > 0)
                  {
                     this.SetAnimation2(7);
                  }
               }
               ++this.m_iAttackTimes;
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime == 51 && (Boolean(this.a_1598) && Boolean(2 == this.a_1598.m_iFieldGridType) && (Boolean(this.m_stTargetFieldGrid1) && Boolean(2 == this.m_stTargetFieldGrid1.m_iFieldGridType)) && (Boolean(this.m_stTargetFieldGrid2) && Boolean(2 == this.m_stTargetFieldGrid2.m_iFieldGridType))))
               {
                  this.m_iPeriodTime = 0;
               }
               if(this.m_iPeriodTime == 50)
               {
                  this.CreateEnter(this.a_1598);
                  this.CreateEnter(this.m_stTargetFieldGrid1);
                  this.CreateEnter(this.m_stTargetFieldGrid2);
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 120;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,this.a_1598);
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  this.SetAnimation2(6);
               }
               else if(a_1339 > 0)
               {
                  this.SetAnimation2(7);
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 120 - 20 && this.m_iPeriodTime < 120 - 8)
            {
               x -= 5;
            }
            if(this.m_iPeriodTime == 120 - 24)
            {
               SetCannotSeeByFighter(true);
               a_1463 = true;
               a_1465 = 3;
               visible = false;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(0 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     this.SetAnimationOnce2Loop2(0,1);
                  }
                  else if(a_1339 > 0)
                  {
                     this.SetAnimationOnce2Loop2(2,3);
                  }
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 50;
                  a_1283 = this.m_stRandomSeed.nextInt(2) == 1;
                  targetGridX = a_1283 ? 0 : int(BattleFieldView.a_1011 - 1);
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][targetGridX];
                  stCurTargetFieldGrid = this.a_1598;
                  ChangeFieldGrid(stCurTargetFieldGrid);
                  x = a_1283 ? 0 : BattleFieldView.a_1013;
                  y = iYPosSkewing + a_3491.a_1081 * stCurTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - height) - stDisplayBitmap.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stCurTargetFieldGrid);
                  visible = true;
               }
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(this.m_iPeriodTime > 60 + 36 && a_1273 >= (a_1276[a_1275] as FrameLabel).frame + 4 && a_1273 <= (a_1276[a_1275] as FrameLabel).frame + 8)
               {
                  if(a_1283)
                  {
                     x += a_3491.a_1080 / 5;
                  }
                  else
                  {
                     x -= a_3491.a_1080 / 5;
                  }
               }
               if(this.m_iPeriodTime > 60 + 36 && a_1273 == (a_1276[a_1275] as FrameLabel).frame + 8)
               {
                  iXGridNo = int(x / a_3491.a_1080);
                  if(iXGridNo % 2 == 1)
                  {
                     ClearFieldGridDefenseCard(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo),true);
                  }
               }
               if(this.m_iPeriodTime == 60 + 36)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     this.SetAnimation2(8);
                  }
                  else if(a_1339 > 0)
                  {
                     this.SetAnimation2(9);
                  }
               }
               if(this.m_iPeriodTime == 62)
               {
                  SetCannotSeeByFighter(true);
                  a_1463 = true;
                  a_1465 = 3;
                  visible = false;
               }
               if(0 == this.m_iPeriodTime)
               {
                  if(a_1339 > this.m_numHardRate * 5000)
                  {
                     this.SetAnimationOnce2Loop2(0,1);
                  }
                  else if(a_1339 > 0)
                  {
                     this.SetAnimationOnce2Loop2(2,3);
                  }
                  this.m_iBossStatus = 0;
                  this.m_iPeriodTime = 50;
                  a_1283 = false;
                  this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_stRandomSeed.nextInt(BattleFieldView.a_1012)][BattleFieldView.a_1011 - 1];
                  stCurTargetFieldGrid = this.a_1598;
                  ChangeFieldGrid(stCurTargetFieldGrid);
                  x = BattleFieldView.a_1013;
                  y = iYPosSkewing + a_3491.a_1081 * stCurTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - height) - stDisplayBitmap.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stCurTargetFieldGrid);
                  visible = true;
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
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}


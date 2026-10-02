package com.aurora.ui.maogoutd.resource.defender.fusionCard.Chocolatebread
{
   import a_4718.b_180;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.shot.PitayaFireBallShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ChocolatebreadSoulAttackFighter extends a_3953
   {
      
      private static const PRODUCE_ENERGY_NUM:uint = 1;
      
      private static const TICKS_PER_SECOND:int = 20;
      
      private static const RELEASE_FIRE_INTERVAL:int = 4 * TICKS_PER_SECOND;
      
      private static const FIRE_HIT_INTERVAL:int = 4 * TICKS_PER_SECOND + 10;
      
      private var m_iSkillState:int = 0;
      
      private var a_1345:int;
      
      private var m_iAppearedTime:int;
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iFireProduceCount:int = 0;
      
      private var m_iLastFireCheckTime:int = 0;
      
      private const MAX_FIRE_PER_INTERVAL:int = 3;
      
      private const FIRE_INTERVAL:int = 100;
      
      private var m_isStartBoom:Boolean = false;
      
      private var m_Range:int = 2;
      
      private var m_iFireShotHurtForEach:int;
      
      public function ChocolatebreadSoulAttackFighter()
      {
         super();
         a_1095 = ChocolatebreadDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1337 = 0;
         a_1310 = 8;
         a_1313 = true;
         a_1319 = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ChocolatebreadSoulAttackFighter,ChocolatebreadSoulAttackFighterMovie) as ChocolatebreadSoulAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_iSkillState = this.m_iFireProduceCount = this.m_iCurrentTimeIntval = a_1308 = 0;
         this.m_iLastFireCheckTime = -1;
         this.m_iAppearedTime = -1;
         a_1339 = 1000;
         this.m_isStartBoom = false;
         a_1309 = 30;
         this.a_1345 = ChocolatebreadDefence.GetCardPrimaryValueByGradeDegree(m_iGradeDegree);
         this.m_iFireShotHurtForEach = ChocolatebreadDefence.GetCardDeepValueByGradeDegree(m_iGradeDegree);
         a_1311 = ChocolatebreadDefence.GetCardSoulValueByGradeDegree(m_iGradeDegree);
         tagCom.AddTag(30030);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ChocolatebreadDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(1 == m_iDieType && iRduceLifeValue >= iLifeValue)
         {
            if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
               this.m_isStartBoom = true;
            }
            return true;
         }
         var isEatingDefense:Boolean = false;
         if(Boolean(a_1334 && iRduceLifeValue > 0) && Boolean(1 == m_iDieType) && iLifeValue - iRduceLifeValue > 0)
         {
            arrMoveIntruder = a_1334.IntruderArray;
            for each(stMoveIntruder in arrMoveIntruder)
            {
               if(stMoveIntruder.isEatingDefense)
               {
                  isEatingDefense = true;
                  break;
               }
            }
         }
         if(isEatingDefense)
         {
            this.TryProduceFire();
         }
         super.a_3969(iRduceLifeValue);
         if(Boolean(0 != iRduceLifeValue) && Boolean(stFieldGrid) && this.m_iSkillState != 2)
         {
            this.ResetMovieStatus();
         }
         return true;
      }
      
      protected function ResetMovieStatus() : Boolean
      {
         var stateIndex:int = 0;
         var lifeStage:int = 0;
         var frameLabel:FrameLabel = null;
         stateIndex = 0;
         if(a_1339 > 600)
         {
            lifeStage = 0;
         }
         else if(a_1339 > 300)
         {
            lifeStage = 1;
         }
         else
         {
            if(a_1339 <= 0)
            {
               return false;
            }
            lifeStage = 2;
         }
         if(this.m_iSkillState == 2)
         {
            stateIndex = lifeStage * 2 + 1;
         }
         else
         {
            stateIndex = lifeStage * 2;
         }
         if(a_1275 != stateIndex)
         {
            a_1275 = stateIndex;
            frameLabel = a_1276[stateIndex] as FrameLabel;
            if(frameLabel)
            {
               gotoAndStop(frameLabel.frame);
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               if(this.m_iSkillState == 2)
               {
                  this.m_iSkillState = 0;
                  this.ResetMovieStatus();
               }
               else
               {
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
            super.ShowPlayOther(iCurrentTime);
            if(Boolean(a_1334) && Boolean(this.m_isStartBoom) && a_1273 == a_1274 - 3)
            {
               BattleFieldView.a_1048.play();
               a_1334.m_stCurrentBattbleFieldView.a_3466();
               stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
               yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
               xStart = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
               yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
               xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     stTargetFieldGrid = stFieldGridVector[yIndex][xIndex];
                     arrMoveIntruder = stTargetFieldGrid.IntruderArray;
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
            if(this.m_isStartBoom && a_1273 == a_1274 - 1)
            {
               super.a_3969(iLifeValue);
               if(a_1339 <= 0)
               {
                  a_3940();
               }
            }
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(this.m_iAppearedTime == -1)
         {
            this.m_iAppearedTime = iCurrentTime;
         }
         this.m_iCurrentTimeIntval = iCurrentTime - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval != 0)
         {
            if(this.m_iCurrentTimeIntval % RELEASE_FIRE_INTERVAL == 0)
            {
               this.ReleaseFire();
            }
            if(this.m_iCurrentTimeIntval % FIRE_HIT_INTERVAL == 0)
            {
               this.a_4352();
            }
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            for(j = 0; j < 4; j++)
            {
               stLastWaitShot = ChocolatebreadSoulShot.a_4344();
               a_1324.push(stLastWaitShot);
            }
            this.m_iSkillState = 2;
            a_1323 = 0;
            a_1307 = a_1273;
            this.ResetMovieStatus();
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = 76;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 74,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function TryProduceFire() : void
      {
         if(this.m_iLastFireCheckTime == -1)
         {
            this.m_iLastFireCheckTime = this.m_iCurrentTimeIntval;
            this.m_iFireProduceCount = 0;
         }
         if(this.m_iCurrentTimeIntval - this.m_iLastFireCheckTime >= this.FIRE_INTERVAL)
         {
            this.m_iLastFireCheckTime = this.m_iCurrentTimeIntval;
            this.m_iFireProduceCount = 0;
         }
         if(this.m_iFireProduceCount >= this.MAX_FIRE_PER_INTERVAL)
         {
            return;
         }
         ++this.m_iFireProduceCount;
         this.ProdudeEnergy();
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 0; iIndex < PRODUCE_ENERGY_NUM; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_421);
            if(null != stFreeEnergy)
            {
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? this.a_1345 : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      private function ReleaseFire() : void
      {
         var stLastWaitShot:a_4348 = null;
         var stStartField:a_3491 = null;
         var xIndex:int = 0;
         var tempX2:int = 0;
         var tempY2:int = 0;
         if(a_1334 == null)
         {
            return;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_Range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stStartField != null)
               {
                  stLastWaitShot = PitayaFireBallShot.a_4344();
                  if(stLastWaitShot != null)
                  {
                     tempX2 = xIndex * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width);
                     tempY2 = yIndex * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height);
                     stLastWaitShot.a_1797(0,a_1312,a_1311,tempX2,tempY2,stStartField.m_stCurrentBattbleFieldView,stStartField);
                     stStartField.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartField);
                  }
               }
            }
         }
      }
      
      private function a_4352() : void
      {
         var stStartField:a_3491 = null;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 == null)
         {
            return;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_Range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stStartField != null)
               {
                  arrMoveIntruder = stStartField.IntruderArray;
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(this.m_iFireShotHurtForEach);
                     stMoveIntruder.a_4208(b_182.a_432,2);
                  }
               }
            }
         }
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}


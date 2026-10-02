package com.aurora.ui.maogoutd.resource.defender.fusionCard.rockfiretower
{
   import a_4715.EncrypNumber;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public dynamic class RockFireTowerSoulAuxiliaryFighter extends a_3959
   {
      
      private static var ms_stRockFireTowerSoulAuxiliaryFighterVector:Array = [];
      
      private static const CONTINUE_TIME:int = 160;
      
      private var m_arrRockFireTowerPoisonGasShotArray:Array = [];
      
      private var m_isShoted:Boolean;
      
      private var a_1309:int;
      
      private var a_1321:int;
      
      private var a_1311:int;
      
      private var m_iShotSkill:Boolean;
      
      private var m_iRange:int = 2;
      
      private var m_iCount:int;
      
      public function RockFireTowerSoulAuxiliaryFighter()
      {
         super();
         a_1095 = RockFireTowerAuxiliaryDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3959
      {
         var fighter:RockFireTowerSoulAuxiliaryFighter = null;
         fighter = ms_stRockFireTowerSoulAuxiliaryFighterVector.pop();
         if(!fighter)
         {
            fighter = new RockFireTowerSoulAuxiliaryFighter();
         }
         fighter.visible = true;
         return fighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return RockFireTowerSoulAuxiliaryFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.InitNumHotMultiplier();
         a_1339 = RockFireTowerAuxiliaryDefine.LIFE_VALUE;
         this.m_isShoted = false;
         this.a_1309 = RockFireTowerAuxiliaryDefine.GetCardDeepShotIntervalByGradeDegree(m_iGradeDegree);
         this.a_1321 = -this.a_1309;
         this.a_1311 = RockFireTowerAuxiliaryDefine.GetCardDeepOnceValueByGradeDegree(m_iGradeDegree);
         return true;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(2 * 0.7 + 0.1);
         var hot:Number = fBaseHotiplier.Value + 0.1 * RockFireTowerAuxiliaryDefine.a_3965(a_1094);
         hot += RockFireTowerAuxiliaryDefine.GetCardPrimaryValueByGradeDegree(m_iGradeDegree);
         hot += RockFireTowerAuxiliaryDefine.GetCardSoulValueByGradeDegree(m_iGradeDegree);
         a_1325 = hot * (1 + RockFireTowerAuxiliaryDefine.HURT_ADDITION);
      }
      
      override public function a_3969(iReduceLifeValue:int) : Boolean
      {
         var arrMoveIntruder:Array = null;
         var intruder:a_4206 = null;
         if(Boolean(a_1334) && Boolean(iReduceLifeValue > 0) && m_iDieType == 1)
         {
            arrMoveIntruder = a_1334.IntruderArray;
            for each(intruder in arrMoveIntruder)
            {
               if(intruder.isEatingDefense)
               {
                  intruder.a_3969(iReduceLifeValue);
                  break;
               }
            }
         }
         super.a_3969(iReduceLifeValue);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return RockFireTowerAuxiliaryDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
         this.a_3954(iCurrentTime);
      }
      
      public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         if(iCurrentTime >= this.a_1321 + this.a_1309 && !this.m_isShoted)
         {
            this.a_1321 = iCurrentTime;
            this.addPoisonGasShot();
            this.m_isShoted = true;
         }
         if(this.m_isShoted)
         {
            if(iCurrentTime - this.a_1321 == CONTINUE_TIME)
            {
               this.m_isShoted = false;
               this.m_iCount = 0;
               this.clearPoisonGasShot();
            }
            else if((iCurrentTime - this.a_1321) % 20 == 10)
            {
               this.poisonGasSkill();
            }
         }
         return true;
      }
      
      private function clearPoisonGasShot() : void
      {
         var shot:RockFireTowerPoisonGasEffect = null;
         for each(shot in this.m_arrRockFireTowerPoisonGasShotArray)
         {
            shot.a_3940();
         }
         this.m_arrRockFireTowerPoisonGasShotArray.length = 0;
      }
      
      private function addPoisonGasShot() : void
      {
         var xIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var shot:RockFireTowerPoisonGasEffect = null;
         if(!a_1334)
         {
            return;
         }
         this.m_arrRockFireTowerPoisonGasShotArray.length = 0;
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_iRange,0);
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_iRange,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_iRange,BattleFieldView.a_1012 - 1);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_iRange,BattleFieldView.a_1011 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               if(!(a_1334.m_iXGridNo == xIndex && a_1334.m_iYGridNo == yIndex))
               {
                  stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  shot = RockFireTowerPoisonGasEffect.a_3926() as RockFireTowerPoisonGasEffect;
                  if(shot)
                  {
                     shot.stOriginalFieldGrid = a_1334;
                     shot.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                     shot.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
                     shot.a_1797(a_1283);
                     a_1334.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
                     this.m_arrRockFireTowerPoisonGasShotArray.push(shot);
                  }
               }
            }
         }
      }
      
      private function poisonGasSkill() : void
      {
         var xIndex:int = 0;
         var intruders:Array = null;
         var intruder:a_4206 = null;
         if(!a_1334)
         {
            return;
         }
         ++this.m_iCount;
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_iRange,0);
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_iRange,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_iRange,BattleFieldView.a_1012 - 1);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_iRange,BattleFieldView.a_1011 - 1);
         var fieldVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               intruders = fieldVector[yIndex][xIndex].a_1511.slice();
               for each(intruder in intruders)
               {
                  if(!(intruder.iSpaceState == 0 && intruder.isCannotSeeByFighter))
                  {
                     intruder.a_4209(this.a_1311);
                     intruder.a_4208(b_182.a_432,2);
                     intruder.a_4208(b_182.a_433,40);
                  }
               }
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.clearPoisonGasShot();
         if(ms_stRockFireTowerSoulAuxiliaryFighterVector.indexOf(this) == -1)
         {
            ms_stRockFireTowerSoulAuxiliaryFighterVector.push(this);
         }
         return true;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.TigerYear.FriedMushroom
{
   import a_4718.b_180;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   
   public class FriedMushroomBombBaseAttackFighter extends a_3960
   {
      
      private var m_ProduceEnergyNum:int;
      
      public function FriedMushroomBombBaseAttackFighter()
      {
         super();
         a_1095 = FriedMushroomBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(FriedMushroomBombBaseAttackFighter,FriedMushroomBombBaseAttackFighterMovie) as FriedMushroomBombBaseAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = FriedMushroomBombDefine.MAX_LIFE_VALUE;
         this.m_ProduceEnergyNum = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FriedMushroomBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGridi:a_3491 = null;
         var dataEvent:a_1778 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 10)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            this.m_ProduceEnergyNum = 0;
            xStart = Math.max(a_1334.m_iXGridNo - 1,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 1,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGridi = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
                  if(Boolean(stFieldGridi.m_stMouseEarthHole) && stFieldGridi.m_iFieldGridType == 3)
                  {
                     stFieldGridi.m_stMouseEarthHole.a_3940();
                     stFieldGridi.m_stMouseEarthHole = null;
                     if(stFieldGridi.m_iFieldGridType == 3)
                     {
                        stFieldGridi.m_iFieldGridType = 0;
                     }
                     stFieldGridi.m_isExistMouseHole = false;
                     ++this.m_ProduceEnergyNum;
                  }
                  dataEvent = new a_1778("ClearMouseHole");
                  dataEvent.dataObject = [stFieldGridi.m_iXGridNo,stFieldGridi.m_iYGridNo];
                  a_1789.getInstance().dispatchEvent(dataEvent);
               }
            }
            this.ProdudeEnergy();
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         if(this.m_ProduceEnergyNum <= 0)
         {
            return;
         }
         for(var iIndex:int = 0; iIndex < this.m_ProduceEnergyNum; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iProduceEnergy = FriedMushroomBombDefine.a_3966(m_iSkillDegree);
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      private function a_4360() : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_3969(1000);
               }
            }
         }
      }
   }
}


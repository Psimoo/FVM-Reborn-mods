package com.aurora.ui.maogoutd.resource.defender.TigerYear.FriedMushroom
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class FriedMushroomBombSecondAttackFighter extends a_3960
   {
      
      public function FriedMushroomBombSecondAttackFighter()
      {
         super();
         a_1095 = FriedMushroomBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(FriedMushroomBombSecondAttackFighter,FriedMushroomBombSecondAttackFighterMovie) as FriedMushroomBombSecondAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = FriedMushroomBombDefine.MAX_LIFE_VALUE;
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
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            xStart = Math.max(a_1334.m_iXGridNo - 2,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 2,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGridi = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
                  if(stFieldGridi.m_stMouseEarthHole)
                  {
                     stFieldGridi.m_stMouseEarthHole.a_3940();
                     stFieldGridi.m_stMouseEarthHole = null;
                     if(stFieldGridi.m_iFieldGridType == 1)
                     {
                        stFieldGridi.m_iFieldGridType = 0;
                     }
                     stFieldGridi.m_isExistMouseHole = false;
                  }
                  dataEvent = new a_1778("ClearMouseHole");
                  dataEvent.dataObject = [stFieldGridi.m_iXGridNo,stFieldGridi.m_iYGridNo];
                  a_1789.getInstance().dispatchEvent(dataEvent);
                  if(stFieldGridi.m_stBaseLander != null)
                  {
                     stFieldGridi.m_stBaseLander.a_3940();
                     stFieldGridi.m_stBaseLander = null;
                  }
                  this.a_3502(stFieldGridi);
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseOnlyFrozen();
      }
   }
}


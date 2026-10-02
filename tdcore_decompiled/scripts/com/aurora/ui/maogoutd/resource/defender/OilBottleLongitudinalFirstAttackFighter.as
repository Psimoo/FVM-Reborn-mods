package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class OilBottleLongitudinalFirstAttackFighter extends a_3960
   {
      
      public function OilBottleLongitudinalFirstAttackFighter()
      {
         super();
         a_1095 = 150;
         a_1330 = 0;
         a_1333 = true;
         a_1337 = 10;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(OilBottleLongitudinalFirstAttackFighter) as OilBottleLongitudinalFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilBottleLongitudinalFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 250;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500 - this.a_3965();
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stOilBottleBoomEffect:OilBottleLongitudinalFirstEffect = null;
         var stFieldGridVector:Array = null;
         var iYIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 2 && a_1329 == iCurrentTime)
         {
            stOilBottleBoomEffect = OilBottleLongitudinalFirstEffect.a_3926();
            stOilBottleBoomEffect.a_1797(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1334);
         }
         if(a_1273 == a_1274 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1047.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               stFieldGrid = stFieldGridVector[iYIndex][a_1334.m_iXGridNo];
               for each(stMoveIntruder in stFieldGrid.a_1511.slice())
               {
                  if(!stMoveIntruder.IsElite)
                  {
                     stMoveIntruder.a_4210();
                  }
                  else
                  {
                     stMoveIntruder.PowerfulBombReduceLifeRate(1);
                  }
               }
            }
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 6)
         {
            iStarDegreeEffect = 2 * a_1094;
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 2 * 6 + 3 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 2 * 6 + 3 * 3 + 3 * (a_1094 - 9);
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


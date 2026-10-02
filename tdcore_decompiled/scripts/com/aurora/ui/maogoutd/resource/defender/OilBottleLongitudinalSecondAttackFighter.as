package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class OilBottleLongitudinalSecondAttackFighter extends a_3960
   {
      
      public function OilBottleLongitudinalSecondAttackFighter()
      {
         super();
         a_1095 = 150;
         a_1330 = 0;
         a_1333 = true;
         a_1337 = 10;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(OilBottleLongitudinalSecondAttackFighter) as OilBottleLongitudinalSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilBottleLongitudinalSecondAttackFighterMovie;
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
         var stStartFieldGrid:a_3491 = null;
         var i:int = 0;
         var stOilBottleBoomEffect:OilBottleLongitudinalSecondEffect = null;
         var iXIndex:int = 0;
         var iYIndex:int = 0;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 2 && a_1329 == iCurrentTime)
         {
            for(i = -1; i <= 1; i++)
            {
               stStartFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + i,a_1334.m_iYGridNo);
               if(stStartFieldGrid != null)
               {
                  stOilBottleBoomEffect = OilBottleLongitudinalSecondEffect.a_3926();
                  stOilBottleBoomEffect.a_1797(stStartFieldGrid.m_iXGridNo,stStartFieldGrid.m_iYGridNo,stStartFieldGrid);
               }
            }
         }
         if(a_1273 == a_1274 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1047.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            for(iXIndex = -1; iXIndex <= 1; iXIndex++)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  stStartFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + iXIndex,iYIndex);
                  if(stStartFieldGrid)
                  {
                     for each(stMoveIntruder in stStartFieldGrid.a_1511.slice())
                     {
                        if(iXIndex == 0)
                        {
                           if(stMoveIntruder.IsBossIntruder)
                           {
                              stMoveIntruder.PowerfulBombReduceLifeRate(1);
                           }
                           else
                           {
                              stMoveIntruder.a_4210();
                           }
                        }
                        else if(!stMoveIntruder.IsElite)
                        {
                           stMoveIntruder.a_4210();
                        }
                        else
                        {
                           stMoveIntruder.PowerfulBombReduceLifeRate(0.5);
                        }
                     }
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


package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class FireworksAdvanceBoomAttackFighter extends a_3960
   {
      
      public function FireworksAdvanceBoomAttackFighter()
      {
         super();
         a_1095 = 200;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(FireworksAdvanceBoomAttackFighter) as FireworksAdvanceBoomAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireworksAdvanceBoomAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 250;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 900 - this.a_3965();
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var y:int = 0;
         var x:int = 0;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1050.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 2);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
            yEnd = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 2);
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
            trace("AtomicBoom: yStart:" + yStart + " yEnd: " + yEnd + " xStart:" + xStart + " xEnd:" + xEnd);
            for(y = yStart; y <= yEnd; y++)
            {
               for(x = xStart; x <= xEnd; x++)
               {
                  for each(stMoveIntruder in stFieldGridVector[y][x].a_1511.slice())
                  {
                     trace("AtomicBoom mouse:" + stMoveIntruder.toString());
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


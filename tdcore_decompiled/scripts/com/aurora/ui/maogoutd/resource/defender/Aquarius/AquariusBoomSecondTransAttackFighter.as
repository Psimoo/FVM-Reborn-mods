package com.aurora.ui.maogoutd.resource.defender.Aquarius
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.effect.AquariusBoomEffect;
   
   public class AquariusBoomSecondTransAttackFighter extends a_3960
   {
      
      public function AquariusBoomSecondTransAttackFighter()
      {
         super();
         a_1095 = 250;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(AquariusBoomSecondTransAttackFighter) as AquariusBoomSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return AquariusBoomSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 250;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300 - this.a_3965();
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stOilBottleBoomEffect:AquariusBoomEffect = null;
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         super.a_3961(iCurrentTime);
         if(a_1273 == a_1274 - 2)
         {
            stOilBottleBoomEffect = AquariusBoomEffect.a_3926();
            stOilBottleBoomEffect.a_1797(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1334.m_stCurrentBattbleFieldView,true);
         }
         if(a_1273 == a_1274 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1047.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = 0;
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
            yEnd = BattleFieldView.a_1012 - 1;
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               stFieldGrid = stFieldGridVector[yIndex][a_1334.m_iXGridNo];
               for each(stMoveIntruder in stFieldGrid.a_1511.slice())
               {
                  stMoveIntruder.a_4210();
                  stMoveIntruder.PowerfulBombReduceLifeRate();
               }
            }
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = stFieldGridVector[a_1334.m_iYGridNo][xIndex];
               for each(stMoveIntruder in stFieldGrid.a_1511.slice())
               {
                  stMoveIntruder.a_4210();
                  stMoveIntruder.PowerfulBombReduceLifeRate();
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
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 20;
               break;
            case 3:
               iStarDegreeEffect = 30;
               break;
            case 4:
               iStarDegreeEffect = 40;
               break;
            case 5:
               iStarDegreeEffect = 50;
               break;
            case 6:
               iStarDegreeEffect = 60;
               break;
            case 7:
               iStarDegreeEffect = 70;
               break;
            case 8:
               iStarDegreeEffect = 80;
               break;
            case 9:
               iStarDegreeEffect = 100;
               break;
            case 10:
               iStarDegreeEffect = 120;
               break;
            case 11:
               iStarDegreeEffect = 140;
               break;
            case 12:
               iStarDegreeEffect = 160;
               break;
            case 13:
               iStarDegreeEffect = 180;
               break;
            case 14:
               iStarDegreeEffect = 200;
               break;
            case 15:
               iStarDegreeEffect = 220;
               break;
            case 16:
               iStarDegreeEffect = 230;
         }
         return iStarDegreeEffect;
      }
   }
}


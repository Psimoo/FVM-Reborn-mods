package com.aurora.ui.maogoutd.resource.defender.CattleYear.CoconutFruit
{
   public class CoconutFruitDefine
   {
      
      internal static const DEFENSE_PRICE:int = 75;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 75;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 100;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function CoconutFruitDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 29;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 27;
               break;
            case 4:
               iStarDegreeEffect = 26;
               break;
            case 5:
               iStarDegreeEffect = 25;
               break;
            case 6:
               iStarDegreeEffect = 24;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 18;
               break;
            case 10:
               iStarDegreeEffect = 16;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 12;
               break;
            case 13:
               iStarDegreeEffect = 10;
               break;
            case 14:
               iStarDegreeEffect = 9;
               break;
            case 15:
               iStarDegreeEffect = 8;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


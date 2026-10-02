package com.aurora.ui.maogoutd.resource.defender.CattleYear.Whirlwind
{
   public class TornadoCattleBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 300;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 300;
      
      internal static const MAX_LIFE_VALUE:int = 1000;
      
      public function TornadoCattleBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 40;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 40;
               break;
            case 1:
               iStarDegreeEffect = 39;
               break;
            case 2:
               iStarDegreeEffect = 38;
               break;
            case 3:
               iStarDegreeEffect = 37;
               break;
            case 4:
               iStarDegreeEffect = 36;
               break;
            case 5:
               iStarDegreeEffect = 35;
               break;
            case 6:
               iStarDegreeEffect = 34;
               break;
            case 7:
               iStarDegreeEffect = 33;
               break;
            case 8:
               iStarDegreeEffect = 32;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 26;
               break;
            case 12:
               iStarDegreeEffect = 24;
               break;
            case 13:
               iStarDegreeEffect = 22;
               break;
            case 14:
               iStarDegreeEffect = 20;
               break;
            case 15:
               iStarDegreeEffect = 17;
               break;
            case 16:
               iStarDegreeEffect = 14;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


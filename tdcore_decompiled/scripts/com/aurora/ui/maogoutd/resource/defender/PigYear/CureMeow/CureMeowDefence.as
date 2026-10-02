package com.aurora.ui.maogoutd.resource.defender.PigYear.CureMeow
{
   public class CureMeowDefence
   {
      
      internal static const DEFENSE_PRICE:int = 75;
      
      internal static const REDUCE_PRICE:int = 100;
      
      internal static const REDUCE_TIME:int = 30;
      
      internal static const MAX_LIFE_VALUE:int = 50;
      
      public function CureMeowDefence()
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
               iStarDegreeEffect = 47;
               break;
            case 1:
               iStarDegreeEffect = 45;
               break;
            case 2:
               iStarDegreeEffect = 43;
               break;
            case 3:
               iStarDegreeEffect = 41;
               break;
            case 4:
               iStarDegreeEffect = 39;
               break;
            case 5:
               iStarDegreeEffect = 37;
               break;
            case 6:
               iStarDegreeEffect = 35;
               break;
            case 7:
               iStarDegreeEffect = 33;
               break;
            case 8:
               iStarDegreeEffect = 31;
               break;
            case 9:
               iStarDegreeEffect = 29;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 23;
               break;
            case 12:
               iStarDegreeEffect = 20;
               break;
            case 13:
               iStarDegreeEffect = 17;
               break;
            case 14:
               iStarDegreeEffect = 14;
               break;
            case 15:
               iStarDegreeEffect = 11;
               break;
            case 16:
               iStarDegreeEffect = 8;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


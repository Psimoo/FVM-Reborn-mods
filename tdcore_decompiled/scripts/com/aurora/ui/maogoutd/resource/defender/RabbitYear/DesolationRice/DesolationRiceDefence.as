package com.aurora.ui.maogoutd.resource.defender.RabbitYear.DesolationRice
{
   public class DesolationRiceDefence
   {
      
      internal static const DEFENSE_PRICE:int = 325;
      
      internal static const REDUCE_PRICE:int = 50;
      
      internal static const REDUCE_TIME:int = 30;
      
      public function DesolationRiceDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 60;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 60;
               break;
            case 1:
               iStarDegreeEffect = 58;
               break;
            case 2:
               iStarDegreeEffect = 56;
               break;
            case 3:
               iStarDegreeEffect = 54;
               break;
            case 4:
               iStarDegreeEffect = 52;
               break;
            case 5:
               iStarDegreeEffect = 50;
               break;
            case 6:
               iStarDegreeEffect = 48;
               break;
            case 7:
               iStarDegreeEffect = 46;
               break;
            case 8:
               iStarDegreeEffect = 44;
               break;
            case 9:
               iStarDegreeEffect = 42;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 36;
               break;
            case 13:
               iStarDegreeEffect = 34;
               break;
            case 14:
               iStarDegreeEffect = 32;
               break;
            case 15:
               iStarDegreeEffect = 30;
               break;
            case 16:
               iStarDegreeEffect = 28;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


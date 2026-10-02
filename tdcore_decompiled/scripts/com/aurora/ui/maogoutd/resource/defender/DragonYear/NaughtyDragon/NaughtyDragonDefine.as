package com.aurora.ui.maogoutd.resource.defender.DragonYear.NaughtyDragon
{
   public class NaughtyDragonDefine
   {
      
      internal static const DEFENSE_PRICE:int = 100;
      
      internal static const REDUCE_PRICE:int = 50;
      
      internal static const REDUCE_TIME:int = 30;
      
      public function NaughtyDragonDefine()
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
               iStarDegreeEffect = 55;
               break;
            case 1:
               iStarDegreeEffect = 53;
               break;
            case 2:
               iStarDegreeEffect = 51;
               break;
            case 3:
               iStarDegreeEffect = 49;
               break;
            case 4:
               iStarDegreeEffect = 47;
               break;
            case 5:
               iStarDegreeEffect = 45;
               break;
            case 6:
               iStarDegreeEffect = 43;
               break;
            case 7:
               iStarDegreeEffect = 41;
               break;
            case 8:
               iStarDegreeEffect = 39;
               break;
            case 9:
               iStarDegreeEffect = 36;
               break;
            case 10:
               iStarDegreeEffect = 33;
               break;
            case 11:
               iStarDegreeEffect = 30;
               break;
            case 12:
               iStarDegreeEffect = 27;
               break;
            case 13:
               iStarDegreeEffect = 22;
               break;
            case 14:
               iStarDegreeEffect = 17;
               break;
            case 15:
               iStarDegreeEffect = 12;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


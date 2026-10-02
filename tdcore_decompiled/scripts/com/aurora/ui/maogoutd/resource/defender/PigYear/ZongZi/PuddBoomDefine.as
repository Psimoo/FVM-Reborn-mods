package com.aurora.ui.maogoutd.resource.defender.PigYear.ZongZi
{
   public class PuddBoomDefine
   {
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function PuddBoomDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 60;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 60;
               break;
            case 1:
               iStarDegreeEffect = 59;
               break;
            case 2:
               iStarDegreeEffect = 58;
               break;
            case 3:
               iStarDegreeEffect = 57;
               break;
            case 4:
               iStarDegreeEffect = 56;
               break;
            case 5:
               iStarDegreeEffect = 55;
               break;
            case 6:
               iStarDegreeEffect = 54;
               break;
            case 7:
               iStarDegreeEffect = 53;
               break;
            case 8:
               iStarDegreeEffect = 52;
               break;
            case 9:
               iStarDegreeEffect = 50;
               break;
            case 10:
               iStarDegreeEffect = 48;
               break;
            case 11:
               iStarDegreeEffect = 46;
               break;
            case 12:
               iStarDegreeEffect = 43;
               break;
            case 13:
               iStarDegreeEffect = 40;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 34;
               break;
            case 16:
               iStarDegreeEffect = 30;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


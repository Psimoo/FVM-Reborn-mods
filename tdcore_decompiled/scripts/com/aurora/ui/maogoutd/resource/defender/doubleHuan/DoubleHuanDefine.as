package com.aurora.ui.maogoutd.resource.defender.doubleHuan
{
   public class DoubleHuanDefine
   {
      
      internal static const DEFENSE_PRICE:int = 325;
      
      internal static const REDUCE_PRICE:int = 50;
      
      internal static const REDUCE_TIME:int = 30;
      
      public function DoubleHuanDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 550 - a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 1;
               break;
            case 2:
               iStarDegreeEffect = 2;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 5;
               break;
            case 5:
               iStarDegreeEffect = 7;
               break;
            case 6:
               iStarDegreeEffect = 9;
               break;
            case 7:
               iStarDegreeEffect = 12;
               break;
            case 8:
               iStarDegreeEffect = 15;
               break;
            case 9:
               iStarDegreeEffect = 18;
               break;
            case 10:
               iStarDegreeEffect = 21;
               break;
            case 11:
               iStarDegreeEffect = 24;
               break;
            case 12:
               iStarDegreeEffect = 27;
               break;
            case 13:
               iStarDegreeEffect = 30;
               break;
            case 14:
               iStarDegreeEffect = 33;
               break;
            case 15:
               iStarDegreeEffect = 36;
               break;
            case 16:
               iStarDegreeEffect = 39;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


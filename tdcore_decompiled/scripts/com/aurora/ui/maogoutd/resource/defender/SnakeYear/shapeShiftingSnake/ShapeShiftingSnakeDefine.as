package com.aurora.ui.maogoutd.resource.defender.SnakeYear.shapeShiftingSnake
{
   public class ShapeShiftingSnakeDefine
   {
      
      internal static const DEFENSE_PRICE:int = 375;
      
      internal static const REDUCE_PRICE:int = 50;
      
      internal static const REDUCE_TIME:int = 30;
      
      public function ShapeShiftingSnakeDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 55;
               break;
            case 1:
               iStarDegreeEffect = 54;
               break;
            case 2:
               iStarDegreeEffect = 53;
               break;
            case 3:
               iStarDegreeEffect = 52;
               break;
            case 4:
               iStarDegreeEffect = 50;
               break;
            case 5:
               iStarDegreeEffect = 48;
               break;
            case 6:
               iStarDegreeEffect = 46;
               break;
            case 7:
               iStarDegreeEffect = 43;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 37;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 31;
               break;
            case 12:
               iStarDegreeEffect = 28;
               break;
            case 13:
               iStarDegreeEffect = 25;
               break;
            case 14:
               iStarDegreeEffect = 22;
               break;
            case 15:
               iStarDegreeEffect = 19;
               break;
            case 16:
               iStarDegreeEffect = 16;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


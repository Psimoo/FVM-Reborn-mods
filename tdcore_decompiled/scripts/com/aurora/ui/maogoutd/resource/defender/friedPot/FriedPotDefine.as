package com.aurora.ui.maogoutd.resource.defender.friedPot
{
   public class FriedPotDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 150;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function FriedPotDefine()
      {
         super();
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 7;
               break;
            case 2:
               iStarDegreeEffect = 8;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 12;
               break;
            case 5:
               iStarDegreeEffect = 14;
               break;
            case 6:
               iStarDegreeEffect = 17;
               break;
            case 7:
               iStarDegreeEffect = 20;
               break;
            case 8:
               iStarDegreeEffect = 24;
               break;
            case 9:
               iStarDegreeEffect = 28;
               break;
            case 10:
               iStarDegreeEffect = 32;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 44;
               break;
            case 13:
               iStarDegreeEffect = 50;
               break;
            case 14:
               iStarDegreeEffect = 56;
               break;
            case 15:
               iStarDegreeEffect = 62;
               break;
            case 16:
               iStarDegreeEffect = 68;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 80 - iSkillDegree * 4;
      }
   }
}


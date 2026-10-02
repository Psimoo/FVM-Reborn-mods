package com.aurora.ui.maogoutd.resource.defender.spicyHotPot
{
   public class SpicyHotPotDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.15;
      
      public function SpicyHotPotDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 300;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 100 - iSkillDegree * 4;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 13;
               break;
            case 5:
               iStarDegreeEffect = 16;
               break;
            case 6:
               iStarDegreeEffect = 18;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 35;
               break;
            case 11:
               iStarDegreeEffect = 42;
               break;
            case 12:
               iStarDegreeEffect = 48;
               break;
            case 13:
               iStarDegreeEffect = 55;
               break;
            case 14:
               iStarDegreeEffect = 62;
               break;
            case 15:
               iStarDegreeEffect = 69;
               break;
            case 16:
               iStarDegreeEffect = 76;
         }
         return iStarDegreeEffect * 2;
      }
   }
}


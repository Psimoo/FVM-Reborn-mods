package com.aurora.ui.maogoutd.resource.defender.PigYear.meatballCook
{
   public class MeatballCookDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 6;
      
      internal static const DEFENSE_PRICE:int = 135;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.5;
      
      public function MeatballCookDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.2;
               break;
            case 1:
               iSkillDegreeEffect = 1.15;
               break;
            case 2:
               iSkillDegreeEffect = 1.1;
               break;
            case 3:
               iSkillDegreeEffect = 1.05;
               break;
            case 4:
               iSkillDegreeEffect = 1;
               break;
            case 5:
               iSkillDegreeEffect = 0.9;
               break;
            case 6:
               iSkillDegreeEffect = 0.85;
               break;
            case 7:
               iSkillDegreeEffect = 0.8;
               break;
            case 8:
               iSkillDegreeEffect = 0.7;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 20;
               break;
            case 1:
               iStarDegreeEffect = 24;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 32;
               break;
            case 4:
               iStarDegreeEffect = 36;
               break;
            case 5:
               iStarDegreeEffect = 40;
               break;
            case 6:
               iStarDegreeEffect = 44;
               break;
            case 7:
               iStarDegreeEffect = 52;
               break;
            case 8:
               iStarDegreeEffect = 64;
               break;
            case 9:
               iStarDegreeEffect = 82;
               break;
            case 10:
               iStarDegreeEffect = 115;
               break;
            case 11:
               iStarDegreeEffect = 145;
               break;
            case 12:
               iStarDegreeEffect = 180;
               break;
            case 13:
               iStarDegreeEffect = 220;
               break;
            case 14:
               iStarDegreeEffect = 250;
               break;
            case 15:
               iStarDegreeEffect = 280;
               break;
            case 16:
               iStarDegreeEffect = 290;
         }
         return iStarDegreeEffect;
      }
   }
}


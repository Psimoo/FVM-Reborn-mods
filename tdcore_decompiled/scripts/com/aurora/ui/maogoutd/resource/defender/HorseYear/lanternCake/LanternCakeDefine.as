package com.aurora.ui.maogoutd.resource.defender.HorseYear.lanternCake
{
   public class LanternCakeDefine
   {
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function LanternCakeDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.5;
               break;
            case 1:
               iSkillDegreeEffect = 3.45;
               break;
            case 2:
               iSkillDegreeEffect = 3.4;
               break;
            case 3:
               iSkillDegreeEffect = 3.35;
               break;
            case 4:
               iSkillDegreeEffect = 3.3;
               break;
            case 5:
               iSkillDegreeEffect = 3.2;
               break;
            case 6:
               iSkillDegreeEffect = 3.1;
               break;
            case 7:
               iSkillDegreeEffect = 3;
               break;
            case 8:
               iSkillDegreeEffect = 2.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 6.8;
               break;
            case 2:
               iStarDegreeEffect = 7.6;
               break;
            case 3:
               iStarDegreeEffect = 8.8;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 16;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 24;
               break;
            case 10:
               iStarDegreeEffect = 32;
               break;
            case 11:
               iStarDegreeEffect = 40;
               break;
            case 12:
               iStarDegreeEffect = 52;
               break;
            case 13:
               iStarDegreeEffect = 64;
               break;
            case 14:
               iStarDegreeEffect = 80;
               break;
            case 15:
               iStarDegreeEffect = 96;
               break;
            case 16:
               iStarDegreeEffect = 120;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


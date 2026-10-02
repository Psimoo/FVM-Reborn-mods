package com.aurora.ui.maogoutd.resource.defender.leo
{
   public class LeoDefine
   {
      
      internal static const DEFENSE_PRICE:int = 275;
      
      public function LeoDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 350;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 36 - iSkillDegree - 3;
         }
         return 36 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 34;
               break;
            case 2:
               iStarDegreeEffect = 38;
               break;
            case 3:
               iStarDegreeEffect = 42;
               break;
            case 4:
               iStarDegreeEffect = 46;
               break;
            case 5:
               iStarDegreeEffect = 50;
               break;
            case 6:
               iStarDegreeEffect = 54;
               break;
            case 7:
               iStarDegreeEffect = 60;
               break;
            case 8:
               iStarDegreeEffect = 70;
               break;
            case 9:
               iStarDegreeEffect = 80;
               break;
            case 10:
               iStarDegreeEffect = 100;
               break;
            case 11:
               iStarDegreeEffect = 120;
               break;
            case 12:
               iStarDegreeEffect = 140;
               break;
            case 13:
               iStarDegreeEffect = 160;
               break;
            case 14:
               iStarDegreeEffect = 180;
               break;
            case 15:
               iStarDegreeEffect = 200;
               break;
            case 16:
               iStarDegreeEffect = 230;
         }
         return iStarDegreeEffect;
      }
   }
}


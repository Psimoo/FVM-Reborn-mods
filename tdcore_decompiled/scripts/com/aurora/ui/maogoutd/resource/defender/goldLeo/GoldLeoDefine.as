package com.aurora.ui.maogoutd.resource.defender.goldLeo
{
   public class GoldLeoDefine
   {
      
      internal static const DEFENSE_PRICE:int = 275;
      
      public function GoldLeoDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 350;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 36 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 40;
               break;
            case 1:
               iStarDegreeEffect = 44;
               break;
            case 2:
               iStarDegreeEffect = 48;
               break;
            case 3:
               iStarDegreeEffect = 52;
               break;
            case 4:
               iStarDegreeEffect = 56;
               break;
            case 5:
               iStarDegreeEffect = 60;
               break;
            case 6:
               iStarDegreeEffect = 64;
               break;
            case 7:
               iStarDegreeEffect = 70;
               break;
            case 8:
               iStarDegreeEffect = 80;
               break;
            case 9:
               iStarDegreeEffect = 90;
               break;
            case 10:
               iStarDegreeEffect = 110;
               break;
            case 11:
               iStarDegreeEffect = 130;
               break;
            case 12:
               iStarDegreeEffect = 170;
               break;
            case 13:
               iStarDegreeEffect = 180;
               break;
            case 14:
               iStarDegreeEffect = 200;
               break;
            case 15:
               iStarDegreeEffect = 220;
               break;
            case 16:
               iStarDegreeEffect = 240;
               break;
            case 17:
               iStarDegreeEffect = 320;
               break;
            case 18:
               iStarDegreeEffect = 480;
         }
         return iStarDegreeEffect;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.dogCola
{
   public class DogColaZhuanDefine
   {
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function DogColaZhuanDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 350;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 7)
         {
            return 36 - iSkillDegree - 1;
         }
         if(iSkillDegree == 8)
         {
            return 36 - iSkillDegree - 4;
         }
         return 36 - iSkillDegree;
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
               iStarDegreeEffect = 48;
               break;
            case 8:
               iStarDegreeEffect = 54;
               break;
            case 9:
               iStarDegreeEffect = 60;
               break;
            case 10:
               iStarDegreeEffect = 80;
               break;
            case 11:
               iStarDegreeEffect = 100;
               break;
            case 12:
               iStarDegreeEffect = 120;
               break;
            case 13:
               iStarDegreeEffect = 140;
               break;
            case 14:
               iStarDegreeEffect = 160;
               break;
            case 15:
               iStarDegreeEffect = 180;
               break;
            case 16:
               iStarDegreeEffect = 210;
         }
         return iStarDegreeEffect;
      }
   }
}


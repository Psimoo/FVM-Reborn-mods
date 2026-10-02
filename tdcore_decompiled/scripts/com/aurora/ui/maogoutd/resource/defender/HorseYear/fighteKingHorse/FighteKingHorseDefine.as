package com.aurora.ui.maogoutd.resource.defender.HorseYear.fighteKingHorse
{
   public class FighteKingHorseDefine
   {
      
      internal static const DEFENSE_PRICE:int = 260;
      
      public function FighteKingHorseDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 7.5;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7.5;
               break;
            case 1:
               iStarDegreeEffect = 9;
               break;
            case 2:
               iStarDegreeEffect = 10.5;
               break;
            case 3:
               iStarDegreeEffect = 12;
               break;
            case 4:
               iStarDegreeEffect = 15;
               break;
            case 5:
               iStarDegreeEffect = 18;
               break;
            case 6:
               iStarDegreeEffect = 21;
               break;
            case 7:
               iStarDegreeEffect = 25.5;
               break;
            case 8:
               iStarDegreeEffect = 30;
               break;
            case 9:
               iStarDegreeEffect = 34.5;
               break;
            case 10:
               iStarDegreeEffect = 39;
               break;
            case 11:
               iStarDegreeEffect = 46;
               break;
            case 12:
               iStarDegreeEffect = 56;
               break;
            case 13:
               iStarDegreeEffect = 66;
               break;
            case 14:
               iStarDegreeEffect = 76;
               break;
            case 15:
               iStarDegreeEffect = 86;
               break;
            case 16:
               iStarDegreeEffect = 96;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.8;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.8;
               break;
            case 1:
               iSkillDegreeEffect = 1.75;
               break;
            case 2:
               iSkillDegreeEffect = 1.7;
               break;
            case 3:
               iSkillDegreeEffect = 1.65;
               break;
            case 4:
               iSkillDegreeEffect = 1.6;
               break;
            case 5:
               iSkillDegreeEffect = 1.55;
               break;
            case 6:
               iSkillDegreeEffect = 1.5;
               break;
            case 7:
               iSkillDegreeEffect = 1.4;
               break;
            case 8:
               iSkillDegreeEffect = 1.2;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}


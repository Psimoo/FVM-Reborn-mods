package com.aurora.ui.maogoutd.resource.defender.RabbitYear.CandyPot
{
   public class CandyPotBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 315;
      
      internal static const MAX_LIFE_VALUE:int = 1000;
      
      public function CandyPotBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 45;
               break;
            case 1:
               iStarDegreeEffect = 50;
               break;
            case 2:
               iStarDegreeEffect = 55;
               break;
            case 3:
               iStarDegreeEffect = 60;
               break;
            case 4:
               iStarDegreeEffect = 65;
               break;
            case 5:
               iStarDegreeEffect = 70;
               break;
            case 6:
               iStarDegreeEffect = 75;
               break;
            case 7:
               iStarDegreeEffect = 80;
               break;
            case 8:
               iStarDegreeEffect = 85;
               break;
            case 9:
               iStarDegreeEffect = 90;
               break;
            case 10:
               iStarDegreeEffect = 95;
               break;
            case 11:
               iStarDegreeEffect = 100;
               break;
            case 12:
               iStarDegreeEffect = 110;
               break;
            case 13:
               iStarDegreeEffect = 120;
               break;
            case 14:
               iStarDegreeEffect = 130;
               break;
            case 15:
               iStarDegreeEffect = 140;
               break;
            case 16:
               iStarDegreeEffect = 150;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 40;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 40;
               break;
            case 1:
               iSkillDegreeEffect = 38;
               break;
            case 2:
               iSkillDegreeEffect = 36;
               break;
            case 3:
               iSkillDegreeEffect = 34;
               break;
            case 4:
               iSkillDegreeEffect = 32;
               break;
            case 5:
               iSkillDegreeEffect = 30;
               break;
            case 6:
               iSkillDegreeEffect = 25;
               break;
            case 7:
               iSkillDegreeEffect = 20;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.HorseYear.BubbleCocktail
{
   public class BubbleCocktailBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 125;
      
      internal static const MAX_LIFE_VALUE:int = 50;
      
      public function BubbleCocktailBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 50;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 50;
               break;
            case 1:
               iSkillDegreeEffect = 48;
               break;
            case 2:
               iSkillDegreeEffect = 46;
               break;
            case 3:
               iSkillDegreeEffect = 44;
               break;
            case 4:
               iSkillDegreeEffect = 42;
               break;
            case 5:
               iSkillDegreeEffect = 40;
               break;
            case 6:
               iSkillDegreeEffect = 35;
               break;
            case 7:
               iSkillDegreeEffect = 30;
               break;
            case 8:
               iSkillDegreeEffect = 25;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 100;
               break;
            case 1:
               iStarDegreeEffect = 120;
               break;
            case 2:
               iStarDegreeEffect = 140;
               break;
            case 3:
               iStarDegreeEffect = 160;
               break;
            case 4:
               iStarDegreeEffect = 200;
               break;
            case 5:
               iStarDegreeEffect = 250;
               break;
            case 6:
               iStarDegreeEffect = 300;
               break;
            case 7:
               iStarDegreeEffect = 400;
               break;
            case 8:
               iStarDegreeEffect = 600;
               break;
            case 9:
               iStarDegreeEffect = 800;
               break;
            case 10:
               iStarDegreeEffect = 1000;
               break;
            case 11:
               iStarDegreeEffect = 1500;
               break;
            case 12:
               iStarDegreeEffect = 2000;
               break;
            case 13:
               iStarDegreeEffect = 2500;
               break;
            case 14:
               iStarDegreeEffect = 3000;
               break;
            case 15:
               iStarDegreeEffect = 3500;
               break;
            case 16:
               iStarDegreeEffect = 4000;
         }
         return iStarDegreeEffect;
      }
   }
}


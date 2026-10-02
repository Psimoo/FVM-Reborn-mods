package com.aurora.ui.maogoutd.resource.defender.SnakeYear.explosiveSnake
{
   public class ExplosiveSnakeBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 300;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 1000;
      
      public function ExplosiveSnakeBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 58;
               break;
            case 1:
               iStarDegreeEffect = 56;
               break;
            case 2:
               iStarDegreeEffect = 54;
               break;
            case 3:
               iStarDegreeEffect = 52;
               break;
            case 4:
               iStarDegreeEffect = 50;
               break;
            case 5:
               iStarDegreeEffect = 48;
               break;
            case 6:
               iStarDegreeEffect = 46;
               break;
            case 7:
               iStarDegreeEffect = 43;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 37;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 31;
               break;
            case 12:
               iStarDegreeEffect = 28;
               break;
            case 13:
               iStarDegreeEffect = 25;
               break;
            case 14:
               iStarDegreeEffect = 22;
               break;
            case 15:
               iStarDegreeEffect = 19;
               break;
            case 16:
               iStarDegreeEffect = 16;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 4;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 4;
               break;
            case 1:
               iSkillDegreeEffect = 3.8;
               break;
            case 2:
               iSkillDegreeEffect = 3.6;
               break;
            case 3:
               iSkillDegreeEffect = 3.4;
               break;
            case 4:
               iSkillDegreeEffect = 3.2;
               break;
            case 5:
               iSkillDegreeEffect = 3;
               break;
            case 6:
               iSkillDegreeEffect = 2.5;
               break;
            case 7:
               iSkillDegreeEffect = 2;
               break;
            case 8:
               iSkillDegreeEffect = 0.05;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}


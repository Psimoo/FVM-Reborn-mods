package com.aurora.ui.maogoutd.resource.defender.PigYear.HadesMeow
{
   public class HadesMeowDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 0;
      
      public function HadesMeowDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6.5;
               break;
            case 1:
               iStarDegreeEffect = 7.5;
               break;
            case 2:
               iStarDegreeEffect = 8.5;
               break;
            case 3:
               iStarDegreeEffect = 9.5;
               break;
            case 4:
               iStarDegreeEffect = 11.5;
               break;
            case 5:
               iStarDegreeEffect = 13.5;
               break;
            case 6:
               iStarDegreeEffect = 15.5;
               break;
            case 7:
               iStarDegreeEffect = 18.5;
               break;
            case 8:
               iStarDegreeEffect = 21.5;
               break;
            case 9:
               iStarDegreeEffect = 25.5;
               break;
            case 10:
               iStarDegreeEffect = 30.5;
               break;
            case 11:
               iStarDegreeEffect = 38.5;
               break;
            case 12:
               iStarDegreeEffect = 51;
               break;
            case 13:
               iStarDegreeEffect = 62;
               break;
            case 14:
               iStarDegreeEffect = 75;
               break;
            case 15:
               iStarDegreeEffect = 88;
               break;
            case 16:
               iStarDegreeEffect = 103;
               break;
            case 17:
               iStarDegreeEffect = 132;
               break;
            case 18:
               iStarDegreeEffect = 198;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


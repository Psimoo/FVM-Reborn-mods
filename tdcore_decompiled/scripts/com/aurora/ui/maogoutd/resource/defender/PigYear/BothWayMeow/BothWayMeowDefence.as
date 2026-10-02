package com.aurora.ui.maogoutd.resource.defender.PigYear.BothWayMeow
{
   public class BothWayMeowDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 305;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      public function BothWayMeowDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
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
               iSkillDegreeEffect = 1.3;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.6;
               break;
            case 1:
               iStarDegreeEffect = 1.9;
               break;
            case 2:
               iStarDegreeEffect = 2.2;
               break;
            case 3:
               iStarDegreeEffect = 2.5;
               break;
            case 4:
               iStarDegreeEffect = 2.8;
               break;
            case 5:
               iStarDegreeEffect = 3.1;
               break;
            case 6:
               iStarDegreeEffect = 3.5;
               break;
            case 7:
               iStarDegreeEffect = 4;
               break;
            case 8:
               iStarDegreeEffect = 5;
               break;
            case 9:
               iStarDegreeEffect = 6;
               break;
            case 10:
               iStarDegreeEffect = 8.5;
               break;
            case 11:
               iStarDegreeEffect = 11;
               break;
            case 12:
               iStarDegreeEffect = 14;
               break;
            case 13:
               iStarDegreeEffect = 17;
               break;
            case 14:
               iStarDegreeEffect = 20;
               break;
            case 15:
               iStarDegreeEffect = 23;
               break;
            case 16:
               iStarDegreeEffect = 26;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


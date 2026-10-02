package com.aurora.ui.maogoutd.resource.defender.DragonYear.SpicyRiceCakeCrab
{
   public class SpicyRiceCakeCrabDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function SpicyRiceCakeCrabDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 40;
               break;
            case 1:
               iStarDegreeEffect = 39;
               break;
            case 2:
               iStarDegreeEffect = 38;
               break;
            case 3:
               iStarDegreeEffect = 37;
               break;
            case 4:
               iStarDegreeEffect = 35;
               break;
            case 5:
               iStarDegreeEffect = 33;
               break;
            case 6:
               iStarDegreeEffect = 31;
               break;
            case 7:
               iStarDegreeEffect = 29;
               break;
            case 8:
               iStarDegreeEffect = 27;
               break;
            case 9:
               iStarDegreeEffect = 25;
               break;
            case 10:
               iStarDegreeEffect = 23;
               break;
            case 11:
               iStarDegreeEffect = 20;
               break;
            case 12:
               iStarDegreeEffect = 17;
               break;
            case 13:
               iStarDegreeEffect = 14;
               break;
            case 14:
               iStarDegreeEffect = 11;
               break;
            case 15:
               iStarDegreeEffect = 8;
               break;
            case 16:
               iStarDegreeEffect = 5;
         }
         return 20 * iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 50;
               break;
            case 1:
               iSkillDegreeEffect = 48;
               break;
            case 2:
               iSkillDegreeEffect = 45;
               break;
            case 3:
               iSkillDegreeEffect = 42;
               break;
            case 4:
               iSkillDegreeEffect = 38;
               break;
            case 5:
               iSkillDegreeEffect = 34;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 20;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}


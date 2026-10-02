package com.aurora.ui.maogoutd.resource.defender.SnakeYear.FoodTimer
{
   import a_4718.b_183;
   
   public class FoodTimerDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 275;
      
      internal static const MAX_LIFE_VALUE:int = 1000;
      
      public function FoodTimerDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 8.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 8.5;
               break;
            case 1:
               iSkillDegreeEffect = 9;
               break;
            case 2:
               iSkillDegreeEffect = 9.5;
               break;
            case 3:
               iSkillDegreeEffect = 10;
               break;
            case 4:
               iSkillDegreeEffect = 10.5;
               break;
            case 5:
               iSkillDegreeEffect = 11;
               break;
            case 6:
               iSkillDegreeEffect = 11.5;
               break;
            case 7:
               iSkillDegreeEffect = 12;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 62;
               break;
            case 1:
               iStarDegreeEffect = 61;
               break;
            case 2:
               iStarDegreeEffect = 60;
               break;
            case 3:
               iStarDegreeEffect = 59;
               break;
            case 4:
               iStarDegreeEffect = 57;
               break;
            case 5:
               iStarDegreeEffect = 55;
               break;
            case 6:
               iStarDegreeEffect = 53;
               break;
            case 7:
               iStarDegreeEffect = 51;
               break;
            case 8:
               iStarDegreeEffect = 48;
               break;
            case 9:
               iStarDegreeEffect = 45;
               break;
            case 10:
               iStarDegreeEffect = 43;
               break;
            case 11:
               iStarDegreeEffect = 40;
               break;
            case 12:
               iStarDegreeEffect = 37;
               break;
            case 13:
               iStarDegreeEffect = 34;
               break;
            case 14:
               iStarDegreeEffect = 31;
               break;
            case 15:
               iStarDegreeEffect = 28;
               break;
            case 16:
               iStarDegreeEffect = 25;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos
{
   import a_4718.b_183;
   
   public class GoldTimeChronosDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 370;
      
      internal static const MAX_LIFE_VALUE:int = 1000;
      
      public function GoldTimeChronosDefence()
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
         var iSkillDegreeEffect:Number = 17;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 17;
               break;
            case 1:
               iSkillDegreeEffect = 17.5;
               break;
            case 2:
               iSkillDegreeEffect = 18;
               break;
            case 3:
               iSkillDegreeEffect = 18.5;
               break;
            case 4:
               iSkillDegreeEffect = 19;
               break;
            case 5:
               iSkillDegreeEffect = 19.5;
               break;
            case 6:
               iSkillDegreeEffect = 24;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 31;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 60;
               break;
            case 1:
               iStarDegreeEffect = 59;
               break;
            case 2:
               iStarDegreeEffect = 58;
               break;
            case 3:
               iStarDegreeEffect = 57;
               break;
            case 4:
               iStarDegreeEffect = 55;
               break;
            case 5:
               iStarDegreeEffect = 53;
               break;
            case 6:
               iStarDegreeEffect = 50;
               break;
            case 7:
               iStarDegreeEffect = 47;
               break;
            case 8:
               iStarDegreeEffect = 44;
               break;
            case 9:
               iStarDegreeEffect = 41;
               break;
            case 10:
               iStarDegreeEffect = 38;
               break;
            case 11:
               iStarDegreeEffect = 35;
               break;
            case 12:
               iStarDegreeEffect = 32;
               break;
            case 13:
               iStarDegreeEffect = 29;
               break;
            case 14:
               iStarDegreeEffect = 26;
               break;
            case 15:
               iStarDegreeEffect = 23;
               break;
            case 16:
               iStarDegreeEffect = 20;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.HorseYear.battleflag
{
   import a_4718.b_183;
   
   public class BattleFlagHorseDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 380;
      
      public function BattleFlagHorseDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 45 * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 20;
               break;
            case 1:
               iSkillDegreeEffect = 21;
               break;
            case 2:
               iSkillDegreeEffect = 23;
               break;
            case 3:
               iSkillDegreeEffect = 25;
               break;
            case 4:
               iSkillDegreeEffect = 27;
               break;
            case 5:
               iSkillDegreeEffect = 29;
               break;
            case 6:
               iSkillDegreeEffect = 32;
               break;
            case 7:
               iSkillDegreeEffect = 35;
               break;
            case 8:
               iSkillDegreeEffect = 45;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0.38;
               break;
            case 1:
               iStarDegreeEffect = 0.4;
               break;
            case 2:
               iStarDegreeEffect = 0.43;
               break;
            case 3:
               iStarDegreeEffect = 0.46;
               break;
            case 4:
               iStarDegreeEffect = 0.49;
               break;
            case 5:
               iStarDegreeEffect = 0.52;
               break;
            case 6:
               iStarDegreeEffect = 0.55;
               break;
            case 7:
               iStarDegreeEffect = 0.6;
               break;
            case 8:
               iStarDegreeEffect = 0.65;
               break;
            case 9:
               iStarDegreeEffect = 0.7;
               break;
            case 10:
               iStarDegreeEffect = 0.75;
               break;
            case 11:
               iStarDegreeEffect = 0.8;
               break;
            case 12:
               iStarDegreeEffect = 0.85;
               break;
            case 13:
               iStarDegreeEffect = 0.95;
               break;
            case 14:
               iStarDegreeEffect = 1.05;
               break;
            case 15:
               iStarDegreeEffect = 1.15;
               break;
            case 16:
               iStarDegreeEffect = 1.25;
         }
         return iStarDegreeEffect;
      }
   }
}


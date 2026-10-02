package com.aurora.ui.maogoutd.resource.defender.PigYear.rocketPig
{
   import a_4718.b_183;
   
   public class RocketPigDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 255;
      
      public function RocketPigDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 300;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 6;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 6;
               break;
            case 1:
               iSkillDegreeEffect = 5.8;
               break;
            case 2:
               iSkillDegreeEffect = 5.6;
               break;
            case 3:
               iSkillDegreeEffect = 5.4;
               break;
            case 4:
               iSkillDegreeEffect = 5.2;
               break;
            case 5:
               iSkillDegreeEffect = 5;
               break;
            case 6:
               iSkillDegreeEffect = 4.8;
               break;
            case 7:
               iSkillDegreeEffect = 4.6;
               break;
            case 8:
               iSkillDegreeEffect = 4.35;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 12;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 16;
               break;
            case 3:
               iStarDegreeEffect = 18;
               break;
            case 4:
               iStarDegreeEffect = 20;
               break;
            case 5:
               iStarDegreeEffect = 22;
               break;
            case 6:
               iStarDegreeEffect = 24;
               break;
            case 7:
               iStarDegreeEffect = 26;
               break;
            case 8:
               iStarDegreeEffect = 28;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 42;
               break;
            case 13:
               iStarDegreeEffect = 46;
               break;
            case 14:
               iStarDegreeEffect = 50;
               break;
            case 15:
               iStarDegreeEffect = 54;
               break;
            case 16:
               iStarDegreeEffect = 59;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


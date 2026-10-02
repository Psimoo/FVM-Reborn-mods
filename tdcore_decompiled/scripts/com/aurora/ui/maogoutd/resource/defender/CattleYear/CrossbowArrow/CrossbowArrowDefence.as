package com.aurora.ui.maogoutd.resource.defender.CattleYear.CrossbowArrow
{
   import a_4718.b_183;
   
   public class CrossbowArrowDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 375;
      
      public function CrossbowArrowDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
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
               iSkillDegreeEffect = 0.95;
               break;
            case 8:
               iSkillDegreeEffect = 0.9;
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
               iStarDegreeEffect = 3.4;
               break;
            case 7:
               iStarDegreeEffect = 4;
               break;
            case 8:
               iStarDegreeEffect = 4.95;
               break;
            case 9:
               iStarDegreeEffect = 6.15;
               break;
            case 10:
               iStarDegreeEffect = 8.45;
               break;
            case 11:
               iStarDegreeEffect = 10.75;
               break;
            case 12:
               iStarDegreeEffect = 13.2;
               break;
            case 13:
               iStarDegreeEffect = 15.4;
               break;
            case 14:
               iStarDegreeEffect = 17.9;
               break;
            case 15:
               iStarDegreeEffect = 20.4;
               break;
            case 16:
               iStarDegreeEffect = 23.4;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


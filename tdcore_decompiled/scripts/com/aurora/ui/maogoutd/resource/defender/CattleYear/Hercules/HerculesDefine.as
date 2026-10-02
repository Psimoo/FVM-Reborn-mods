package com.aurora.ui.maogoutd.resource.defender.CattleYear.Hercules
{
   import a_4718.b_183;
   
   public class HerculesDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 11;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 4;
      
      internal static const DEFENSE_PRICE:int = 275;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.35;
      
      public function HerculesDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function GetShotTypeID() : int
      {
         return b_183.enm_JumpChecken;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3;
               break;
            case 1:
               iSkillDegreeEffect = 2.8;
               break;
            case 2:
               iSkillDegreeEffect = 2.6;
               break;
            case 3:
               iSkillDegreeEffect = 2.4;
               break;
            case 4:
               iSkillDegreeEffect = 2.2;
               break;
            case 5:
               iSkillDegreeEffect = 2;
               break;
            case 6:
               iSkillDegreeEffect = 1.8;
               break;
            case 7:
               iSkillDegreeEffect = 1.6;
               break;
            case 8:
               iSkillDegreeEffect = 1.2;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 21;
               break;
            case 1:
               iStarDegreeEffect = 22;
               break;
            case 2:
               iStarDegreeEffect = 23;
               break;
            case 3:
               iStarDegreeEffect = 25;
               break;
            case 4:
               iStarDegreeEffect = 28;
               break;
            case 5:
               iStarDegreeEffect = 33;
               break;
            case 6:
               iStarDegreeEffect = 38;
               break;
            case 7:
               iStarDegreeEffect = 43;
               break;
            case 8:
               iStarDegreeEffect = 48;
               break;
            case 9:
               iStarDegreeEffect = 53;
               break;
            case 10:
               iStarDegreeEffect = 59;
               break;
            case 11:
               iStarDegreeEffect = 65;
               break;
            case 12:
               iStarDegreeEffect = 71;
               break;
            case 13:
               iStarDegreeEffect = 77;
               break;
            case 14:
               iStarDegreeEffect = 84;
               break;
            case 15:
               iStarDegreeEffect = 91;
               break;
            case 16:
               iStarDegreeEffect = 98;
               break;
            case 17:
               iStarDegreeEffect = 118;
               break;
            case 18:
               iStarDegreeEffect = 177;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.CattleYear.CanCattle
{
   import a_4718.b_183;
   
   public class CanCattleDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 90;
      
      public function CanCattleDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 85;
               break;
            case 1:
               iSkillDegreeEffect = 83;
               break;
            case 2:
               iSkillDegreeEffect = 81;
               break;
            case 3:
               iSkillDegreeEffect = 79;
               break;
            case 4:
               iSkillDegreeEffect = 77;
               break;
            case 5:
               iSkillDegreeEffect = 75;
               break;
            case 6:
               iSkillDegreeEffect = 73;
               break;
            case 7:
               iSkillDegreeEffect = 70;
               break;
            case 8:
               iSkillDegreeEffect = 50;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 11;
               break;
            case 2:
               iStarDegreeEffect = 12;
               break;
            case 3:
               iStarDegreeEffect = 13;
               break;
            case 4:
               iStarDegreeEffect = 14;
               break;
            case 5:
               iStarDegreeEffect = 15;
               break;
            case 6:
               iStarDegreeEffect = 16;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 18;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 25;
               break;
            case 11:
               iStarDegreeEffect = 30;
               break;
            case 12:
               iStarDegreeEffect = 40;
               break;
            case 13:
               iStarDegreeEffect = 50;
               break;
            case 14:
               iStarDegreeEffect = 60;
               break;
            case 15:
               iStarDegreeEffect = 70;
               break;
            case 16:
               iStarDegreeEffect = 80;
         }
         return iStarDegreeEffect / 100;
      }
   }
}


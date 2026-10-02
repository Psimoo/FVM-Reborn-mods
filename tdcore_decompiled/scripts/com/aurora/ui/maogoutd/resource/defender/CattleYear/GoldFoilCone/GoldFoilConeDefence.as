package com.aurora.ui.maogoutd.resource.defender.CattleYear.GoldFoilCone
{
   import a_4718.b_183;
   
   public class GoldFoilConeDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 60;
      
      public function GoldFoilConeDefence()
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
         var iSkillDegreeEffect:Number = 10;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 10;
               break;
            case 1:
               iSkillDegreeEffect = 11;
               break;
            case 2:
               iSkillDegreeEffect = 12;
               break;
            case 3:
               iSkillDegreeEffect = 13;
               break;
            case 4:
               iSkillDegreeEffect = 14;
               break;
            case 5:
               iSkillDegreeEffect = 15;
               break;
            case 6:
               iSkillDegreeEffect = 16;
               break;
            case 7:
               iSkillDegreeEffect = 18;
               break;
            case 8:
               iSkillDegreeEffect = 21;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 60;
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
               iStarDegreeEffect = 56;
               break;
            case 5:
               iStarDegreeEffect = 55;
               break;
            case 6:
               iStarDegreeEffect = 54;
               break;
            case 7:
               iStarDegreeEffect = 53;
               break;
            case 8:
               iStarDegreeEffect = 52;
               break;
            case 9:
               iStarDegreeEffect = 50;
               break;
            case 10:
               iStarDegreeEffect = 48;
               break;
            case 11:
               iStarDegreeEffect = 46;
               break;
            case 12:
               iStarDegreeEffect = 41;
               break;
            case 13:
               iStarDegreeEffect = 36;
               break;
            case 14:
               iStarDegreeEffect = 31;
               break;
            case 15:
               iStarDegreeEffect = 26;
               break;
            case 16:
               iStarDegreeEffect = 21;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


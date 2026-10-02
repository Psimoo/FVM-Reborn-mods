package com.aurora.ui.maogoutd.resource.defender.PigYear.CatStick
{
   import a_4718.b_183;
   
   public class CatStickDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function CatStickDefence()
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
               iSkillDegreeEffect = 9.5;
               break;
            case 2:
               iSkillDegreeEffect = 9;
               break;
            case 3:
               iSkillDegreeEffect = 8;
               break;
            case 4:
               iSkillDegreeEffect = 7;
               break;
            case 5:
               iSkillDegreeEffect = 6;
               break;
            case 6:
               iSkillDegreeEffect = 5;
               break;
            case 7:
               iSkillDegreeEffect = 4;
               break;
            case 8:
               iSkillDegreeEffect = 3;
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
               iStarDegreeEffect = 58;
               break;
            case 2:
               iStarDegreeEffect = 56;
               break;
            case 3:
               iStarDegreeEffect = 54;
               break;
            case 4:
               iStarDegreeEffect = 52;
               break;
            case 5:
               iStarDegreeEffect = 50;
               break;
            case 6:
               iStarDegreeEffect = 48;
               break;
            case 7:
               iStarDegreeEffect = 45;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 39;
               break;
            case 10:
               iStarDegreeEffect = 36;
               break;
            case 11:
               iStarDegreeEffect = 32;
               break;
            case 12:
               iStarDegreeEffect = 28;
               break;
            case 13:
               iStarDegreeEffect = 24;
               break;
            case 14:
               iStarDegreeEffect = 20;
               break;
            case 15:
               iStarDegreeEffect = 15;
               break;
            case 16:
               iStarDegreeEffect = 10;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


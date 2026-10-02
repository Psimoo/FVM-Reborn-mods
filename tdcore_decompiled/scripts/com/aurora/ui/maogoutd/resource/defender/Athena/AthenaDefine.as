package com.aurora.ui.maogoutd.resource.defender.Athena
{
   import a_4718.b_183;
   
   public class AthenaDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 375;
      
      public function AthenaDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 200;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 120 - iSkillDegree * 4 - 1;
         }
         return 120 - iSkillDegree * 4;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 30;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 35;
               break;
            case 2:
               iStarDegreeEffect = 40;
               break;
            case 3:
               iStarDegreeEffect = 45;
               break;
            case 4:
               iStarDegreeEffect = 50;
               break;
            case 5:
               iStarDegreeEffect = 55;
               break;
            case 6:
               iStarDegreeEffect = 60;
               break;
            case 7:
               iStarDegreeEffect = 65;
               break;
            case 8:
               iStarDegreeEffect = 70;
               break;
            case 9:
               iStarDegreeEffect = 75;
               break;
            case 10:
               iStarDegreeEffect = 85;
               break;
            case 11:
               iStarDegreeEffect = 95;
               break;
            case 12:
               iStarDegreeEffect = 105;
               break;
            case 13:
               iStarDegreeEffect = 115;
               break;
            case 14:
               iStarDegreeEffect = 125;
               break;
            case 15:
               iStarDegreeEffect = 135;
               break;
            case 16:
               iStarDegreeEffect = 147.5;
         }
         return 4 * iStarDegreeEffect;
      }
   }
}


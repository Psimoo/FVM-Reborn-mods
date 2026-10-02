package com.aurora.ui.maogoutd.resource.defender.defenderSet.steamedDumplings
{
   import a_4718.b_183;
   
   public class SteamedDumplingsDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 8;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 1;
      
      internal static const DEFENSE_PRICE:int = 125;
      
      public function SteamedDumplingsDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.b_184;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 140;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 50 - iSkillDegree * 2;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 7;
               break;
            case 3:
               iStarDegreeEffect = 8;
               break;
            case 4:
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 10;
               break;
            case 6:
               iStarDegreeEffect = 11;
               break;
            case 7:
               iStarDegreeEffect = 13;
               break;
            case 8:
               iStarDegreeEffect = 16;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 46;
               break;
            case 13:
               iStarDegreeEffect = 56;
               break;
            case 14:
               iStarDegreeEffect = 66;
               break;
            case 15:
               iStarDegreeEffect = 76;
               break;
            case 16:
               iStarDegreeEffect = 86;
         }
         return iStarDegreeEffect;
      }
   }
}


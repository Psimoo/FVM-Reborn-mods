package com.aurora.ui.maogoutd.resource.defender.newSeabedChapters.HaiXing
{
   import a_4718.b_183;
   
   public class HaixingDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 175;
      
      public function HaixingDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree <= 6)
         {
            return 26 - iSkillDegree * 1;
         }
         if(iSkillDegree == 7)
         {
            return 18;
         }
         if(iSkillDegree == 8)
         {
            return 16;
         }
         return 26 - iSkillDegree * 1;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 5;
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
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
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
               iStarDegreeEffect = 57;
               break;
            case 14:
               iStarDegreeEffect = 69;
               break;
            case 15:
               iStarDegreeEffect = 82;
               break;
            case 16:
               iStarDegreeEffect = 97;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}


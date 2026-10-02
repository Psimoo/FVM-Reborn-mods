package com.aurora.ui.maogoutd.resource.defender.goldFollow
{
   import a_4718.b_183;
   
   public class GoldCancerFollowDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function GoldCancerFollowDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_CancerFollow;
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 300;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 70 - iSkillDegree - 2;
         }
         if(iSkillDegree == 7)
         {
            return 70 - iSkillDegree - 1;
         }
         return 70 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 20;
               break;
            case 1:
               iStarDegreeEffect = 22;
               break;
            case 2:
               iStarDegreeEffect = 25;
               break;
            case 3:
               iStarDegreeEffect = 27;
               break;
            case 4:
               iStarDegreeEffect = 30;
               break;
            case 5:
               iStarDegreeEffect = 32;
               break;
            case 6:
               iStarDegreeEffect = 34;
               break;
            case 7:
               iStarDegreeEffect = 39;
               break;
            case 8:
               iStarDegreeEffect = 46;
               break;
            case 9:
               iStarDegreeEffect = 56;
               break;
            case 10:
               iStarDegreeEffect = 74;
               break;
            case 11:
               iStarDegreeEffect = 92;
               break;
            case 12:
               iStarDegreeEffect = 110;
               break;
            case 13:
               iStarDegreeEffect = 128;
               break;
            case 14:
               iStarDegreeEffect = 150;
               break;
            case 15:
               iStarDegreeEffect = 168;
               break;
            case 16:
               iStarDegreeEffect = 186;
               break;
            case 17:
               iStarDegreeEffect = 262;
               break;
            case 18:
               iStarDegreeEffect = 395;
         }
         return iStarDegreeEffect;
      }
   }
}


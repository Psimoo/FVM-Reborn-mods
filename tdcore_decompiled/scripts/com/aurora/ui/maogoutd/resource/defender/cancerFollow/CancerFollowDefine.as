package com.aurora.ui.maogoutd.resource.defender.cancerFollow
{
   import a_4718.b_183;
   
   public class CancerFollowDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function CancerFollowDefine()
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
            return 70 - iSkillDegree - 4;
         }
         return 70 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 17;
               break;
            case 3:
               iStarDegreeEffect = 19;
               break;
            case 4:
               iStarDegreeEffect = 22;
               break;
            case 5:
               iStarDegreeEffect = 24;
               break;
            case 6:
               iStarDegreeEffect = 26;
               break;
            case 7:
               iStarDegreeEffect = 31;
               break;
            case 8:
               iStarDegreeEffect = 38;
               break;
            case 9:
               iStarDegreeEffect = 48;
               break;
            case 10:
               iStarDegreeEffect = 66;
               break;
            case 11:
               iStarDegreeEffect = 84;
               break;
            case 12:
               iStarDegreeEffect = 102;
               break;
            case 13:
               iStarDegreeEffect = 120;
               break;
            case 14:
               iStarDegreeEffect = 138;
               break;
            case 15:
               iStarDegreeEffect = 156;
               break;
            case 16:
               iStarDegreeEffect = 176;
         }
         return iStarDegreeEffect;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.dogFollow
{
   import a_4718.b_183;
   
   public class DoubleRenDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 6;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function DoubleRenDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 300;
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_CancerFollow;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 62 - iSkillDegree - 4;
         }
         return 62 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 12;
               break;
            case 2:
               iStarDegreeEffect = 14;
               break;
            case 3:
               iStarDegreeEffect = 16;
               break;
            case 4:
               iStarDegreeEffect = 19;
               break;
            case 5:
               iStarDegreeEffect = 22;
               break;
            case 6:
               iStarDegreeEffect = 25;
               break;
            case 7:
               iStarDegreeEffect = 30;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 50;
               break;
            case 10:
               iStarDegreeEffect = 65;
               break;
            case 11:
               iStarDegreeEffect = 80;
               break;
            case 12:
               iStarDegreeEffect = 95;
               break;
            case 13:
               iStarDegreeEffect = 115;
               break;
            case 14:
               iStarDegreeEffect = 135;
               break;
            case 15:
               iStarDegreeEffect = 155;
               break;
            case 16:
               iStarDegreeEffect = 185;
         }
         return iStarDegreeEffect;
      }
   }
}


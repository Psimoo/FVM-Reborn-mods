package com.aurora.ui.maogoutd.resource.defender.flickChick
{
   public class FlickChickDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function FlickChickDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 7)
         {
            return 50 - iSkillDegree - 1;
         }
         if(iSkillDegree == 8)
         {
            return 50 - iSkillDegree - 3;
         }
         return 50 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 4.5;
               break;
            case 1:
               iStarDegreeEffect = 5.4;
               break;
            case 2:
               iStarDegreeEffect = 6.3;
               break;
            case 3:
               iStarDegreeEffect = 7.2;
               break;
            case 4:
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 10.8;
               break;
            case 6:
               iStarDegreeEffect = 12.6;
               break;
            case 7:
               iStarDegreeEffect = 15.3;
               break;
            case 8:
               iStarDegreeEffect = 18;
               break;
            case 9:
               iStarDegreeEffect = 20.7;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 34;
               break;
            case 12:
               iStarDegreeEffect = 43;
               break;
            case 13:
               iStarDegreeEffect = 53;
               break;
            case 14:
               iStarDegreeEffect = 64;
               break;
            case 15:
               iStarDegreeEffect = 76;
               break;
            case 16:
               iStarDegreeEffect = 91;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


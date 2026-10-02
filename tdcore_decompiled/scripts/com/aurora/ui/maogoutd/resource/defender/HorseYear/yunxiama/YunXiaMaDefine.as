package com.aurora.ui.maogoutd.resource.defender.HorseYear.yunxiama
{
   public class YunXiaMaDefine
   {
      
      internal static const DEFENSE_PRICE:int = 285;
      
      internal static const SHOT_DELAY_TIMENUM1:int = 6;
      
      internal static const SHOT_DELAY_TIMENUM2:int = 10;
      
      internal static const SHOT_DELAY_TIMENUM3:int = 18;
      
      public static const BLIND_TAG:int = 40009;
      
      public static const BLIND_BUFF_DURATION:int = 3 * 20;
      
      public function YunXiaMaDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.6;
               break;
            case 1:
               iSkillDegreeEffect = 2.55;
               break;
            case 2:
               iSkillDegreeEffect = 2.5;
               break;
            case 3:
               iSkillDegreeEffect = 2.45;
               break;
            case 4:
               iSkillDegreeEffect = 2.4;
               break;
            case 5:
               iSkillDegreeEffect = 2.35;
               break;
            case 6:
               iSkillDegreeEffect = 2.3;
               break;
            case 7:
               iSkillDegreeEffect = 2.2;
               break;
            case 8:
               iSkillDegreeEffect = 2;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 15;
               break;
            case 1:
               iStarDegreeEffect = 18;
               break;
            case 2:
               iStarDegreeEffect = 21;
               break;
            case 3:
               iStarDegreeEffect = 27;
               break;
            case 4:
               iStarDegreeEffect = 33;
               break;
            case 5:
               iStarDegreeEffect = 42;
               break;
            case 6:
               iStarDegreeEffect = 51;
               break;
            case 7:
               iStarDegreeEffect = 60;
               break;
            case 8:
               iStarDegreeEffect = 69;
               break;
            case 9:
               iStarDegreeEffect = 84;
               break;
            case 10:
               iStarDegreeEffect = 99;
               break;
            case 11:
               iStarDegreeEffect = 114;
               break;
            case 12:
               iStarDegreeEffect = 129;
               break;
            case 13:
               iStarDegreeEffect = 144;
               break;
            case 14:
               iStarDegreeEffect = 160;
               break;
            case 15:
               iStarDegreeEffect = 180;
               break;
            case 16:
               iStarDegreeEffect = 205;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


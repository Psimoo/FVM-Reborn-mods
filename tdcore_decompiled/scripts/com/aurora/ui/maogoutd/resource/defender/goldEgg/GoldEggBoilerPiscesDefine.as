package com.aurora.ui.maogoutd.resource.defender.goldEgg
{
   import a_4718.b_183;
   
   public class GoldEggBoilerPiscesDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function GoldEggBoilerPiscesDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_EggBoilerPisces;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 50 - iSkillDegree - 2;
         }
         if(iSkillDegree == 7)
         {
            return 50 - iSkillDegree - 1;
         }
         return 50 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 90;
               break;
            case 1:
               iStarDegreeEffect = 110;
               break;
            case 2:
               iStarDegreeEffect = 130;
               break;
            case 3:
               iStarDegreeEffect = 150;
               break;
            case 4:
               iStarDegreeEffect = 170;
               break;
            case 5:
               iStarDegreeEffect = 200;
               break;
            case 6:
               iStarDegreeEffect = 230;
               break;
            case 7:
               iStarDegreeEffect = 260;
               break;
            case 8:
               iStarDegreeEffect = 290;
               break;
            case 9:
               iStarDegreeEffect = 370;
               break;
            case 10:
               iStarDegreeEffect = 450;
               break;
            case 11:
               iStarDegreeEffect = 550;
               break;
            case 12:
               iStarDegreeEffect = 650;
               break;
            case 13:
               iStarDegreeEffect = 760;
               break;
            case 14:
               iStarDegreeEffect = 910;
               break;
            case 15:
               iStarDegreeEffect = 1070;
               break;
            case 16:
               iStarDegreeEffect = 1230;
               break;
            case 17:
               iStarDegreeEffect = 1600;
               break;
            case 18:
               iStarDegreeEffect = 2400;
         }
         return iStarDegreeEffect;
      }
   }
}


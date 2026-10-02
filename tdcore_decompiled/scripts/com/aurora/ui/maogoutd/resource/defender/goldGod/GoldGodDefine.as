package com.aurora.ui.maogoutd.resource.defender.goldGod
{
   import a_4718.b_183;
   
   public class GoldGodDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      internal static const HURT_ADDTION:Number = 0.2;
      
      public function GoldGodDefine()
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
         switch(iSkillDegree)
         {
            case 0:
               return 120;
            case 1:
               return 116;
            case 2:
               return 112;
            case 3:
               return 108;
            case 4:
               return 104;
            case 5:
               return 100;
            case 6:
               return 96;
            case 7:
               return 90;
            case 8:
               return 70;
            default:
               return 120;
         }
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 120;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 120;
               break;
            case 1:
               iStarDegreeEffect = 140;
               break;
            case 2:
               iStarDegreeEffect = 160;
               break;
            case 3:
               iStarDegreeEffect = 180;
               break;
            case 4:
               iStarDegreeEffect = 200;
               break;
            case 5:
               iStarDegreeEffect = 220;
               break;
            case 6:
               iStarDegreeEffect = 240;
               break;
            case 7:
               iStarDegreeEffect = 260;
               break;
            case 8:
               iStarDegreeEffect = 280;
               break;
            case 9:
               iStarDegreeEffect = 300;
               break;
            case 10:
               iStarDegreeEffect = 350;
               break;
            case 11:
               iStarDegreeEffect = 400;
               break;
            case 12:
               iStarDegreeEffect = 450;
               break;
            case 13:
               iStarDegreeEffect = 550;
               break;
            case 14:
               iStarDegreeEffect = 750;
               break;
            case 15:
               iStarDegreeEffect = 950;
               break;
            case 16:
               iStarDegreeEffect = 1250;
               break;
            case 17:
               iStarDegreeEffect = 1600;
               break;
            case 18:
               iStarDegreeEffect = 2150;
         }
         return iStarDegreeEffect;
      }
   }
}


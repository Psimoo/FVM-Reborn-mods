package com.aurora.ui.maogoutd.resource.defender.xinjiangNoodles
{
   public class XinjiangNoodlesDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 150;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.5;
      
      public function XinjiangNoodlesDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 20 - iSkillDegree;
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
               iStarDegreeEffect = 24;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 32;
               break;
            case 4:
               iStarDegreeEffect = 36;
               break;
            case 5:
               iStarDegreeEffect = 40;
               break;
            case 6:
               iStarDegreeEffect = 44;
               break;
            case 7:
               iStarDegreeEffect = 52;
               break;
            case 8:
               iStarDegreeEffect = 64;
               break;
            case 9:
               iStarDegreeEffect = 80;
               break;
            case 10:
               iStarDegreeEffect = 110;
               break;
            case 11:
               iStarDegreeEffect = 140;
               break;
            case 12:
               iStarDegreeEffect = 170;
               break;
            case 13:
               iStarDegreeEffect = 200;
               break;
            case 14:
               iStarDegreeEffect = 230;
               break;
            case 15:
               iStarDegreeEffect = 260;
               break;
            case 16:
               iStarDegreeEffect = 290;
         }
         return iStarDegreeEffect;
      }
   }
}


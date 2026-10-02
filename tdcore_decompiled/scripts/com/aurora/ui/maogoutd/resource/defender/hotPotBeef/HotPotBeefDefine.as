package com.aurora.ui.maogoutd.resource.defender.hotPotBeef
{
   public class HotPotBeefDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.2;
      
      public function HotPotBeefDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 100 - iSkillDegree * 2;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 7;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8;
               break;
            case 2:
               iStarDegreeEffect = 10;
               break;
            case 3:
               iStarDegreeEffect = 11;
               break;
            case 4:
               iStarDegreeEffect = 14;
               break;
            case 5:
               iStarDegreeEffect = 17;
               break;
            case 6:
               iStarDegreeEffect = 20;
               break;
            case 7:
               iStarDegreeEffect = 24;
               break;
            case 8:
               iStarDegreeEffect = 28;
               break;
            case 9:
               iStarDegreeEffect = 32;
               break;
            case 10:
               iStarDegreeEffect = 38;
               break;
            case 11:
               iStarDegreeEffect = 45;
               break;
            case 12:
               iStarDegreeEffect = 52;
               break;
            case 13:
               iStarDegreeEffect = 59;
               break;
            case 14:
               iStarDegreeEffect = 65;
               break;
            case 15:
               iStarDegreeEffect = 72;
               break;
            case 16:
               iStarDegreeEffect = 79;
         }
         return iStarDegreeEffect;
      }
   }
}


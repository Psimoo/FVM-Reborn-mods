package com.aurora.ui.maogoutd.resource.defender.DragonYear.LingyuMocha
{
   public class LingyuMochaDefine
   {
      
      internal static const DEFENSE_PRICE:int = 375;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 75;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 100;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function LingyuMochaDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 60;
               break;
            case 1:
               iStarDegreeEffect = 58;
               break;
            case 2:
               iStarDegreeEffect = 56;
               break;
            case 3:
               iStarDegreeEffect = 54;
               break;
            case 4:
               iStarDegreeEffect = 52;
               break;
            case 5:
               iStarDegreeEffect = 50;
               break;
            case 6:
               iStarDegreeEffect = 48;
               break;
            case 7:
               iStarDegreeEffect = 45;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 39;
               break;
            case 10:
               iStarDegreeEffect = 36;
               break;
            case 11:
               iStarDegreeEffect = 32;
               break;
            case 12:
               iStarDegreeEffect = 28;
               break;
            case 13:
               iStarDegreeEffect = 24;
               break;
            case 14:
               iStarDegreeEffect = 20;
               break;
            case 15:
               iStarDegreeEffect = 15;
               break;
            case 16:
               iStarDegreeEffect = 10;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


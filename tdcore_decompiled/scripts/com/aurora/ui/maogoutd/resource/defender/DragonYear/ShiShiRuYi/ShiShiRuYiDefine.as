package com.aurora.ui.maogoutd.resource.defender.DragonYear.ShiShiRuYi
{
   public class ShiShiRuYiDefine
   {
      
      internal static const DEFENSE_PRICE:int = 140;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 75;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 100;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function ShiShiRuYiDefine()
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
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 29;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 27;
               break;
            case 4:
               iStarDegreeEffect = 26;
               break;
            case 5:
               iStarDegreeEffect = 25;
               break;
            case 6:
               iStarDegreeEffect = 24;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 18;
               break;
            case 10:
               iStarDegreeEffect = 16;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 12;
               break;
            case 13:
               iStarDegreeEffect = 10;
               break;
            case 14:
               iStarDegreeEffect = 9;
               break;
            case 15:
               iStarDegreeEffect = 8;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


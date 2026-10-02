package com.aurora.ui.maogoutd.resource.defender.DragonYear.FlowerFireDragon
{
   public class FlowerFireDragonBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 150;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 50;
      
      public function FlowerFireDragonBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 75;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 75;
               break;
            case 1:
               iStarDegreeEffect = 81;
               break;
            case 2:
               iStarDegreeEffect = 87;
               break;
            case 3:
               iStarDegreeEffect = 93;
               break;
            case 4:
               iStarDegreeEffect = 102;
               break;
            case 5:
               iStarDegreeEffect = 111;
               break;
            case 6:
               iStarDegreeEffect = 123;
               break;
            case 7:
               iStarDegreeEffect = 135;
               break;
            case 8:
               iStarDegreeEffect = 147;
               break;
            case 9:
               iStarDegreeEffect = 159;
               break;
            case 10:
               iStarDegreeEffect = 183;
               break;
            case 11:
               iStarDegreeEffect = 207;
               break;
            case 12:
               iStarDegreeEffect = 231;
               break;
            case 13:
               iStarDegreeEffect = 267;
               break;
            case 14:
               iStarDegreeEffect = 303;
               break;
            case 15:
               iStarDegreeEffect = 375;
               break;
            case 16:
               iStarDegreeEffect = 450;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 8;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 8;
               break;
            case 1:
               iSkillDegreeEffect = 7.5;
               break;
            case 2:
               iSkillDegreeEffect = 7;
               break;
            case 3:
               iSkillDegreeEffect = 6.5;
               break;
            case 4:
               iSkillDegreeEffect = 6;
               break;
            case 5:
               iSkillDegreeEffect = 5;
               break;
            case 6:
               iSkillDegreeEffect = 4;
               break;
            case 7:
               iSkillDegreeEffect = 3;
               break;
            case 8:
               iSkillDegreeEffect = 1;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}


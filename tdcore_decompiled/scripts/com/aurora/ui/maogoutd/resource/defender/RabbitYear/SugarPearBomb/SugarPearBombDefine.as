package com.aurora.ui.maogoutd.resource.defender.RabbitYear.SugarPearBomb
{
   public class SugarPearBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 120;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 900 * 6;
      
      public function SugarPearBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 150;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 30;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 36;
               break;
            case 2:
               iStarDegreeEffect = 42;
               break;
            case 3:
               iStarDegreeEffect = 48;
               break;
            case 4:
               iStarDegreeEffect = 54;
               break;
            case 5:
               iStarDegreeEffect = 60;
               break;
            case 6:
               iStarDegreeEffect = 66;
               break;
            case 7:
               iStarDegreeEffect = 78;
               break;
            case 8:
               iStarDegreeEffect = 96;
               break;
            case 9:
               iStarDegreeEffect = 120;
               break;
            case 10:
               iStarDegreeEffect = 165;
               break;
            case 11:
               iStarDegreeEffect = 210;
               break;
            case 12:
               iStarDegreeEffect = 255;
               break;
            case 13:
               iStarDegreeEffect = 300;
               break;
            case 14:
               iStarDegreeEffect = 345;
               break;
            case 15:
               iStarDegreeEffect = 390;
               break;
            case 16:
               iStarDegreeEffect = 435;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.2;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.2;
               break;
            case 1:
               iSkillDegreeEffect = 1.15;
               break;
            case 2:
               iSkillDegreeEffect = 1.1;
               break;
            case 3:
               iSkillDegreeEffect = 1.05;
               break;
            case 4:
               iSkillDegreeEffect = 1;
               break;
            case 5:
               iSkillDegreeEffect = 0.95;
               break;
            case 6:
               iSkillDegreeEffect = 0.9;
               break;
            case 7:
               iSkillDegreeEffect = 0.85;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}


package com.aurora.ui.maogoutd.resource.defender.DragonYear.CandleYinDragon
{
   public class CandleYinDragonBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 300;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 100;
      
      public function CandleYinDragonBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 58;
               break;
            case 1:
               iSkillDegreeEffect = 55;
               break;
            case 2:
               iSkillDegreeEffect = 50;
               break;
            case 3:
               iSkillDegreeEffect = 45;
               break;
            case 4:
               iSkillDegreeEffect = 40;
               break;
            case 5:
               iSkillDegreeEffect = 35;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 20;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(starDegree:int) : int
      {
         var starDegreeEffect:int = 0;
         switch(starDegree)
         {
            case 0:
               starDegreeEffect = 8;
               break;
            case 1:
               starDegreeEffect = 9;
               break;
            case 2:
               starDegreeEffect = 10;
               break;
            case 3:
               starDegreeEffect = 13;
               break;
            case 4:
               starDegreeEffect = 16;
               break;
            case 5:
               starDegreeEffect = 19;
               break;
            case 6:
               starDegreeEffect = 23;
               break;
            case 7:
               starDegreeEffect = 27;
               break;
            case 8:
               starDegreeEffect = 30;
               break;
            case 9:
               starDegreeEffect = 35;
               break;
            case 10:
               starDegreeEffect = 40;
               break;
            case 11:
               starDegreeEffect = 50;
               break;
            case 12:
               starDegreeEffect = 60;
               break;
            case 13:
               starDegreeEffect = 70;
               break;
            case 14:
               starDegreeEffect = 80;
               break;
            case 15:
               starDegreeEffect = 90;
               break;
            case 16:
               starDegreeEffect = 100;
         }
         return starDegreeEffect * 10;
      }
   }
}


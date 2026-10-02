package com.aurora.ui.maogoutd.resource.defender.DragonYear.XiangLongRing
{
   public class XiangLongRingDefine
   {
      
      internal static const DEFENSE_PRICE:int = 165;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const POISON_ADD_HURT_VALUE:int = 35;
      
      internal static const MAX_LIFE_VALUE:int = 20 * 10;
      
      public function XiangLongRingDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 55;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 55;
               break;
            case 1:
               iStarDegreeEffect = 54;
               break;
            case 2:
               iStarDegreeEffect = 53;
               break;
            case 3:
               iStarDegreeEffect = 52;
               break;
            case 4:
               iStarDegreeEffect = 50;
               break;
            case 5:
               iStarDegreeEffect = 48;
               break;
            case 6:
               iStarDegreeEffect = 46;
               break;
            case 7:
               iStarDegreeEffect = 43;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 37;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 31;
               break;
            case 12:
               iStarDegreeEffect = 28;
               break;
            case 13:
               iStarDegreeEffect = 25;
               break;
            case 14:
               iStarDegreeEffect = 22;
               break;
            case 15:
               iStarDegreeEffect = 19;
               break;
            case 16:
               iStarDegreeEffect = 15;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetLifeValueByStarDegree(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 85;
               break;
            case 1:
               iStarDegreeEffect = 90;
               break;
            case 2:
               iStarDegreeEffect = 95;
               break;
            case 3:
               iStarDegreeEffect = 100;
               break;
            case 4:
               iStarDegreeEffect = 110;
               break;
            case 5:
               iStarDegreeEffect = 120;
               break;
            case 6:
               iStarDegreeEffect = 130;
               break;
            case 7:
               iStarDegreeEffect = 140;
               break;
            case 8:
               iStarDegreeEffect = 155;
               break;
            case 9:
               iStarDegreeEffect = 170;
               break;
            case 10:
               iStarDegreeEffect = 185;
               break;
            case 11:
               iStarDegreeEffect = 200;
               break;
            case 12:
               iStarDegreeEffect = 220;
               break;
            case 13:
               iStarDegreeEffect = 240;
               break;
            case 14:
               iStarDegreeEffect = 260;
               break;
            case 15:
               iStarDegreeEffect = 280;
               break;
            case 16:
               iStarDegreeEffect = 300;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 25;
               break;
            case 1:
               iSkillDegreeEffect = 23;
               break;
            case 2:
               iSkillDegreeEffect = 21;
               break;
            case 3:
               iSkillDegreeEffect = 19;
               break;
            case 4:
               iSkillDegreeEffect = 17;
               break;
            case 5:
               iSkillDegreeEffect = 15;
               break;
            case 6:
               iSkillDegreeEffect = 13;
               break;
            case 7:
               iSkillDegreeEffect = 11;
               break;
            case 8:
               iSkillDegreeEffect = 9;
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}


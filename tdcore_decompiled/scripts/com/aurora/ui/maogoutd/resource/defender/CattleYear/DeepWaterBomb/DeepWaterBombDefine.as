package com.aurora.ui.maogoutd.resource.defender.CattleYear.DeepWaterBomb
{
   public class DeepWaterBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 125;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 150;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 155;
      
      internal static const MAX_LIFE_VALUE:int = 1000;
      
      public function DeepWaterBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3965(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 50;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 50;
               break;
            case 1:
               iStarDegreeEffect = 48;
               break;
            case 2:
               iStarDegreeEffect = 46;
               break;
            case 3:
               iStarDegreeEffect = 44;
               break;
            case 4:
               iStarDegreeEffect = 42;
               break;
            case 5:
               iStarDegreeEffect = 40;
               break;
            case 6:
               iStarDegreeEffect = 38;
               break;
            case 7:
               iStarDegreeEffect = 35;
               break;
            case 8:
               iStarDegreeEffect = 32;
               break;
            case 9:
               iStarDegreeEffect = 29;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 23;
               break;
            case 12:
               iStarDegreeEffect = 20;
               break;
            case 13:
               iStarDegreeEffect = 17;
               break;
            case 14:
               iStarDegreeEffect = 14;
               break;
            case 15:
               iStarDegreeEffect = 11;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return iStarDegreeEffect * 10;
      }
   }
}


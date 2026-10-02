package com.aurora.ui.maogoutd.resource.defender.TigerYear.PufferFish
{
   public class PufferFishBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 325;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 95;
      
      internal static const POISON_ADD_HURT_VALUE:int = 35;
      
      internal static const MAX_LIFE_VALUE:int = 20 * 10;
      
      public function PufferFishBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3965(iSkillDegree);
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
   }
}


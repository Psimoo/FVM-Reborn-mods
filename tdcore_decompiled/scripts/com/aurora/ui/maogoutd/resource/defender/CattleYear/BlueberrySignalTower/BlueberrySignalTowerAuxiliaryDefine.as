package com.aurora.ui.maogoutd.resource.defender.CattleYear.BlueberrySignalTower
{
   public class BlueberrySignalTowerAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 160;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.2;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 50;
      
      public function BlueberrySignalTowerAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function GetlifeValueByStarDegree(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 6;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 11;
               break;
            case 2:
               iStarDegreeEffect = 16;
               break;
            case 3:
               iStarDegreeEffect = 21;
               break;
            case 4:
               iStarDegreeEffect = 26;
               break;
            case 5:
               iStarDegreeEffect = 31;
               break;
            case 6:
               iStarDegreeEffect = 36;
               break;
            case 7:
               iStarDegreeEffect = 41;
               break;
            case 8:
               iStarDegreeEffect = 46;
               break;
            case 9:
               iStarDegreeEffect = 51;
               break;
            case 10:
               iStarDegreeEffect = 56;
               break;
            case 11:
               iStarDegreeEffect = 61;
               break;
            case 12:
               iStarDegreeEffect = 66;
               break;
            case 13:
               iStarDegreeEffect = 71;
               break;
            case 14:
               iStarDegreeEffect = 76;
               break;
            case 15:
               iStarDegreeEffect = 81;
               break;
            case 16:
               iStarDegreeEffect = 86;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 13;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 13;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 15;
               break;
            case 3:
               iStarDegreeEffect = 16;
               break;
            case 4:
               iStarDegreeEffect = 17;
               break;
            case 5:
               iStarDegreeEffect = 18;
               break;
            case 6:
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 20;
               break;
            case 8:
               iStarDegreeEffect = 21;
               break;
            case 9:
               iStarDegreeEffect = 22;
               break;
            case 10:
               iStarDegreeEffect = 24;
               break;
            case 11:
               iStarDegreeEffect = 26;
               break;
            case 12:
               iStarDegreeEffect = 29;
               break;
            case 13:
               iStarDegreeEffect = 32;
               break;
            case 14:
               iStarDegreeEffect = 35;
               break;
            case 15:
               iStarDegreeEffect = 38;
               break;
            case 16:
               iStarDegreeEffect = 41;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 35;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 35;
               break;
            case 1:
               iSkillDegreeEffect = 33;
               break;
            case 2:
               iSkillDegreeEffect = 31;
               break;
            case 3:
               iSkillDegreeEffect = 29;
               break;
            case 4:
               iSkillDegreeEffect = 27;
               break;
            case 5:
               iSkillDegreeEffect = 25;
               break;
            case 6:
               iSkillDegreeEffect = 23;
               break;
            case 7:
               iSkillDegreeEffect = 20;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}


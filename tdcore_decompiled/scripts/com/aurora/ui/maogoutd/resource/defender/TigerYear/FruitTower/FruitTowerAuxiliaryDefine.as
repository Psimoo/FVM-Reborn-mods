package com.aurora.ui.maogoutd.resource.defender.TigerYear.FruitTower
{
   public class FruitTowerAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 150;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.1;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 50;
      
      public function FruitTowerAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 1;
               break;
            case 2:
               iStarDegreeEffect = 2;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 4;
               break;
            case 5:
               iStarDegreeEffect = 5;
               break;
            case 6:
               iStarDegreeEffect = 6;
               break;
            case 7:
               iStarDegreeEffect = 7;
               break;
            case 8:
               iStarDegreeEffect = 8;
               break;
            case 9:
               iStarDegreeEffect = 9;
               break;
            case 10:
               iStarDegreeEffect = 10;
               break;
            case 11:
               iStarDegreeEffect = 12;
               break;
            case 12:
               iStarDegreeEffect = 15;
               break;
            case 13:
               iStarDegreeEffect = 18;
               break;
            case 14:
               iStarDegreeEffect = 21;
               break;
            case 15:
               iStarDegreeEffect = 23;
               break;
            case 16:
               iStarDegreeEffect = 27;
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
               iSkillDegreeEffect = 17;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}


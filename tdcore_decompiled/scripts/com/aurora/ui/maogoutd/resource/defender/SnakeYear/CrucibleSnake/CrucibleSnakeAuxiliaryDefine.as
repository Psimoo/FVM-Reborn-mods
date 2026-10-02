package com.aurora.ui.maogoutd.resource.defender.SnakeYear.CrucibleSnake
{
   public class CrucibleSnakeAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 280;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.15;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 60;
      
      public function CrucibleSnakeAuxiliaryDefine()
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
               iSkillDegreeEffect = 15;
               break;
            case 1:
               iSkillDegreeEffect = 14;
               break;
            case 2:
               iSkillDegreeEffect = 13;
               break;
            case 3:
               iSkillDegreeEffect = 12;
               break;
            case 4:
               iSkillDegreeEffect = 11;
               break;
            case 5:
               iSkillDegreeEffect = 10;
               break;
            case 6:
               iSkillDegreeEffect = 9;
               break;
            case 7:
               iSkillDegreeEffect = 8;
               break;
            case 8:
               iSkillDegreeEffect = 7;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 2.2;
               break;
            case 1:
               iStarDegreeEffect = 2.3;
               break;
            case 2:
               iStarDegreeEffect = 2.4;
               break;
            case 3:
               iStarDegreeEffect = 2.5;
               break;
            case 4:
               iStarDegreeEffect = 2.6;
               break;
            case 5:
               iStarDegreeEffect = 2.7;
               break;
            case 6:
               iStarDegreeEffect = 2.8;
               break;
            case 7:
               iStarDegreeEffect = 2.9;
               break;
            case 8:
               iStarDegreeEffect = 3;
               break;
            case 9:
               iStarDegreeEffect = 3.1;
               break;
            case 10:
               iStarDegreeEffect = 3.2;
               break;
            case 11:
               iStarDegreeEffect = 3.3;
               break;
            case 12:
               iStarDegreeEffect = 3.5;
               break;
            case 13:
               iStarDegreeEffect = 3.7;
               break;
            case 14:
               iStarDegreeEffect = 3.9;
               break;
            case 15:
               iStarDegreeEffect = 4.1;
               break;
            case 16:
               iStarDegreeEffect = 4.3;
         }
         return iStarDegreeEffect;
      }
   }
}

